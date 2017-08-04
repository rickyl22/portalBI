require 'test_helper'

class AltaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @altum = alta(:one)
  end

  test "should get index" do
    get alta_url
    assert_response :success
  end

  test "should get new" do
    get new_altum_url
    assert_response :success
  end

  test "should create altum" do
    assert_difference('Altum.count') do
      post alta_url, params: { altum: { cantidad: @altum.cantidad, fecha: @altum.fecha, plataforma: @altum.plataforma } }
    end

    assert_redirected_to altum_url(Altum.last)
  end

  test "should show altum" do
    get altum_url(@altum)
    assert_response :success
  end

  test "should get edit" do
    get edit_altum_url(@altum)
    assert_response :success
  end

  test "should update altum" do
    patch altum_url(@altum), params: { altum: { cantidad: @altum.cantidad, fecha: @altum.fecha, plataforma: @altum.plataforma } }
    assert_redirected_to altum_url(@altum)
  end

  test "should destroy altum" do
    assert_difference('Altum.count', -1) do
      delete altum_url(@altum)
    end

    assert_redirected_to alta_url
  end
end
