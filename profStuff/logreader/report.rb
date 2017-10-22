require 'forwardable'

# class for handling RPT: related methods for a commit without an RPT:
class NilRpt
   def initialize(commit)
      @commit = commit
   end

   def print(ignore)
      no_op @commit, ignore
   end

   def time
      "UNKNOWN_TIME"
   end

   def task
      "UNKNOWN_TASK"
   end

   def perform_command(commit)
      no_op @commit, commit
   end

   def ignore
      no_op @commit
   end

   def update_task_and_time(task, time)
      no_op task, time
      @commit.error_message "attempt to update non-RPT: commit"
   end
end

# methods for the information on the RPT: line of a commit
class RptData
   def initialize(line)
      @task = "UNKNOWN_TASK"
      @time = "UNKNOWN_TIME"
      @hash_value = "UNKNOWN_SHA1"
      rpt_data = line.gsub(/RPT:/,"").strip.lines " "
      @command = rpt_data.fetch(0,"").strip
      if @command.eql? "ignore"
         process_ignore rpt_data   
      elsif @command.eql? "update"
         process_update rpt_data
      else
         @command = "plain"
         process_plain rpt_data
      end
   end

   def update_task_and_time(task, time)
      @time = time
      @task = task
   end

   def process_ignore(rpt_data)
      @hash_value = rpt_data.fetch(1,"UNKNOWN_SHA1").strip
   end

   def process_update(rpt_data)
      @hash_value = rpt_data.fetch(1,"UNKNOWN_SHA1").strip
      rpt_data_copy = Array.new rpt_data
      rpt_data_copy.shift 2
      process_plain rpt_data_copy
   end

   def process_plain(rpt_data)
      @task = rpt_data.fetch(0,"UNKNOWN_TASK").strip
      @time = rpt_data.fetch(1,"UNKNOWN_TIME").strip
   end

   def time
      @time
   end

   def task
      @task
   end

   def perform_command(commit)
      if @command.eql? "ignore"
         perform_ignore commit
      elsif @command.eql? "update"
         perform_update commit
      end
   end

   def perform_ignore(commit)
      hash_table = commit.hash_table
      if hash_table.has_key? @hash_value
         initialize_time_and_task
         target = hash_table[@hash_value]
         target.message_from_ignore "A LATER COMMIT SAYS TO IGNORE THIS COMMIT"
      else 
         commit.error_message "perform_ignore could not find commit with hash " + @hash_value
      end
   end

   def perform_update(commit)
      hash_table = commit.hash_table
      if hash_table.has_key? @hash_value
         target = hash_table[@hash_value]
         target.receive_update_from commit, @task, @time
         initialize_time_and_task
      else 
         commit.error_message "perform_update could not find commit with hash " + @hash_value
      end
   end

   def initialize_time_and_task
      @time = "UNKNOWN_TIME"
      @task = "UNKNOWN_TASK"
   end
end

# methods for commits that contain RPT: line
class Rpt
   def initialize(commit, line)
      @commit = commit
      @line = line
      @rpt_data = RptData.new line
      @ignore = false
   end

   def update_task_and_time(task, time)
      @rpt_data.update_task_and_time task, time
   end

   def time
      if @ignore
         "UNKNOWN_TIME"
      else
         @rpt_data.time
      end
   end

   def task
      if @ignore
         "UNKNOWN_TASK"
      else
         @rpt_data.task
      end
   end

   def print(config)
      @commit.print config
   end

   def ignore
      @ignore = true
   end

   def perform_command(commit)
      @rpt_data.perform_command commit if not @ignore
   end
end

# handling the headers of a commit
class CommitHeaders
   def initialize(commit, author, date)
      @commit = commit
      @author = author
      @date = date
   end

   def update_author(author)
      @author = author
   end

   def update_date(date)
      @date = date
   end

   def extract_hash
      commit_data = @commit.gsub(/commit/,"").strip.lines " "
      hash = commit_data.fetch(0,"UNKNOWN_SHA1").strip
   end

   def update_hash_index(hash_index, commit)
      hash_index[self.extract_hash] = commit
      hash_index
   end

   def print(config)
      config.puts @commit
      config.puts @author
      config.puts @date
   end
end

# handling a single commit
class Commit
   extend Forwardable
   def_delegators :@headers, :update_author, :update_date, :update_hash_index
   def_delegator :@rpt, :time
   
   def initialize(commit, author, date, body)
      @headers = CommitHeaders.new commit, author, date
      @body = body
      @rpt = NilRpt.new self
      @hash_table = Hash.new
   end
   
   def body
      @body
   end

   def hash_table
      @hash_table
   end

   def receive_update_from(commit, task, time)
      @body.concat commit.body
      @rpt.update_task_and_time task, time
   end

   def error_message(message)
      @body.insert 0, "ERROR: " + message
   end

   def message_from_ignore(message)
      @rpt.ignore
      @body.insert 0, "MESSAGE_FROM_IGNORE: " + message
   end

   def append_to_body(line)
      @body.push line
   end

   def finish_body
      @rpt = find_rpt
   end

   def find_rpt
      @body.each do | line |
         return Rpt.new self, line if line.include? "RPT:"
      end
      NilRpt.new self
   end

   def print(config)
      @headers.print config
      config.print_list @body
   end

   def print_raw_rpt(config)
      @rpt.print config
   end

   def perform_command(hash_table)
      @hash_table = hash_table
      @rpt.perform_command self
   end
