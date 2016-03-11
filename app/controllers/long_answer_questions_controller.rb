class LongAnswerQuestionsController < ApplicationController
  before_action :logged_in?
  before_action :set_long_answer_question, only: [:show, :edit, :update, :destroy]

  def logged_in?
    redirect_to login_path, notice: "You must log in to access this page." unless session[:user_id]
  end
  # GET /long_answer_questions
  def index
    @long_answer_questions = LongAnswerQuestion.all
  end

  # GET /long_answer_questions/1
  def show
  end

  # GET /long_answer_questions/new
  def new
    @long_answer_question = LongAnswerQuestion.new
  end

  # GET /long_answer_questions/1/edit
  def edit
  end

  # POST /long_answer_questions
  def create
    @long_answer_question = LongAnswerQuestion.new(long_answer_question_params)

    if @long_answer_question.save
      redirect_to @long_answer_question, notice: 'Long answer question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /long_answer_questions/1
  def update
    if @long_answer_question.update(long_answer_question_params)
      redirect_to @long_answer_question, notice: 'Long answer question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /long_answer_questions/1
  def destroy
    @long_answer_question.destroy
    redirect_to long_answer_questions_url, notice: 'Long answer question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_long_answer_question
      @long_answer_question = LongAnswerQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def long_answer_question_params
      params.require(:long_answer_question).permit(:answer)
    end
end
