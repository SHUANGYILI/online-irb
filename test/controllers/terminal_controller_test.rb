require "test_helper"

class TerminalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get terminal_index_url
    assert_response :success
  end

  test "should get execute" do
    get terminal_execute_url
    assert_response :success
  end
end
