Feature: Categories Page
  As a blog administrator
  In order to add and edit blogging categories
  I want to be able to access categories page

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Access the categories page
    Given I am on the categories page
    Then show me the page