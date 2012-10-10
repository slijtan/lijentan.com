Feature: Visitor browses posts
  In order to read blog posts
  As a visitor
  I want to be able to browse through the most recent 10 posts as I scroll down the page

  Scenario: Browsing a list of posts
    Given a post with the title "The Blue Angels"
    Given a post with the title "Summatime in the SFC"
    When I am on the homepage
    Then I should see "The Blue Angels"
    And I should see "Summatime in the SFC"