end

# breaks up the git log into a sequence of commits
class ParseInput
   def initialize(input)
      @input = input
      @commit_list = []
   end

   def parse
      @input.each_line do | line |
          if line.start_with? "commit " 
             @commit_list.last.finish_body if @commit_list.length > 0
             @commit_list.push Commit.new line, "", "", []
          else
             process_after_commit_line line
          end
      end
      @commit_list
   end

   def process_after_commit_line(line)
      if line.start_with? "Author: " 
         @commit_list.last.update_author line
      else
         process_after_author_line line
      end
   end

   def process_after_author_line(line)
      if line.start_with? "Date: " 
         @commit_list.last.update_date line
      else
         process_after_date_line line
      end
   end

   def process_after_date_line(line)
      @commit_list.last.append_to_body line
   end
end

# handles operations applied to all the commits in the git log
class Commits
   def initialize(config, input)
      @config = config
      @commits = ParseInput.new(input).parse
   end

   def print
      @commits.each do | commit |
         commit.print @config
      end
   end

   def print_raw_rpt
      @commits.each do | commit |
         commit.print_raw_rpt @config
      end
   end

   def sum_times
      sum = 0.0;
      @commits.each do | commit |
         sum = sum + @config.clamp_time(commit.time)
      end
      sum
   end

   def perform_commands
      hash_index = self.build_hash_index
      @commits.reverse.each do | commit |
         commit.perform_command hash_index
      end
      self
   end

   def build_hash_index
      hash_index = Hash.new
      @commits.each do | commit |
         hash_index = commit.update_hash_index hash_index, commit
      end
      hash_index
   end
end

# centralizes the way reports are generated
class GitReport
   def initialize(config)
      @config = config
      stdout = config.get_git_data
      @commits = Commits.new config, stdout
   end

   def echo_report
      @commits.print
   end

   def raw_rpt_report
      @commits.print_raw_rpt
   end

   def sum_report
      time = @commits.sum_times
      @config.puts "total time reported is: " + time.to_s
   end

   def perform_commands
      @commits.perform_commands
      self
   end
end

# produces the report of the RPT: data after processing commands
class RptReport
   def initialize(data)
      @data = data
   end

   def report
      @data.perform_commands.raw_rpt_report
   end
end

# produces the report that shows only the RPT: commits without processing
class RawRptReport
   def initialize(data)
      @data = data
   end

   def report
      @data.raw_rpt_report
   end
end

# produces the basic report of just echoing the git log
class EchoReport
   def initialize(data)
      @data = data
   end

   def report
      @data.echo_report
   end
end

# produces the report that is the sum of time entries after commands processed
class SumTimeReport
   def initialize(data)
      @data = data
   end

   def report
      @data.perform_commands.sum_report
   end
end

# tracks basic system features such as how floats and i/o is handled
class SystemParameters
   def initialize
      @float_precision = 3
      @error_out = STDERR
      @standard_out = STDOUT
   end

   def to_f(value)
     value.to_f.round @float_precision
   end

   def puts(message)
     @standard_out.puts message
   end

   def puterr(message)
      @error_out.puts message
      puts ">>Problem occurred while processing this stage of file>> " + message
   end

   def print_list(lines)
      lines.each do | line |
         puts line
      end
   end
end

# manages restriction on time values
class TimeLimits
   def initialize
      @max_entry_time = 30.0
      @max_week_time = 180.0
   end
 
   def valid_time_entry?(time_entry)
      float_time_entry = time_entry.to_f
      (0.0 <= float_time_entry) && (float_time_entry <= @max_entry_time)
   end
 
   def clamp_time(time_entry)
      float_time_entry = time_entry.to_f
      float_time_entry = @max_entry_time if float_time_entry > @max_entry_time
      float_time_entry
   end

   def fraction_of_week_max(time_entry)
      float_time_entry = time_entry.to_f
      float_time_entry / @max_week_time
   end
end

# manages how the git log that the program processes is retrieved
class GitSource
   def initialize
      @git_from_file = false
      @file_name = "windowsLogFile"
   end

   def file_read
      IO.read @file_name
   end

   def run_git
      `git --no-pager log --reverse`
   end

   def get_git_data
      if @git_from_file 
         stdout = file_read
      else
         stdout = run_git
      end
   end
end
 
# manages configuration information
class ReportConfig
   extend Forwardable
   def_delegators :@system_parameters, :to_f, :puts, :puterr, :print_list
   def_delegators :@time_limits, :value_time_entry, :clamp_time, :fraction_of_week_max
   def_delegator :@git_source, :get_git_data

   def initialize(arg_list)
      @system_parameters = SystemParameters.new
      @time_limits = TimeLimits.new
      @git_source = GitSource.new
      @report_type = EchoReport

      if arg_list.include? "sum_time" 
         @report_type = SumTimeReport
      elsif arg_list.include? "raw_rpt_report" 
         @report_type = RawRptReport
      elsif arg_list.include? "rpt_report" 
         @report_type = RptReport
      end
   end

   def produce_report(data)
      @report_type.new(data).report
   end
end

# useful for Nil classes when you want methods to do nothing
def no_op(*ignore)
   ignore
   nil
end

config = ReportConfig.new ARGV
data = GitReport.new config
config.produce_report data
