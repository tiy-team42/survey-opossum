class ResultsController < ApplicationController
  # before_action :logged_in?
  before_action :set_results, only: :show

  def show
    if @survey.author_id == session[:user_id]
      @questions = @survey.survey_questions
    else
      redirect_to login_path
    end
  end




  #       get_questions.each do |get_answers|
  #
  #       end
  #     end
  #
  #     end
  # end

    # @course.each do |dish|
    #   dish.each do |stuff|
    #     dish.name
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_results
      @survey = Survey.find(params[:id])
    end






end
