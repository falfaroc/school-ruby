Feature: examples of usage of GCD

Scenario Outline: checks to see if (<input_1>,<input_2>) input, returns <result>
  Given that I am calculating GCD
  When I input the numbers <input_1> and <input_2>
  Then I get back <result>

  Examples:
    | input_1 | input_2 | result |
    |    1    |    2    |   1    |
    |    6    |    8    |   2    |
    |   100   |   101   |   1    |
    |   12    |   20    |   4    |
    |   12    |   60    |   12   |