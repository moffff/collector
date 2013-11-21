Feature: Countries
  In order to create the only complete private currency collection in the world
  Mr. Smart wants to manage all currencies and countries in app

  Scenario: Identifying the remaining countries from the currency list
    Given I am Mr. Smart
    Given the following currencies exist:
      | name  | code  |
      | name1 | code1 |
      | name2 | code2 |
      | name3 | code3 |
    Given the following coutries exist:
      | name          | code          | currency_code |
      | country_name1 | country_code1 | code1         |
      | country_name2 | country_code2 | code2         |
      | country_name3 | country_code3 | code2         |
      | country_name4 | country_code4 | code2         |
      | country_name5 | country_code5 | code3         |
      | country_name6 | country_code6 | code3         |
    Given the following visited coutries exist:
      | code          |
      | country_code2 |
      | country_code3 |
      | country_code5 |
      | country_code6 |
    And I am visited the page with all currencies
    And I should see 0 visited countries for currency 'name1'
    And I should see 1 remaining countries for currency 'name1'
    And I should see 1 available countries for currency 'name1'

    And I should see 2 visited countries for currency 'name2'
    And I should see 1 remaining countries for currency 'name2'
    And I should see 3 available countries for currency 'name2'

    And I should see 2 visited countries for currency 'name3'
    And I should see 0 remaining countries for currency 'name3'
    And I should see 2 available countries for currency 'name3'

  Scenario: Tracking visited countries
    Given I am Mr. Smart
    Given the following currencies exist:
      | name  | code  |
      | name1 | code1 |
      | name2 | code2 |
      | name3 | code3 |
    Given the following coutries exist:
      | name          | code          | currency_code |
      | country_name1 | country_code1 | code1         |
      | country_name2 | country_code2 | code2         |
      | country_name3 | country_code3 | code3         |
    And I am visited the page with all currencies
    Then I click on currency with name 'name1'
    And I should see 'country_name1 - not visited'
    Then I click on 'Change status to visited!' link for country 'country_name1'
    And I should see 'country_name1 - visited'

