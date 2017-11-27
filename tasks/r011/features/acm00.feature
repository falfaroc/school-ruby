Feature: testing BeanCounter program

Scenario Outline: input guess (<input>), return expected winner (<result>)
  Given I am computing the BeanCounter
  When I input <input>
  Then I get back <result>

  Examples:
    |                        input                         |                  result                 |
    |    "A a:6,c:6\nB w:12\nC d:25\nD d:22,c:4,l:3,f:15"  |       "A: 3.20\nB: 3.20\nD: 9.60"       |