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

  Scenario: Browsing a post with a shifting background
    Given a post with a shifting background and the title "Shifting Background"
    Given a post with the title "Fixed Background"
    When I am on the homepage
    Then I should see 2 posts
    And I should see "Shifting Background" with a shifting background
    And I should see "Fixed Background"

  Scenario: Browsing a post with a colored background
    Given a post with a colored background and the title "Colored Background"
    Given a post with the title "Fixed Background"
    When I am on the homepage
    Then I should see 2 posts
    And I should see "Colored Background" with a colored background
    And I should see "Fixed Background"

  Scenario: Browsing a post that is a quote
    Given a post with a quote and the style quote-big
    When I am on the homepage
    Then I should see 1 post
    And I should see a blockquote tag with the class "quote-big"

  Scenario: Browsing multiple posts with "auto" space and no background images
    Given a post published on 2012-10-5 with the title "1st Post"
    Given a post published on 2012-10-4 with the title "2nd Post"
    Given a post published on 2012-10-3 with the title "3rd Post"
    Given a post published on 2012-10-2 with the title "4th Post"
    When I am on the homepage
    The post titled "1st Post" should have a "midground" space
    The post titled "2nd Post" should have a "foreground" space
    The post titled "3rd Post" should have a "background" space
    The post titled "4th Post" should have a "midground" space




  Scenario: Any post that doesnt have an "auto" space should set the next post up with an "auto" correctly in the space cycle
    Given a post published on 2012-10-5 with the title "1st Post" with "auto" space
    Given a post published on 2012-10-4 with the title "2nd Post" with "background" space
    Given a post published on 2012-10-3 with the title "3rd Post" with "auto" space
    Given a post published on 2012-10-2 with the title "4th Post" with "auto" space
    Given a post published on 2012-10-1 with the title "5th Post" with "foreground" space
    Given a post published on 2012-09-30 with the title "6th Post" with "auto" space
    Given a post published on 2012-09-29 with the title "7th Post" with "midground" space
    Given a post published on 2012-09-28 with the title "8th Post" with "auto" space
    When I am on the homepage
    The post titled "1st Post" should have a "midground" space
    The post titled "2nd Post" should have a "background" space
    The post titled "3rd Post" should have a "midground" space
    The post titled "4th Post" should have a "foreground" space
    The post titled "5th Post" should have a "foreground" space
    The post titled "6th Post" should have a "background" space
    The post titled "7th Post" should have a "midground" space
    The post titled "8th Post" should have a "foreground" space
