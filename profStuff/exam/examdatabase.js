var examdatabase =
{
     "questiontemplate": {
        "question": "What is the answer?",
        "lquestion": "latex reformatting for questions that needed it, absent if not needed",
        "answer": "That which was asked for",
        "lanswer": "latex reformatting for answers that needed it, absent if not needed",
        "note": "optional note",
        "source": "C num -- number of class where this material was covered"
     },
  "description": "questions from which to construct the Fall 2017 quizzes in CS4472a",
  "questions": [
     {
        "question": "To illustrate the relation between testing and software design, we will look at the programming technique ANSWER",
        "answer": "test driven development",
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "An important concept we will look at related to the question of when has one done enough testing is ANSWER",
        "answer": ["coverage","mutation"],
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "It is easy to make up test inputs, but it can be tricky to know what the right output for a given input should be.  This is refered to as the ANSWER problem",
        "answer": "Oracle",
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "Testing is generally about finding errors that have already been made.  This course also covers the topic of ANSWER, which is about trying to prevent errors from being made in the first place.",
        "answer": "quality assurance",
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "The first testing framework for Ruby that we are looking at is called ANSWER",
        "answer": "minitest",
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "The first tool for checking code quality for programs written in Ruby is ANSWER, which is described as a code smell detector.",
        "answer": "reek",
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "The number of quizzes CS4472 will have this semester is ANSWER",
        "answer": "3",
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "The number of weekly practices that CS4472 will have this semester is ANSWER",
        "answer": "10",
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "The number of practice reviews that CS4472 will have this semester is ANSWER",
        "answer": "4",
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "The per cent of the total mark allocated for all the quizzes is ANSWER",
        "answer": "21",
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "The per cent of the total mark allocated for all the weekly practices is ANSWER",
        "answer": "30",
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "The per cent of the total mark allocated for all the practice reviews is ANSWER",
        "answer": "49",
        "note": "optional note",
        "source": "C1"
     },
     {
        "question": "The practice technique advocated in this class is a modification of the ANSWER",
        "answer": "Personal Software Process",
        "note": "optional note",
        "source": "C2"
     },
     {
        "question": "A main theme behind the practice technique advocated in this class is that in order to improve your programming, ANSWER",
        "answer": "you need data about your past programming",
        "note": "optional note",
        "source": "C2"
     },
     {
        "question": "A common piece of information for people interested in programmer productivity to track is ANSWER",
        "answer": ["time spent","number of lines of code written","number of defects found"],
        "note": "optional note",
        "source": "C2"
     },
     {
        "question": "Although we often think of programs as taking inputs and producing outputs, a higher level view of what is going on is to think of the programs as ANSWER about how to take inputs and produce outputs.",
        "answer": "encode knowledge",
        "note": "optional note",
        "source": "C2"
     },
     {
        "question": "The scripts that were designed to aid the practice process assume that you will be uploading a copy of your work to BitBucket every time you ANSWER",
        "answer": "record a note about your practice progress",
        "note": "optional note",
        "source": "C2"
     },
     {
        "question": "The protocols for practice expect that the longest amount of time that you will practice before recording a note is ANSWER",
        "answer": "30 minutes",
        "note": "optional note",
        "source": "C2"
     },
     {
        "question": "The total amount of practice time you can get credit for during a practice week is ANSWER",
        "answer": "3 hours",
        "note": "optional note",
        "source": "C2"
     },
     {
        "question": "The four phases of testing (according to Whittaker) are: 1) modeling the software environment, 2) selecting test cases, 3) running and checking test cases, and 4) ANSWER",
        "answer": "checking how well the testing is going",
        "note": "optional note",
        "source": "C3"
     },
     {
        "question": "The testing technique called boundary value partition starts with the notion of breaking the space of inputs into ANSWER",
        "answer": "regions of interest",
        "note": "optional note",
        "source": "C3"
     },
     {
        "question": "Structural testing is another name for ANSWER",
        "answer": ["code-based testing","white-box testing"],
        "note": "optional note",
        "source": "C3"
     },
     {
        "question": "The kind of testing we do to make sure that when we change a program we do not break something that used to work is called ANSWER",
        "answer": "regression testing",
        "note": "optional note",
        "source": "C3"
     },
     {
        "question": "Using combinatorial testing, if I have 10 binary inputs, I only need to use ANSWER test cases (each a setting of each of the 10 inputs) to expect to find 98 per cent of the errors in the program.",
        "answer": "13",
        "note": "optional note",
        "source": "C3"
     },
     {
        "question": "The ANSWER is a method developed by Watt S. Humphrey to help individuals improve their programming skills based on existing methods that had been developed to help organizations improve their product development capabilities.",
        "answer": "Personal Software Process",
        "note": "optional note",
        "source": "C3"
     },
     {
        "question": "The paper Orthogonal defect classification-a concept for in-process measurements was an example of people at IBM analyzing records of defects in order to ANSWER",
        "answer": "improve their process",
        "note": "optional note",
        "source": "C4"
     },
     {
        "question": "When multiple methods of a class have the same parameters, this is a code smell called ANSWER",
        "answer": "data clumping",
        "note": "optional note",
        "source": "C4"
     },
     {
        "question": "When multiple methods of a class have the same parameters, that generally indicates that those parameters should ANSWER",
        "answer": "be put into a class of their own",
        "note": "optional note",
        "source": "C4"
     },
     {
        "question": "MicroTest (MiniTest subset) discourages the writing of tests that depend on side-effects of the previous test by ANSWER",
        "answer": "running tests in random order",
        "note": "optional note",
        "source": "C4"
     },
     {
        "question": "MicroTest (MiniTest subset)'s usage pattern is for the test class to inherit from Test so that Class.inherited can be used to ANSWER",
        "answer": "get a list of test classes",
        "note": "optional note",
        "source": "C4"
     },
     {
        "question": "MicroTest (MiniTest subset) uses public_instance_methods to ANSWER",
        "lquestion": "MicroTest (MiniTest subset) uses public\\_instance\\_methods to ANSWER",
        "answer": "find methods that begin test\\_",
        "lanswer": "find methods that begin test\\_",
        "note": "optional note",
        "source": "C4"
     },
     {
        "question": "The TDD Cycle is ANSWER",
        "answer": "Red Green Refactor",
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "RSpec specifications are sometimes called ANSWER documentation",
        "answer": "executable",
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "Unlike MiniTest which is implemented as a class library, RSpec is implemented in Ruby as an ANSWER",
        "answer": ["domain-specific language","DSL"],
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "RSpec and Cucumber are tools designed to support the ANSWER style of software development",
        "answer": ["Behavior-driven development","BDD"],
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "The differences between RSpec and Cucumber result from the intent that Cucumber test files are meant to be readable by ANSWER",
        "answer": "the customer and the programmer",
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "The differences between RSpec and Cucumber result from the intent that RSpec test files are meant to be readable by ANSWER",
        "answer": "just the programmer",
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "The Capability Maturity Model for US government contractors distinguishes 5 levels of company software development process.  Level 1 is characterized as ANSWER",
        "answer": ["chaotic","ad hoc"],
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "The Capability Maturity Model for US government contractors distinguishes 5 levels of company software development process.  Level 5 is characterized as ANSWER",
        "answer": "continually improving",
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "Many of the ideas of the Capability Maturity Model were adapted to individual developers under the name ANSWER",
        "answer": "Personal Software Process",
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "In the Testing Maturity Model, at Level 5, we aim at ANSWER rather than defect detection",
        "answer": "defect prevention",
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "The corporate policy of developers merging their working copies into the main line of the branch repository several times a day is called ANSWER",
        "answer": "continuous integration",
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "The motivation behind multiple merges per day per developer is to ANSWER",
        "answer": "minimize merge conflicts",
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "The pattern where you create an object whose job is to create other objects (rather than using new to create other objects) is called ANSWER",
        "answer": "the factory pattern",
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "While the notation looks odd, in RSpec, ``it'' is actually implemented in Ruby as an ANSWER",
        "answer": "method",
        "note": "optional note",
        "source": "C5"
     },
     {
        "question": "In MiniTest, we write test classes that inherit from Test, but in RSpec these test classes are actually being created at runtime by ANSWER",
        "answer": "describe",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "Once RSpec has created a test class, it fills in its definition by executing the Ruby method ANSWER",
        "answer": "module_exec",
        "lanswer": "module\\_exec",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "When I say that in RSpec, expect x.to eq y, eq an object that inherits from ANSWER, meeting the requirements of to",
        "answer": "Matcher",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "Modified condition/decision coverage is often a requirement (regulatory or contractual) in ANSWER",
        "answer": ["safety-critical applications","avonic systems","automotive systems"],
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "The four requirements of MC/DC are: 1) each entry and exit point is invoked, 2) each decision takes every possible outcome, 3) each condition in a decision takes every possible outcome, and 4) ANSWER",
        "answer": "each condition in a decision is shown to independently affect the outcome of a decision",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "One study of 198 user major failure reports on 5 widely used distributed systems found statement coverage testing could have caught nearly ANSWER of the causes.",
        "answer": ["a quarter", "25 per cent", "23 per cent"],
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "One study of 198 user major failure reports on 5 widely used distributed systems found that nearly all failures were caused by coding mistakes in ANSWER",
        "answer": "the error handling code",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "One study of 100 large open source Java programs compared better code coverage with number of post-release defect reports and found ANSWER",
        "answer": "no connection",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "A study by Ahmed et al found that the probability of errors in untested code was ANSWER the probability of errors in tested code",
        "answer": "twice",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "The S in Solid stands for ANSWER",
        "answer": "single responsibility principle",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "The O in SOLID stands for ANSWER",
        "answer": "open/closed principle",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "The L in SOLID stands for ANSWER",
        "answer": "Liskov substition principle",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "The I in SOLID stands for ANSWER",
        "answer": "interface segregation principle",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "The D in SOLID stands for ANSWER",
        "answer": "dependency inversion principle",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "According to Robert Martin who first promoted the SOLID methodology, the S doesn't refer to functions, but to ANSWER",
        "answer": "roles in the business that uses the software",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "According to Michael Feathers, code that is difficult to test is ANSWER",
        "answer": "poorly designed",
        "note": "optional note",
        "source": "C6"
     },
     {
        "question": "Sandi Metz approaches unit testing of an object by first distinquishing among three different message origins: incoming, outgoing, and ANSWER",
        "answer": "sent to self",
        "note": "optional note",
        "source": "C7"
     },
     {
        "question": "Sandi Metz's approach to unit testing of objects also distinguishes two types of messages: command and ANSWER",
        "answer": "query",
        "note": "optional note",
        "source": "C7"
     },
     {
        "question": "Sandi Metz's approach to unit testing only does three kinds of tests on three of the six origin-type message categories.  She says you should ``assert the result'' on messages of the origin-type ANSWER",
        "answer": "incoming query",
        "note": "optional note",
        "source": "C7"
     },
     {
        "question": "Sandi Metz's approach to unit testing only does three kinds of tests on three of the six origin-type message categories.  She says you should ``assert the direct public side-effects'' of messages of the origin-type ANSWER",
        "answer": "incoming command",
        "note": "optional note",
        "source": "C7"
     },
     {
        "question": "Sandi Metz's approach to unit testing only does three kinds of tests on three of the six origin-type message categories.  She says you should ``expect to send'' messages of the origin-type ANSWER",
        "answer": "outgoing command",
        "note": "optional note",
        "source": "C7"
     },
     {
        "question": "The logs of the practice tasks are supposed to provide a basis for improving your process.  A major way to operationalize such improvement is to generate a checklist of things to pay more attention to in the future.  We saw an example of how to build such checklists when looking at how software companies improve their ANSWER process",
        "answer": "code review",
        "note": "optional note",
        "source": "C7"
     },
     {
        "question": "When considering mocking for tests, we should consider the reason for the test itself.  For example, if we are doing acceptance tests for a customer, then mocking is ANSWER",
        "answer": "not appropriate",
        "note": "optional note",
        "source": "C7"
     },
     {
        "question": "When considering mocking for tests, we should consider the reason for the test itself.  For example, if we are doing tests to prevent a bug from returning to the code base, then the amount of reality we need in the test is ANSWER",
        "answer": "only enough to reproduce the bug",
        "note": "optional note",
        "source": "C7"
     },
     {
        "question": "When considering mocking for tests, we should consider the reason for the test itself.  For example, if we are doing acceptance tests for a customer, then mocking is ANSWER",
        "answer": "not appropriate",
        "note": "optional note",
        "source": "C7"
     },
     {
        "question": "If we are mocking a third party API, this can cause the problem that ANSWER",
        "answer": "the third party API might change and the change not be reflected in the tests",
        "note": "optional note",
        "source": "C7"
     },
     {
        "question": "When testing, it is important to realize that the program that is being tested is not some random piece of code generated by a room of monkeys with keyboards, but rather than it is probably pretty close to being correct.  This assumption is called ANSWER",
        "answer": "the competant programmer hypothesis",
        "note": "optional note",
        "source": "C8"
     },
     {
        "question": "An important assumption in testing is that although any particular program failure may result from a complex sequence of events, there is generally a first event that if it hadn't gone wrong the failure wouldn't have occurred.  Thus it is sufficient to test for these simple event failures rather than having to build tests targetted at complicated interaction failures.  This effect is called ANSWER ",
        "answer": "the coupling effect",
        "note": "optional note",
        "source": "C8"
     },
     {
        "question": "We know that if a line of code hasn't been executed by at least one of our tests, there are major gaps in our testing.  However, missing lines of code are not very common errors for programmers to actually make.  Much more likely is for a programmer to make a typo.  Checking a test suite to see if it can find all typos is the idea behind ANSWER testing",
        "answer": "mutation",
        "note": "optional note",
        "source": "C8"
     },
     {
        "question": "Defect causal analysis involves the following steps: select problem sample, classify selected problems, identify systematic errors, ANSWER, develop action proposals, and document meeting results",
        "answer": "determine principal cause",
        "note": "optional note",
        "source": "C8"
     },
     {
        "question": "In defect causal analysis, the information you are trying to extract from the problem reports in order to classify them are: when the defect that caused the problem was inserted into the software; when the problem was detected; and ANSWER",
        "answer": ["what type of mistake was made","what type of defect was introduced"],
        "note": "optional note",
        "source": "C8"
     },
     {
        "question": "In the talk Cucumbers Have Layers, A Love Story, it was advocated that one do BDD testing with both cucumber and rspec on the same project.  The role of cucumber would be to provide the customer ANSWER tests and the role of rspec would be to provide the unit tests",
        "answer": "acceptance",
        "note": "optional note",
        "source": "C9"
     },
     {
        "question": "In The Principles Behind the Agile Manifesto, the overriding theme is to satisfy the customer through ANSWER",
        "answer": "early and continuous delivery of valuable software",
        "note": "optional note",
        "source": "C9"
     },
     {
        "question": "Any agile team must refine and reflect as it goes along, ANSWER in its local circumstances",
        "answer": "constantly improving its practices",
        "note": "optional note",
        "source": "C9"
     },
     {
        "question": "The version of Agile that we looked at in class and that lead to the development of cucumber envisions interacting with the customer in a structured way through the discussion of ANSWER",
        "answer": "user stories",
        "note": "optional note",
        "source": "C9"
     },
     {
        "question": "In our Agile approach to determining what tasks we are to do for the customer next, the high level information that we want from the customer is what is the anticipated role in the organization of the person who would do the task, what is it that they want to do, and ANSWER",
        "answer": ["what benefit they expect to get from the task","what reward they expect to get from the task"],
        "note": "optional note",
        "source": "C9"
     },
     {
        "question": "In the discussion of extreme programming, one core practice that was presented was ANSWER.  Here the idea is that projects with few delivery points often produce last minute ``death marches'' that produce poor code just to meet the minimal requirements to claim that made the target.  Extreme programming wants to avoid this sort of last minute panic coding.",
        "answer": "sustainable pace",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "In the discussion of extreme programming, one core practiceof interest was ANSWER.  It was claimed that it produced better code quicker, most programmers were happy with it, and it help distribute project information across the team.",
        "answer": "pair programming.",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "In the discussion of extreme programming, one core practice of interest was ANSWER.  By this they meant that one should establish overriding themes for projects that then drive common systems of names making it easier to find things in the code.",
        "answer": "metaphor",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "When developing tasks with the customer, one approach to what good tasks for the team to undertake look like is covered by the INVEST acronym.  The I stands for independent.  This means that a task shouldn't depend on ANSWER",
        "answer": "other tasks",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "When developing tasks with the customer, one approach to what good tasks for the team to undertake look like is covered by the INVEST acronym.  The S stands for small.  Before cucumber was developed, this often meant that such a task was written on ANSWER to make them quick to read and easy to tack up on a scheduling board.",
        "answer": "an index card",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "In Confident Code, Avi Grimm presented techniques for refactoring code to improve its readability, i.e., narrative structure.  One approach is to replace usages of nil with a special ANSWER that responds to messages by just returning itself.  This means method invocations can be pipelined with constant checks that the previous stage didn't produce a nil.",
        "answer": "Null Object",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "The Confident Code talk discussed many ways to avoid using nil in code -- which tends to require other pieces of code to worry about whether they have recieved a nil.  In addition to returning an object that returns itself in response to any message, the other major approach is to ANSWER",
        "answer": "raise an error",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "In Confident Code, there was a general advocacy of minimizing the use of if.  It was claimed that this helps testing because ANSWER.",
        "answer": ["there are fewer paths that have to be covered","there are fewer paths to test"],
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "Many people have noticed that Ruby doesn't have static types like Java.  However, it is possible to insert type definitions into Ruby code using the DSL ANSWER",
        "answer": "contracts",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "When using the Ruby DSL for dynamic types, one can use builtin types like Num, but one can also define one's own types, like Even that requires a value of that type to be an even number.  To do this, we create a class Even that contains the method ANSWER, which checks to see if its input parameteris even.",
        "answer": "valid?",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "Amanda Laucher gave an interesting talk on Types vs Tests.  Her view was that whether you used a type or a test to check some property of a program depended on the kind of property involved.  If the property was that something specific exists, then you would ensure this with ANSWER",
        "answer": "a test",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "Amanda Laucher gave an interesting talk on Types vs Tests.  Her view was that whether you used a type or a test to check some property of a program depended on the kind of property involved.  If the property was that something always had a certain quality, then you would ensure this with ANSWER",
        "answer": "a type",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "Amanda Laucher gave an interesting talk on Types vs Tests.  She seemed to indicate that one of the reasons we do so much testing is because the type systems in the languages we use (such as Java) are not expressive enough.  Although she mentioned many languages that were experimental research sort of languages; she mentioned ANSWER as the common language for people who are really into types.",
        "answer": "Haskell",
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "The most primitive web testing system we talked about in class was ANSWER",
        "answer": ["selenium","selenium webdriver"],
        "note": "optional note",
        "source": "C10"
     },
     {
        "question": "The main high level web testing notation that cucumber and rspec use is ANSWER",
        "answer": "capybara",
        "note": "optional note",
        "source": "C10"
     },


    null
  ]
}
