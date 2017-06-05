require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get noticia" do
    get home_noticia_url
    assert_response :success
  end

  test "should get proyectos" do
    get home_proyectos_url
    assert_response :success
  end

  test "should get nosotros" do
    get home_nosotros_url
    assert_response :success
  end

end
