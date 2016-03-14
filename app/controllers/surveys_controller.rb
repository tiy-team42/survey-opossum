class SurveysController < ApplicationController
  before_action :logged_in?, only: [:index, :create]
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # def boolean_questions
  #   @survey_questions = @survey.survey_questions
  # end


  # GET /surveys
  def index
    @surveys = Survey.where(author_id: session[:user_id])
  end

  # GET /surveys/1

  #only show if published
  def show
    if session[:user_id] == @survey.author_id || @survey.published
        @survey_questions = @survey.survey_questions.order(:position)
        @survey_questions.each_with_index do |q, i|
          if q.is_boolean?
            @survey_questions[i].boolean_questions.build
          elsif  q.is_short_answer?
            @survey_questions[i].short_answer_questions.build
          elsif  q.is_long_answer?
            @survey_questions[i].long_answer_questions.build
          elsif  q.is_dropdown?
            @survey_questions[i].dropdown_questions.build
          end
        end
        respond_to do |format|
          format.html
          format.csv { send_data @survey.to_csv, filename: "survey_results-#{Date.today}.csv"}
        end
    else
      redirect_to root_path, alert: "That's not a valid survey."
    end


  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @survey.survey_questions.build
  end

  # GET /surveys/1/edit
  def edit
    if @survey.has_responses?
      redirect_to surveys_path, alert: "Sorry, that survey can't be edited. It already has responses."
    else
      @survey_questions = @survey.survey_questions.order(:position)
    end
  end

  # POST /surveys
  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /surveys/1
  def update
    if @survey.update(survey_params)
      redirect_to @survey, notice: 'Survey was successfully updated.'
    else
      flash[:alert] = "Make sure all required fields are filled out!"
      redirect_to :back
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy
    redirect_to surveys_url, notice: 'Survey was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def survey_params
      params.require(:survey).permit(:title, :description, :author_id, :published, survey_questions_attributes: [:id, :text, :required, :position, :question_type, :answer_options, :_destroy, :boolean_questions_attributes => [:id, :answer], :short_answer_questions_attributes => [:id, :answer], :long_answer_questions_attributes => [:id, :answer], :dropdown_questions_attributes => [:id, :answer]])
    end
end


#in root, add message if there are no surveys
