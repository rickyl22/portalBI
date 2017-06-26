require 'test_helper'

class HistorialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historial = historials(:one)
  end

  test "should get index" do
    get historials_url
    assert_response :success
  end

  test "should get new" do
    get new_historial_url
    assert_response :success
  end

  test "should create historial" do
    assert_difference('Historial.count') do
      post historials_url, params: { historial: { caso_id: @historial.caso_id, estatus: @historial.estatus, evento: @historial.evento, fecha: @historial.fecha, usuario_id: @historial.usuario_id } }
    end

    assert_redirected_to historial_url(Historial.last)
  end

  test "should show historial" do
    get historial_url(@historial)
    assert_response :success
  end

  test "should get edit" do
    get edit_historial_url(@historial)
    assert_response :success
  end

  test "should update historial" do
    patch historial_url(@historial), params: { historial: { caso_id: @historial.caso_id, estatus: @historial.estatus, evento: @historial.evento, fecha: @historial.fecha, usuario_id: @historial.usuario_id } }
    assert_redirected_to historial_url(@historial)
  end

  test "should destroy historial" do
    assert_difference('Historial.count', -1) do
      delete historial_url(@historial)
    end

    assert_redirected_to historials_url
  end
end
