require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should get index" do
    3.times { FactoryGirl.create(:post, published: true, date_published: DateTime.now) }

    get :index
    assert_response :success

    assert_select 'article', 3
  end

end
