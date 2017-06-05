require 'test_helper'

class CasosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caso = casos(:one)
  end

  test "should get index" do
    get casos_url
    assert_response :success
  end

  test "should get new" do
    get new_caso_url
    assert_response :success
  end

  test "should create caso" do
    assert_difference('Caso.count') do
      post casos_url, params: { caso: { act_tabla: @caso.act_tabla, agrup: @caso.agrup, altas: @caso.altas, arpu: @caso.arpu, campos: @caso.campos, complejidad: @caso.complejidad, condiciones: @caso.condiciones, consultor: @caso.consultor, especifique: @caso.especifique, fech_asig: @caso.fech_asig, fecha_creado: @caso.fecha_creado, fecha_req: @caso.fecha_req, fijo: @caso.fijo, im: @caso.im, infosoft: @caso.infosoft, movil: @caso.movil, otro: @caso.otro, parque: @caso.parque, periodo: @caso.periodo, phone: @caso.phone, pre_post: @caso.pre_post, recargas: @caso.recargas, separacion: @caso.separacion, status: @caso.status, tipo_archivo: @caso.tipo_archivo, tipo_caso: @caso.tipo_caso, titulo: @caso.titulo, tlv: @caso.tlv, tv: @caso.tv, usuario: @caso.usuario } }
    end

    assert_redirected_to caso_url(Caso.last)
  end

  test "should show caso" do
    get caso_url(@caso)
    assert_response :success
  end

  test "should get edit" do
    get edit_caso_url(@caso)
    assert_response :success
  end

  test "should update caso" do
    patch caso_url(@caso), params: { caso: { act_tabla: @caso.act_tabla, agrup: @caso.agrup, altas: @caso.altas, arpu: @caso.arpu, campos: @caso.campos, complejidad: @caso.complejidad, condiciones: @caso.condiciones, consultor: @caso.consultor, especifique: @caso.especifique, fech_asig: @caso.fech_asig, fecha_creado: @caso.fecha_creado, fecha_req: @caso.fecha_req, fijo: @caso.fijo, im: @caso.im, infosoft: @caso.infosoft, movil: @caso.movil, otro: @caso.otro, parque: @caso.parque, periodo: @caso.periodo, phone: @caso.phone, pre_post: @caso.pre_post, recargas: @caso.recargas, separacion: @caso.separacion, status: @caso.status, tipo_archivo: @caso.tipo_archivo, tipo_caso: @caso.tipo_caso, titulo: @caso.titulo, tlv: @caso.tlv, tv: @caso.tv, usuario: @caso.usuario } }
    assert_redirected_to caso_url(@caso)
  end

  test "should destroy caso" do
    assert_difference('Caso.count', -1) do
      delete caso_url(@caso)
    end

    assert_redirected_to casos_url
  end
end
