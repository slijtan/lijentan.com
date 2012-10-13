Feature: Visitor can view posts
  In order to read blog posts
  As a visitor
  I want to be able to browse through the most recent posts as I scroll down the page

  Scenario: Browsing a list of 12 posts, only the most recent 10 posts should be displayed
    Given the following post records
    | title     | date_published | published |
    | 1st Post  |      2012-10-1 | true      |
    | 2nd Post  |      2012-10-2 | true      |
    | 3rd Post  |      2012-10-3 | true      |
    | 4th Post  |      2012-10-4 | true      |
    | 5th Post  |      2012-10-5 | true      |
    | 6th Post  |      2012-10-6 | true      |
    | 7th Post  |      2012-10-7 | true      |
    | 8th Post  |      2012-10-8 | true      |
    | 9th Post  |      2012-10-9 | true      |
    | 10th Post |     2012-10-10 | true      |
    | 11th Post |     2012-10-11 | true      |
    | 12th Post |     2012-10-12 | true      |
    When I am on the homepage
    Then I should see 10 posts
    And I should see posts in this order: 12th Post, 11th Post, 10th Post, 9th Post, 8th Post, 7th Post, 6th Post, 5th Post, 4th Post, 3rd Post
    And I should not see "1st Post"
    And I should not see "2nd Post"

  Scenario: Browsing a list of 2 posts
    Given the following post records
    | title       | date_published | published |
    | 1st Post    |      2012-10-2 | true      |
    | 2nd Post    |      2012-10-1 | true      |
    | Hidden Post |                | false     |
    When I am on the homepage
    Then I should see 2 posts
    And I should see posts in this order: 1st Post, 2nd Post
    And I should not see "Hidden Post"

  Scenario: Browsing a post that is a quote
    Given the following post record
    | date_published | published | type  | style     | quote                             |
    |      2012-10-2 | true      | quote | quote-big | Love aint a thing, love is a verb |
    When I am on the homepage
    Then I should see 1 post
    And I should see a "figure" tag with the class "quote-big"
    And I should see a "title" tag without a "h1" tag
    And I should see a "title" tag without a "time" tag

  Scenario: Browsing a post with a shifting background
    Given the following post records
    | title               | date_published | published | bg_img_shift_down_1 | bg_img_fixed |
    | Shifting Background |      2012-10-2 | true      | my_img.jpg          |              |
    | Fixed Background    |      2012-10-2 | true      |                     | my_img.jpg   |
    When I am on the homepage
    Then I should see 2 posts
    And I should see a "article" tag with the class "bg-shifting"
    And I should see a "article" tag with the class "bg-fixed"

  Scenario: Browsing a post with a colored background
    Given the following post records
    | title              | date_published | published | bg_color | bg_img_fixed |
    | Colored Background |      2012-10-2 | true      | #A1A1A1  |              |
    | Fixed Background   |      2012-10-2 | true      |          | my_img.jpg   |
    When I am on the homepage
    Then I should see 2 posts
    And I should print the page HTML
    And the post titled "Colored Background" should have the style "background-color: #A1A1A1"
    And the post titled "Fixed Background" should not have the style "background-color"

  @wip
  Scenario: Browsing multiple posts with "auto" space and no background images
    Given the following post records
    | title    | date_published |
    | 1st Post |      2012-10-5 |
    | 2nd Post |      2012-10-4 |
    | 3rd Post |      2012-10-3 |
    | 4th Post |      2012-10-2 |
    When I am on the homepage
    And the post titled "1st Post" should have a "midground" space
    And the post titled "2nd Post" should have a "foreground" space
    And the post titled "3rd Post" should have a "background" space
    And the post titled "4th Post" should have a "midground" space

  @wip
  Scenario: Any post that doesnt have an "auto" space should set the next post up with an "auto" correctly in the space cycle
    Given the following post records
    | title    | date_published | space      |
    | 1st Post |      2012-10-5 | auto       |
    | 2nd Post |      2012-10-4 | background |
    | 3rd Post |      2012-10-3 | auto       |
    | 4th Post |      2012-10-2 | auto       |
    | 5th Post |      2012-10-1 | foreground |
    | 6th Post |     2012-09-30 | auto       |
    | 7th Post |     2012-09-29 | midground  |
    | 8th Post |     2012-09-28 | auto       |
    When I am on the homepage
    And the post titled "1st Post" should have a "midground" space
    And the post titled "2nd Post" should have a "background" space
    And the post titled "3rd Post" should have a "midground" space
    And the post titled "4th Post" should have a "foreground" space
    And the post titled "5th Post" should have a "foreground" space
    And the post titled "6th Post" should have a "background" space
    And the post titled "7th Post" should have a "midground" space
    And the post titled "8th Post" should have a "foreground" space
