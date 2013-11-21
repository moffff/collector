Feature: Currencies
  In order to create the only complete private currency collection in the world
  Mr. Smart wants to manage all currencies in app

  Scenario: Identifying available currencies
    Given I am Mr. Smart
    Given the following currencies exist:
      | name  | code  |
      | name1 | code1 |
      | name2 | code2 |
      | name3 | code3 |
    And I am visited the page with all currencies
    Then I should see the following currencies:
      | Name  | Code  |
      | name1 | code1 |
      | name2 | code2 |
      | name3 | code3 |

  Scenario: Identifying the countries that offer a particular currency
    Given I am Mr. Smart
    Given the following currencies exist:
      | name  | code  |
      | name1 | code1 |
      | name2 | code2 |
      | name3 | code3 |
    Given the following coutries exist:
      | name          | code          | currency_code  |
      | country_name1 | country_code1 | code1          |
      | country_name2 | country_code2 | code2          |
      | country_name3 | country_code3 | code1          |
    And I am visited the page with all currencies
    Then I click on currency with name 'name1'
    And I should see the country 'country_name1' and code 'country_code1'
    And I should see the country 'country_name3' and code 'country_code3'

