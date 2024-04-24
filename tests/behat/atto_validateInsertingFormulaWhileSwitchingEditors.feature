@mtmoodle-88 @atto @atto_wiris @wiris_mathtype @4.x @atto_edit_formula @atto_multiple_instances
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
  Scenario: User opens ChemType editor with MathType editor already open
    And I am on "Course 1" course homepage with editing mode on
    And I add a "Page" to section "0" using the activity chooser
    And I set the following fields to these values:
      | Name | Test Multiple Editors for Atto on Moodle |
    And I press "MathType" in "Page content" field in Atto editor
    And I wait until MathType editor is displayed
    And I wait "1" seconds
    And I press "ChemType" in "Page content" field in Atto editor
    And I set MathType formula to '<math><mi mathvariant="normal">H</mi><mn>2</mn><mi mathvariant="normal">O</mi></math>'
    And I wait "1" seconds
    And I press accept button in MathType Editor
    And I press "Save and display"
    And I wait "1" seconds
    And I wait until Wirisformula formula exists
    Then ChemType formula should exist
    And Wirisformula should has height 19 with error of 2

  @javascript
  Scenario: User opens MathType editor with ChemType editor already open
    And I am on "Course 1" course homepage with editing mode on
    And I add a "Page" to section "0" using the activity chooser
    And I set the following fields to these values:
      | Name | Test Multiple Editors for Atto on Moodle |
    And I press "ChemType" in "Page content" field in Atto editor
    And I wait until MathType editor is displayed
    And I wait "1" seconds
    And I press "MathType" in "Page content" field in Atto editor
    And I set MathType formula to '<math><mfrac><mn>1</mn><msqrt><mn>2</mn><mi>&#x3c0;</mi></msqrt></mfrac></math>'
    And I wait "1" seconds
    And I press accept button in MathType Editor
    And I press "Save and display"
    And I wait "1" seconds
    And I wait until Wirisformula formula exists
    Then a Wirisformula containing 'square root' should exist
    And Wirisformula should has height 48 with error of 2