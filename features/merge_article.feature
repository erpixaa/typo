Feature: Merge Articles
  As a blog administrator
  In order to put two articles in one
  I want to merge articles

Background: articles have been added to database
  Given the blog is set up
  Given the following articles exist:
    | title      |         body           |
    | Hey World  | my first public content|
    | Hey World 2| my secon public content|

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
  Given I am on the edit article page for "Hey World"
  And I am logged into the admin panel
  Then I should see "Merge Articles"
  And I enter the ID of "Hey World 2" into the merge field
  And I press "Merge"
  Then I should be on the admin content page
  Then show me the page
  When I follow "Hey World"
  Then I should see "admin"

Scenario: Merged Article should have one title
  Given I am on the edit article page for "Hey World"
  And I am logged into the admin panel
  Then I should see "Merge Articles"
  And I enter the ID of "Hey World 2" into the merge field
  And I press "Merge"
  Then I should be on the admin content page
  When I follow "Hey World"
  Then show me the page
  Then I should see "Hey World"

Scenario: Merged Article should have both texts
  Given I am on the edit article page for "Hello World!"
  And I am logged into the admin panel
  Then I should see "Merge Articles"
  And I enter the ID of "Hey World" into the merge field
  And I press "Merge"
  Then I should be on the admin content page
  When I follow "Hello World!"
  Then I should see "Welcome to Typo. This is your first article. Edit or delete it, then start blogging!"
  And I should see "my first public content"