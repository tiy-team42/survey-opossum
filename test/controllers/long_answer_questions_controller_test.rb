require 'test_helper'

class LongAnswerQuestionsControllerTest < ActionController::TestCase
  setup do
    @long_answer_question = long_answer_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:long_answer_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create long_answer_question" do
    assert_difference('LongAnswerQuestion.count') do
      post :create, long_answer_question: { answer: @long_answer_question.answer }
    end

    assert_redirected_to long_answer_question_path(assigns(:long_answer_question))
  end

  test "should show long_answer_question" do
    get :show, id: @long_answer_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @long_answer_question
    assert_response :success
  end

  test "should update long_answer_question" do
    patch :update, id: @long_answer_question, long_answer_question: { answer: @long_answer_question.answer }
    assert_redirected_to long_answer_question_path(assigns(:long_answer_question))
  end

  test "should destroy long_answer_question" do
    assert_difference('LongAnswerQuestion.count', -1) do
      delete :destroy, id: @long_answer_question
    end

    assert_redirected_to long_answer_questions_path
  end
end
