@4.x @atto @atto_wiris @wiris_mathtype @atto_insert_formula @mtmoodle-59
Feature: Insert MathType formula with atto editor
In order to check if MathType formula can be displayed correctly
As an admin
I need to create a MathType formula

  Background:
    Given the following config values are set as admin:
      | config | value | plugin |
      | toolbar | math = wiris | editor_atto |
    And the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1        | topics |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | admin  | C1     | editingteacher |
    And the "wiris" filter is "on"
    And the "mathjaxloader" filter is "off"
    And the "urltolink" filter is "off"
    And I log in as "admin"

  @javascript
  Scenario: MTMOODLE-59 - User inserts MathType with atto
    And I am on "Course 1" course homepage with editing mode on
    And I add a "Page" to section "0" using the activity chooser
    And I set the following fields to these values:
      | Name | Test WirisFormula for Atto on Moodle |
    And I press "MathType" in "Page content" field in Atto editor
    And I wait until MathType editor is displayed
    And I wait "1" seconds
    And I click on MathType right to left button
    And I set MathType formula to '<math><msqrt><mn>2</mn></msqrt></math>'
    And I wait "1" seconds
    And I press accept button in MathType Editor
    And I press "Save and display"
    And I wait "1" seconds
    Then I wait until Wirisformula formula exists
    Then a Wirisformula containing 'right to left square root' should exist
