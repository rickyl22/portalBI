require 'test_helper'

class PronosticoRecargasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pronostico_recarga = pronostico_recargas(:one)
  end

  test "should get index" do
    get pronostico_recargas_url
    assert_response :success
  end

  test "should get new" do
    get new_pronostico_recarga_url
    assert_response :success
  end

  test "should create pronostico_recarga" do
    assert_difference('PronosticoRecarga.count') do
      post pronostico_recargas_url, params: { pronostico_recarga: { cantidad: @pronostico_recarga.cantidad, fecha: @pronostico_recarga.fecha } }
    end

    assert_redirected_to pronostico_recarga_url(PronosticoRecarga.last)
  end

  test "should show pronostico_recarga" do
    get pronostico_recarga_url(@pronostico_recarga)
    assert_response :success
  end

  test "should get edit" do
    get edit_pronostico_recarga_url(@pronostico_recarga)
    assert_response :success
  end

  test "should update pronostico_recarga" do
    patch pronostico_recarga_url(@pronostico_recarga), params: { pronostico_recarga: { cantidad: @pronostico_recarga.cantidad, fecha: @pronostico_recarga.fecha } }
    assert_redirected_to pronostico_recarga_url(@pronostico_recarga)
  end

  test "should destroy pronostico_recarga" do
    assert_difference('PronosticoRecarga.count', -1) do
      delete pronostico_recarga_url(@pronostico_recarga)
    end

    assert_redirected_to pronostico_recargas_url
  end
end
