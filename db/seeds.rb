# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mike = Author.create(email: 'mike@mike.com', password: 'mikey', name: 'Mike')
# new_survey = Survey.create(title: "testerson", author_id: 1, survey_questions_attributes: [id: 2, text: "all the answers", required: false, question_type: "boolean", :boolean_questions_attributes => [id: 1, answer: "yup"])
