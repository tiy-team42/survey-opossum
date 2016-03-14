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
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(function(){//init DOM
  var clickCount = 1;

  //this function adds questions
  $('.add-question').on("click", function(){
    clickCount = $('.pick-question').length;
    clickCount += 1;
    // console.log(clickCount);
    $('.question-wrap').append("<div class='pick-question' id='question"+clickCount+"'><div class='move-buttons'><span class='move-up'><i class='fa fa-caret-up'></i></span><span class='move-down'><i class='fa fa-caret-down'></i></span></div><span class='q-txt'><input placeholder='Ask Your Question Here' class='q-field' type='text' name='survey[survey_questions_attributes]["+clickCount+"][text]' id='survey_survey_questions_attributes_"+clickCount+"_text'></span><span class='remove-question'>Remove? <input class='q-remove' type='checkbox' value='1' name='survey[survey_questions_attributes]["+clickCount+"][_destroy]' id='survey_survey_questions_attributes"+clickCount+"__destroy'></span><span class='q-options'><span class='q-type'>This is a <select class='survey-questions-dropdown' name='survey[survey_questions_attributes]["+clickCount+"][question_type]' id='survey_survey_questions_attributes_"+clickCount+"_question_type'><option value=''>Select question type...</option><option value='BooleanQuestion'>Yes No</option><option value='ShortAnswerQuestion'>Short Answer</option><option value='LongAnswerQuestion'>Long Answer</option><option value='DropdownQuestion'>Multiple Choice Dropdown</option></select>question</span></span><span class='hidden survey-options'>Place your question values(separated by a comma) here: <input value='Yes, No' type='text' name='survey[survey_questions_attributes]["+clickCount+"][answer_options]' id='survey_survey_questions_attributes_"+clickCount+"_answer_options'></span><input name='survey[survey_questions_attributes]["+clickCount+"][_destroy]'' type='hidden' value='"+clickCount+"'><input type='text' class='q-position hidden' name='survey[survey_questions_attributes]["+clickCount+"][position] id='survey_survey_questions_attributes_"+clickCount+"_position'>  <span class='q-required'>Is this question required? <input name='survey[survey_questions_attributes]["+clickCount+"][required]'' type='hidden' value='"+clickCount+"'><input type='checkbox' value='1' name='survey[survey_questions_attributes]["+clickCount+"][required]' id='survey_survey_questions_attributes_"+clickCount+"_required'></span></div>");
    doWhatMyHeartTellsMe()
    questionPosition()



  });

  //this function removes questions
  $('.question-wrap').on("click", '.q-remove', function(){
    $(this).parent().parent().remove();
  });


  //this functions moves questions up
  $('.question-wrap').on('click', '.move-up', function(){
    $(this).parents('.pick-question').insertBefore($(this).parents('.pick-question').prev());
    questionPosition()
    });


  //this function moves questions down
  $('.question-wrap').on('click', '.move-down', function(){
    $(this).parents('.pick-question').insertAfter($(this).parents('.pick-question').next());
    questionPosition()
    });


  //this pushes the scroll
  function doWhatMyHeartTellsMe(){
    var position = $(".question-wrap").prop('scrollHeight');
    $(".question-wrap").scrollTop(position);
  };


  //this tells rails the position
  function questionPosition(){
    $('.q-position').each(function(index){
    $(this).val(index);
    })
  };


  //this function adds a textbox when 'yes/no' is selected in the create/edit survey questions page
  $('.question-wrap').on('blur','.survey-questions-dropdown',  function(){
    console.log($(this).val());
    if($(this).val() === 'BooleanQuestion'){
      $('.survey-options').show();
    } else if($(this).val() === 'DropdownQuestion'){
      $('.survey-options').show();
    }
  })

});//close iify
