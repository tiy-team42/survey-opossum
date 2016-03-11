class BooleanQuestionsController < ApplicationController
  before_action :logged_in?
  before_action :set_boolean_question, only: [:show, :edit, :update, :destroy]

  def logged_in?
    redirect_to login_path, notice: "You must log in to access this page." unless session[:user_id]
  end
  # GET /boolean_questions
  def index
    @boolean_questions = BooleanQuestion.all
  end

  # GET /boolean_questions/1
  def show
  end

  # GET /boolean_questions/new
  def new
    @boolean_question = BooleanQuestion.new
  end

  # GET /boolean_questions/1/edit
  def edit
  end

  # POST /boolean_questions
  def create
    @boolean_question = BooleanQuestion.new(boolean_question_params)

    if @boolean_question.save
      redirect_to @boolean_question, notice: 'Boolean question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /boolean_questions/1
  def update
    if @boolean_question.update(boolean_question_params)
      redirect_to @boolean_question, notice: 'Boolean question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /boolean_questions/1
  def destroy
    @boolean_question.destroy
    redirect_to boolean_questions_url, notice: 'Boolean question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boolean_question
      @boolean_question = BooleanQuestion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def boolean_question_params
      params.require(:boolean_question).permit(:answer)
    end
end
