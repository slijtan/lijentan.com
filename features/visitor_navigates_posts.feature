Feature: Visitor can navigate posts
  In order to navigate through blog posts
  As a visitor
  I want to be able to see a navigation bar that helps me search and jump to the posts that I am trying to find

  Scenario: When the page is loaded the user sees a navigation bar with the visible posts displayed in order
    Given 12 posts that were published in order with title format "Post #"
    When I am on the homepage
    Then I should see a nav bar with posts in this order: Post 12, Post 11, Post 10, Post 9, Post 8, Post 7, Post 6, Post 5, Post 4, Post 3

  Scenario: The nav bar should display a posts title and the time that it was published
    Given the following post records
    | title             | date_published     | published |
    | This is the title | 2012-10-1 10:10:10 | true      |
    When I am on the homepage
    Then I should see in the nav bar "This is the title"
    And I should see in the nav bar "October 1"

  @wip
  Scenario: Posts with hidden headers display properly in nav

  @wip
  Scenario: Clicking on a nav item brings the visitor to that post
