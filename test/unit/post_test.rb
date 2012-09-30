require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "post attributes must not be empty" do post = Post.new
    assert post.invalid?
    assert post.errors[:title].any?
  end

  test "post with factory girl works" do
    post = FactoryGirl.build(:post)
    p post
  end
end
