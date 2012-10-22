require 'spec_helper'

describe Post do
  it "should require a valid type" do
    post = Post.new
    post.should_not be_valid

    post.type = "invalid type"
    post.should_not be_valid

    post.type = Post.valid_types.sample
    post.should be_valid
  end

  it "should use 'auto' as the default space if none is set" do
    Post.create(type: Post.valid_types.sample).space.should == "auto"
  end

  describe "baground images" do
    it "should be able to detect if a background image is present" do
      FactoryGirl.create(:post,
                         bg_img_fixed: "#{Forgery(:internet).domain_name}/test.jpg")
        .has_background?.should be_true

      FactoryGirl.create(:post,
                         bg_img_shift_down_1: "#{Forgery(:internet).domain_name}/test.jpg").has_background?
        .should be_true

      FactoryGirl.create(:post,
                         bg_img_shift_down_2: "#{Forgery(:internet).domain_name}/test.jpg")
        .has_background?.should be_true

      FactoryGirl.create(:post,
                         bg_img_shift_down_1: "#{Forgery(:internet).domain_name}/test.jpg",
                         bg_img_shift_down_2: "#{Forgery(:internet).domain_name}/test.jpg")
        .has_background?.should be_true
    end

    it "should be able to detect if a background image is not present" do
      FactoryGirl.create(:post).has_background?.should be_false
    end

    it "should be able to detect the background is shifting" do
      FactoryGirl.create(:post,
                         bg_img_shift_down_1: "#{Forgery(:internet).domain_name}/test.jpg")
        .has_shifting_background?.should be_true
    end

    it "should be able to detect if the background is fixed" do
      FactoryGirl.create(:post).has_shifting_background?.should be_false
    end
  end
end
