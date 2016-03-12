// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(function(){
  $('.question-wrap').on("click", '.q-remove', function(){
    // console.log($(this).siblings());
    $(this).parent().remove();
    // $(this).parent().remove();
  })
})

$(function(){
var clickCount = 0;


$('.add-question').on("click", function(){
  clickCount += 1;
  console.log(clickCount);
  $('.question-wrap').append("<div class='pick-question' id='question"+clickCount+"'><span class='q-txt'>QUESTION: <input placeholder='ASK YOUR QUESTION HERE' class='q-field' type='text' name='survey[survey_questions_attributes]["+clickCount+"][text]' id='survey_survey_questions_attributes_"+clickCount+"_text'></span><span class='q-options'><span class='q-required'>Required?: <input name='survey[survey_questions_attributes]["+clickCount+"][required]'' type='hidden' value='0'><input type='checkbox' value='1' name='survey[survey_questions_attributes]["+clickCount+"][required]' id='survey_survey_questions_attributes_"+clickCount+"_required'></span><span class='q-type'>This Question is a: <select name='survey[survey_questions_attributes]["+clickCount+"][question_type]' id='survey_survey_questions_attributes_"+clickCount+"_question_type'><option value=''>Select question type...</option><option value='BooleanQuestion'>Yes No</option><option value='ShortAnswerQuestion'>Short Answer</option><option value='LongAnswerQuestion'>Long Answer</option><option value='DropdownQuestion'>Multiple Choice Dropdown</option></select></span></span><span class='hidden'>THIS SECTION SHOULD ONLY SHOW IF THE USER SELECTED A BOOLEAN QUESTION TYPE OR A DROPDOWN QUESTION TYPE Add options, comma separated. For Yes/No questions, add two values. The first answer should be the 'Yes' option. For multiple choice, add as many as you'd like!<input value='Yes, No' type='text' name='survey[survey_questions_attributes]["+clickCount+"][answer_options]' id='survey_survey_questions_attributes_"+clickCount+"_answer_options'></span><input name='survey[survey_questions_attributes]["+clickCount+"][_destroy]'' type='hidden' value='0'><input class='q-remove' type='checkbox' value='1' name='survey[survey_questions_attributes]["+clickCount+"][_destroy]' id='survey_survey_questions_attributes"+clickCount+"__destroy'> Remove</div>");
})
});
