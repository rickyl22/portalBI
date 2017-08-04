require 'test_helper'

class RecargasTerminalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recargas_terminal = recargas_terminals(:one)
  end

  test "should get index" do
    get recargas_terminals_url
    assert_response :success
  end

  test "should get new" do
    get new_recargas_terminal_url
    assert_response :success
  end

  test "should create recargas_terminal" do
    assert_difference('RecargasTerminal.count') do
      post recargas_terminals_url, params: { recargas_terminal: { BANCARIA: @recargas_terminal.BANCARIA, BANCARIA_BSF: @recargas_terminal.BANCARIA_BSF, BANCARIA_BSF_SINIVA10: @recargas_terminal.BANCARIA_BSF_SINIVA10, BANCARIA_BSF_SINIVA12: @recargas_terminal.BANCARIA_BSF_SINIVA12, BS_TOTAL: @recargas_terminal.BS_TOTAL, BS_TOTAL_IVA10: @recargas_terminal.BS_TOTAL_IVA10, BS_TOTAL_IVA12: @recargas_terminal.BS_TOTAL_IVA12, CLIENTES: @recargas_terminal.CLIENTES, FECHA: @recargas_terminal.FECHA, FISICA: @recargas_terminal.FISICA, FISICA_BSF: @recargas_terminal.FISICA_BSF, FISICA_BSF_SINIVA10: @recargas_terminal.FISICA_BSF_SINIVA10, FISICA_BSF_SINIVA12: @recargas_terminal.FISICA_BSF_SINIVA12, GRE: @recargas_terminal.GRE, GRE_BSF: @recargas_terminal.GRE_BSF, GRE_BSF_SINIVA10: @recargas_terminal.GRE_BSF_SINIVA10, GRE_BSF_SINIVA12: @recargas_terminal.GRE_BSF_SINIVA12, MMO: @recargas_terminal.MMO, MMO_BSF: @recargas_terminal.MMO_BSF, MMO_BSF_SINIVA10: @recargas_terminal.MMO_BSF_SINIVA10, MMO_BSF_SINIVA12: @recargas_terminal.MMO_BSF_SINIVA12, P2P: @recargas_terminal.P2P, P2P_BSF: @recargas_terminal.P2P_BSF, P2P_BSF_SINIVA10: @recargas_terminal.P2P_BSF_SINIVA10, P2P_BSF_SINIVA12: @recargas_terminal.P2P_BSF_SINIVA12, RECARGAS: @recargas_terminal.RECARGAS, TERMINAL: @recargas_terminal.TERMINAL, TRANSFERENCIA: @recargas_terminal.TRANSFERENCIA, TRANSFERENCIA_BSF: @recargas_terminal.TRANSFERENCIA_BSF, TRANSFERENCIA_BSF_SINIVA10: @recargas_terminal.TRANSFERENCIA_BSF_SINIVA10, TRANSFERENCIA_BSF_SINIVA12: @recargas_terminal.TRANSFERENCIA_BSF_SINIVA12 } }
    end

    assert_redirected_to recargas_terminal_url(RecargasTerminal.last)
  end

  test "should show recargas_terminal" do
    get recargas_terminal_url(@recargas_terminal)
    assert_response :success
  end

  test "should get edit" do
    get edit_recargas_terminal_url(@recargas_terminal)
    assert_response :success
  end

  test "should update recargas_terminal" do
    patch recargas_terminal_url(@recargas_terminal), params: { recargas_terminal: { BANCARIA: @recargas_terminal.BANCARIA, BANCARIA_BSF: @recargas_terminal.BANCARIA_BSF, BANCARIA_BSF_SINIVA10: @recargas_terminal.BANCARIA_BSF_SINIVA10, BANCARIA_BSF_SINIVA12: @recargas_terminal.BANCARIA_BSF_SINIVA12, BS_TOTAL: @recargas_terminal.BS_TOTAL, BS_TOTAL_IVA10: @recargas_terminal.BS_TOTAL_IVA10, BS_TOTAL_IVA12: @recargas_terminal.BS_TOTAL_IVA12, CLIENTES: @recargas_terminal.CLIENTES, FECHA: @recargas_terminal.FECHA, FISICA: @recargas_terminal.FISICA, FISICA_BSF: @recargas_terminal.FISICA_BSF, FISICA_BSF_SINIVA10: @recargas_terminal.FISICA_BSF_SINIVA10, FISICA_BSF_SINIVA12: @recargas_terminal.FISICA_BSF_SINIVA12, GRE: @recargas_terminal.GRE, GRE_BSF: @recargas_terminal.GRE_BSF, GRE_BSF_SINIVA10: @recargas_terminal.GRE_BSF_SINIVA10, GRE_BSF_SINIVA12: @recargas_terminal.GRE_BSF_SINIVA12, MMO: @recargas_terminal.MMO, MMO_BSF: @recargas_terminal.MMO_BSF, MMO_BSF_SINIVA10: @recargas_terminal.MMO_BSF_SINIVA10, MMO_BSF_SINIVA12: @recargas_terminal.MMO_BSF_SINIVA12, P2P: @recargas_terminal.P2P, P2P_BSF: @recargas_terminal.P2P_BSF, P2P_BSF_SINIVA10: @recargas_terminal.P2P_BSF_SINIVA10, P2P_BSF_SINIVA12: @recargas_terminal.P2P_BSF_SINIVA12, RECARGAS: @recargas_terminal.RECARGAS, TERMINAL: @recargas_terminal.TERMINAL, TRANSFERENCIA: @recargas_terminal.TRANSFERENCIA, TRANSFERENCIA_BSF: @recargas_terminal.TRANSFERENCIA_BSF, TRANSFERENCIA_BSF_SINIVA10: @recargas_terminal.TRANSFERENCIA_BSF_SINIVA10, TRANSFERENCIA_BSF_SINIVA12: @recargas_terminal.TRANSFERENCIA_BSF_SINIVA12 } }
    assert_redirected_to recargas_terminal_url(@recargas_terminal)
  end

  test "should destroy recargas_terminal" do
    assert_difference('RecargasTerminal.count', -1) do
      delete recargas_terminal_url(@recargas_terminal)
    end

    assert_redirected_to recargas_terminals_url
  end
end
