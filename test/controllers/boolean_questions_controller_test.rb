require 'test_helper'

class BooleanQuestionsControllerTest < ActionController::TestCase
  setup do
    @boolean_question = boolean_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boolean_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boolean_question" do
    assert_difference('BooleanQuestion.count') do
      post :create, boolean_question: { answer: @boolean_question.answer }
    end

    assert_redirected_to boolean_question_path(assigns(:boolean_question))
  end

  test "should show boolean_question" do
    get :show, id: @boolean_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boolean_question
    assert_response :success
  end

  test "should update boolean_question" do
    patch :update, id: @boolean_question, boolean_question: { answer: @boolean_question.answer }
    assert_redirected_to boolean_question_path(assigns(:boolean_question))
  end

  test "should destroy boolean_question" do
    assert_difference('BooleanQuestion.count', -1) do
      delete :destroy, id: @boolean_question
    end

    assert_redirected_to boolean_questions_path
  end
end
