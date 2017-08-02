require 'test_helper'

class AltasPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @altas_plan = altas_plans(:one)
  end

  test "should get index" do
    get altas_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_altas_plan_url
    assert_response :success
  end

  test "should create altas_plan" do
    assert_difference('AltasPlan.count') do
      post altas_plans_url, params: { altas_plan: { cantidad: @altas_plan.cantidad, fecha: @altas_plan.fecha, plan: @altas_plan.plan, plataforma: @altas_plan.plataforma } }
    end

    assert_redirected_to altas_plan_url(AltasPlan.last)
  end

  test "should show altas_plan" do
    get altas_plan_url(@altas_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_altas_plan_url(@altas_plan)
    assert_response :success
  end

  test "should update altas_plan" do
    patch altas_plan_url(@altas_plan), params: { altas_plan: { cantidad: @altas_plan.cantidad, fecha: @altas_plan.fecha, plan: @altas_plan.plan, plataforma: @altas_plan.plataforma } }
    assert_redirected_to altas_plan_url(@altas_plan)
  end

  test "should destroy altas_plan" do
    assert_difference('AltasPlan.count', -1) do
      delete altas_plan_url(@altas_plan)
    end

    assert_redirected_to altas_plans_url
  end
end
