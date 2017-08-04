require 'test_helper'

class ActivacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activacione = activaciones(:one)
  end

  test "should get index" do
    get activaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_activacione_url
    assert_response :success
  end

  test "should create activacione" do
    assert_difference('Activacione.count') do
      post activaciones_url, params: { activacione: { cantidad: @activacione.cantidad, fecha: @activacione.fecha, plataforma: @activacione.plataforma } }
    end

    assert_redirected_to activacione_url(Activacione.last)
  end

  test "should show activacione" do
    get activacione_url(@activacione)
    assert_response :success
  end

  test "should get edit" do
    get edit_activacione_url(@activacione)
    assert_response :success
  end

  test "should update activacione" do
    patch activacione_url(@activacione), params: { activacione: { cantidad: @activacione.cantidad, fecha: @activacione.fecha, plataforma: @activacione.plataforma } }
    assert_redirected_to activacione_url(@activacione)
  end

  test "should destroy activacione" do
    assert_difference('Activacione.count', -1) do
      delete activacione_url(@activacione)
    end

    assert_redirected_to activaciones_url
  end
end
