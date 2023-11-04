require "test_helper"

class TranslationsControllerTest < ActionDispatch::IntegrationTest
  test "should get translate" do
    get translations_translate_url
    assert_response :success
  end
end
