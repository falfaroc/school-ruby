Feature: testing prime factors program

Scenario Outline: input prime factor (<input>), return prime_factor calculation (<result>)
  Given I am computing the prime factors
  When I input <input>
  Then I get back <result>

  Examples:
    |   input  |      result     |
    |     3    |       "3"       |
    |     8    |     "2,2,2"     |
    |  901255  |  "5,17,23,461"  |