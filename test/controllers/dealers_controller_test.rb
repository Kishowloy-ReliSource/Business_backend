require "test_helper"

class DealersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dealer = dealers(:one)
  end

  test "should get index" do
    get dealers_url, as: :json
    assert_response :success
  end

  test "should create dealer" do
    assert_difference("Dealer.count") do
      post dealers_url, params: { dealer: { dob: @dealer.dob, email: @dealer.email, name: @dealer.name, pass: @dealer.pass, status: @dealer.status } }, as: :json
    end

    assert_response :created
  end

  test "should show dealer" do
    get dealer_url(@dealer), as: :json
    assert_response :success
  end

  test "should update dealer" do
    patch dealer_url(@dealer), params: { dealer: { dob: @dealer.dob, email: @dealer.email, name: @dealer.name, pass: @dealer.pass, status: @dealer.status } }, as: :json
    assert_response :success
  end

  test "should destroy dealer" do
    assert_difference("Dealer.count", -1) do
      delete dealer_url(@dealer), as: :json
    end

    assert_response :no_content
  end
end
