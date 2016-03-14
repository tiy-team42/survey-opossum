class Survey < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :author
  has_many :survey_questions
  has_many :boolean_questions, through: :survey_questions
  has_many :short_answer_questions, through: :survey_questions
  has_many :long_answer_questions, through: :survey_questions
  has_many :dropdown_questions, through: :survey_questions



  accepts_nested_attributes_for :survey_questions,
     reject_if: :all_blank,
     allow_destroy: true


  def has_responses?
   survey_questions.any? {|q| q.boolean_questions.count > 0 || q.short_answer_questions.count > 0 || q.long_answer_questions.count > 0 }
  end

  def question_text
    survey_questions.map {|q| q.text}
  end

  def question_responses
    survey_questions.map {|q| q.responses}
  end

  def question_with_responses
    survey_questions.map {|q| "#{q.text} + #{q.responses}" }
  end


  def to_csv
   attributes = %w{question_with_responses}
   questions = SurveyQuestion.where(survey_id: :id)

   CSV.generate do |csv|
       csv << attributes.map {|attr| send(attr) }
   end
 end

end
