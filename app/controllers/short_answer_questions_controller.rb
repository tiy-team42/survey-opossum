class ShortAnswerQuestionsController < ApplicationController
  before_action :logged_in?
  before_action :set_short_answer_question, only: [:show, :edit, :update, :destroy]

  # GET /short_answer_questions
  def index
    @short_answer_questions = ShortAnswerQuestion.all
  end

  # GET /short_answer_questions/1
  def show
  end

  # GET /short_answer_questions/new
  def new
    @short_answer_question = ShortAnswerQuestion.new
  end

  # GET /short_answer_questions/1/edit
  def edit
  end

  # POST /short_answer_questions
  def create
    @short_answer_question = ShortAnswerQuestion.new(short_answer_question_params)

    if @short_answer_question.save
      redirect_to @short_answer_question, notice: 'Short answer question was successfully created.'
    else
      redirect_to :back
    end
  end

  # PATCH/PUT /short_answer_questions/1
  def update
    if @short_answer_question.update(short_answer_question_params)
      redirect_to @short_answer_question, notice: 'Short answer question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /short_answer_questions/1
  def destroy
    @short_answer_question.destroy
    redirect_to short_answer_questions_url, notice: 'Short answer question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_answer_question
      @short_answer_question = ShortAnswerQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def short_answer_question_params
      params.require(:short_answer_question).permit(:answer)
    end
end
