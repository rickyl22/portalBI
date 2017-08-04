require 'test_helper'

class RecargasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recarga = recargas(:one)
  end

  test "should get index" do
    get recargas_url
    assert_response :success
  end

  test "should get new" do
    get new_recarga_url
    assert_response :success
  end

  test "should create recarga" do
    assert_difference('Recarga.count') do
      post recargas_url, params: { recarga: { BANCARIA: @recarga.BANCARIA, BANCARIA_BSF: @recarga.BANCARIA_BSF, BANCARIA_BSF_SINIVA10: @recarga.BANCARIA_BSF_SINIVA10, BANCARIA_BSF_SINIVA12: @recarga.BANCARIA_BSF_SINIVA12, BS_TOTAL: @recarga.BS_TOTAL, BS_TOTAL_IVA10: @recarga.BS_TOTAL_IVA10, BS_TOTAL_IVA12: @recarga.BS_TOTAL_IVA12, CLIENTES: @recarga.CLIENTES, FECHA: @recarga.FECHA, FISICA: @recarga.FISICA, FISICA_BSF: @recarga.FISICA_BSF, FISICA_BSF_SINIVA10: @recarga.FISICA_BSF_SINIVA10, FISICA_BSF_SINIVA12: @recarga.FISICA_BSF_SINIVA12, GRE: @recarga.GRE, GRE_BSF: @recarga.GRE_BSF, GRE_BSF_SINIVA10: @recarga.GRE_BSF_SINIVA10, GRE_BSF_SINIVA12: @recarga.GRE_BSF_SINIVA12, MMO: @recarga.MMO, MMO_BSF: @recarga.MMO_BSF, MMO_BSF_SINIVA10: @recarga.MMO_BSF_SINIVA10, MMO_BSF_SINIVA12: @recarga.MMO_BSF_SINIVA12, P2P: @recarga.P2P, P2P_BSF: @recarga.P2P_BSF, P2P_BSF_SINIVA10: @recarga.P2P_BSF_SINIVA10, P2P_BSF_SINIVA12: @recarga.P2P_BSF_SINIVA12, RECARGAS: @recarga.RECARGAS, TRANSFERENCIA: @recarga.TRANSFERENCIA, TRANSFERENCIA_BSF: @recarga.TRANSFERENCIA_BSF, TRANSFERENCIA_BSF_SINIVA10: @recarga.TRANSFERENCIA_BSF_SINIVA10, TRANSFERENCIA_BSF_SINIVA12: @recarga.TRANSFERENCIA_BSF_SINIVA12 } }
    end

    assert_redirected_to recarga_url(Recarga.last)
  end

  test "should show recarga" do
    get recarga_url(@recarga)
    assert_response :success
  end

  test "should get edit" do
    get edit_recarga_url(@recarga)
    assert_response :success
  end

  test "should update recarga" do
    patch recarga_url(@recarga), params: { recarga: { BANCARIA: @recarga.BANCARIA, BANCARIA_BSF: @recarga.BANCARIA_BSF, BANCARIA_BSF_SINIVA10: @recarga.BANCARIA_BSF_SINIVA10, BANCARIA_BSF_SINIVA12: @recarga.BANCARIA_BSF_SINIVA12, BS_TOTAL: @recarga.BS_TOTAL, BS_TOTAL_IVA10: @recarga.BS_TOTAL_IVA10, BS_TOTAL_IVA12: @recarga.BS_TOTAL_IVA12, CLIENTES: @recarga.CLIENTES, FECHA: @recarga.FECHA, FISICA: @recarga.FISICA, FISICA_BSF: @recarga.FISICA_BSF, FISICA_BSF_SINIVA10: @recarga.FISICA_BSF_SINIVA10, FISICA_BSF_SINIVA12: @recarga.FISICA_BSF_SINIVA12, GRE: @recarga.GRE, GRE_BSF: @recarga.GRE_BSF, GRE_BSF_SINIVA10: @recarga.GRE_BSF_SINIVA10, GRE_BSF_SINIVA12: @recarga.GRE_BSF_SINIVA12, MMO: @recarga.MMO, MMO_BSF: @recarga.MMO_BSF, MMO_BSF_SINIVA10: @recarga.MMO_BSF_SINIVA10, MMO_BSF_SINIVA12: @recarga.MMO_BSF_SINIVA12, P2P: @recarga.P2P, P2P_BSF: @recarga.P2P_BSF, P2P_BSF_SINIVA10: @recarga.P2P_BSF_SINIVA10, P2P_BSF_SINIVA12: @recarga.P2P_BSF_SINIVA12, RECARGAS: @recarga.RECARGAS, TRANSFERENCIA: @recarga.TRANSFERENCIA, TRANSFERENCIA_BSF: @recarga.TRANSFERENCIA_BSF, TRANSFERENCIA_BSF_SINIVA10: @recarga.TRANSFERENCIA_BSF_SINIVA10, TRANSFERENCIA_BSF_SINIVA12: @recarga.TRANSFERENCIA_BSF_SINIVA12 } }
    assert_redirected_to recarga_url(@recarga)
  end

  test "should destroy recarga" do
    assert_difference('Recarga.count', -1) do
      delete recarga_url(@recarga)
    end

    assert_redirected_to recargas_url
  end
end
