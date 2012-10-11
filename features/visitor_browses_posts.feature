Feature: Visitor browses posts
  In order to read blog posts
  As a visitor
  I want to be able to browse through the most recent posts as I scroll down the page

  Scenario: Browsing a list of 12 posts, only the most recent 10 posts should be displayed
    Given a post published on 2012-10-1 with the title "1st Post"
    Given a post published on 2012-10-2 with the title "2nd Post"
    Given a post published on 2012-10-3 with the title "3rd Post"
    Given a post published on 2012-10-4 with the title "4th Post"
    Given a post published on 2012-10-5 with the title "5th Post"
    Given a post published on 2012-10-6 with the title "6th Post"
    Given a post published on 2012-10-7 with the title "7th Post"
    Given a post published on 2012-10-8 with the title "8th Post"
    Given a post published on 2012-10-9 with the title "9th Post"
    Given a post published on 2012-10-10 with the title "10th Post"
    Given a post published on 2012-10-11 with the title "11th Post"
    Given a post published on 2012-10-12 with the title "12th Post"
    When I am on the homepage
    Then I should see 10 posts
    And I should see posts in this order: 12th Post, 11th Post, 10th Post, 9th Post, 8th Post, 7th Post, 6th Post, 5th Post, 4th Post, 3rd Post
    And I should not see "1st Post"
    And I should not see "2nd Post"

  Scenario: Browsing a list of 2 posts
    Given a post published on 2012-10-2 with the title "1st Post"
    Given a post published on 2012-10-1 with the title "2nd Post"
    Given an unpublished post with the title "Hidden Post"
    When I am on the homepage
    Then I should see 2 posts
    And I should see posts in this order: 1st Post, 2nd Post
    And I should not see "Hidden Post"
