class ResultsController < ApplicationController
  # before_action :logged_in?
  before_action :set_results, only: :show

  def show
    if @survey.author_id == session[:user_id]
      @questions = @survey.survey_questions.order(:position)
    else
      redirect_to root_path,  notice: "That's not a valid results page."
    end

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_results
      @survey = Survey.find(params[:id])
    end


end
