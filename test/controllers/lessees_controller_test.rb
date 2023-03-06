require "test_helper"

class LesseesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lessee = lessees(:one)
  end

  test "should get index" do
    get lessees_url, as: :json
    assert_response :success
  end

  test "should create lessee" do
    assert_difference("Lessee.count") do
      post lessees_url, params: { lessee: { bike_id: @lessee.bike_id, colesseeaddress: @lessee.colesseeaddress, colesseedob: @lessee.colesseedob, colesseemonthlyincome: @lessee.colesseemonthlyincome, colesseename: @lessee.colesseename, colessephone: @lessee.colessephone, downpayment: @lessee.downpayment, lesseeaddress: @lessee.lesseeaddress, lesseedob: @lessee.lesseedob, lesseemonthlyincome: @lessee.lesseemonthlyincome, lesseename: @lessee.lesseename, lesseephone: @lessee.lesseephone } }, as: :json
    end

    assert_response :created
  end

  test "should show lessee" do
    get lessee_url(@lessee), as: :json
    assert_response :success
  end

  test "should update lessee" do
    patch lessee_url(@lessee), params: { lessee: { bike_id: @lessee.bike_id, colesseeaddress: @lessee.colesseeaddress, colesseedob: @lessee.colesseedob, colesseemonthlyincome: @lessee.colesseemonthlyincome, colesseename: @lessee.colesseename, colessephone: @lessee.colessephone, downpayment: @lessee.downpayment, lesseeaddress: @lessee.lesseeaddress, lesseedob: @lessee.lesseedob, lesseemonthlyincome: @lessee.lesseemonthlyincome, lesseename: @lessee.lesseename, lesseephone: @lessee.lesseephone } }, as: :json
    assert_response :success
  end

  test "should destroy lessee" do
    assert_difference("Lessee.count", -1) do
      delete lessee_url(@lessee), as: :json
    end

    assert_response :no_content
  end
end
