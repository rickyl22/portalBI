require 'test_helper'

class PronosticoAltaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pronostico_altum = pronostico_alta(:one)
  end

  test "should get index" do
    get pronostico_alta_url
    assert_response :success
  end

  test "should get new" do
    get new_pronostico_altum_url
    assert_response :success
  end

  test "should create pronostico_altum" do
    assert_difference('PronosticoAltum.count') do
      post pronostico_alta_url, params: { pronostico_altum: { cantidad: @pronostico_altum.cantidad, fecha: @pronostico_altum.fecha, plataforma: @pronostico_altum.plataforma } }
    end

    assert_redirected_to pronostico_altum_url(PronosticoAltum.last)
  end

  test "should show pronostico_altum" do
    get pronostico_altum_url(@pronostico_altum)
    assert_response :success
  end

  test "should get edit" do
    get edit_pronostico_altum_url(@pronostico_altum)
    assert_response :success
  end

  test "should update pronostico_altum" do
    patch pronostico_altum_url(@pronostico_altum), params: { pronostico_altum: { cantidad: @pronostico_altum.cantidad, fecha: @pronostico_altum.fecha, plataforma: @pronostico_altum.plataforma } }
    assert_redirected_to pronostico_altum_url(@pronostico_altum)
  end

  test "should destroy pronostico_altum" do
    assert_difference('PronosticoAltum.count', -1) do
      delete pronostico_altum_url(@pronostico_altum)
    end

    assert_redirected_to pronostico_alta_url
  end
end
