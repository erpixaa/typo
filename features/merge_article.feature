Feature: Merge Articles
  As a blog administrator
  In order to put two articles in one
  I want to merge articles

Background: articles have been added to database
  Given the blog is set up
  Given the following articles exist:
    | title  | author | body           | published | id |
    | first  | joe    | the first blog | t         | 2  |
    | second | joe    | the secon blog | t         | 3  |

Scenario: Non admin cannot merge articles
  Given I am logged as no admin
  And I am on the edit article page for "Hello World!"
  Then I should not see "Merge Articles"

Scenario: Merge non existing article
  Given I am on the edit article page for "Hello World!"
  And I am logged into the admin panel
  Then I should see "Merge Articles"
  And I fill in "merge_with" with "122"
  And I press "Merge"
  Then I should see "Not a valid Article ID"

Scenario: Merged Article should contain one author
  Given I am on the edit article page for "first"
  And I am logged into the admin panel
  Then I should see "Merge Articles"
  And I enter the ID of "second" into the merge field
  And I press "Merge"
  Then I should be on the admin content page
  Then I should see "joe"

Scenario: Merged Article should have one title
  Given I am on the edit article page for "first"
  And I am logged into the admin panel
  Then I should see "Merge Articles"
  And I enter the ID of "second" into the merge field
  And I press "Merge"
  Then I should be on the admin content page
  When I follow "first"
  Then I should see "first"

Scenario: Merged Article should have both texts
  Given I am on the edit article page for "first"
  And I am logged into the admin panel
  Then I should see "Merge Articles"
  And I enter the ID of "second" into the merge field
  And I press "Merge"
  Then I should be on the admin content page
  When I follow "first"
  Then I should see "the first blog"
  Then show me the page
  And I should see "the secon blog"