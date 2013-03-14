$(function() {
  $('.job_list').on('click', '.job', highlight_selected);
<<<<<<< HEAD:app/assets/javascripts/main.js
  $('.dropdown').on('click', '#cancel', close_dropdown);
=======
>>>>>>> production_edits:app/assets/javascripts/akio.js
  var min_height = $(window).height();
  $('.main_section').first().css('min-height', min_height + 100);
});

<<<<<<< HEAD:app/assets/javascripts/main.js
////////////////////////////////////////////
// HIGHLIGHT & SELECT JOBS
////////////////////////////////////////////

;(function highlight_selected(job) {
  $('.job').removeClass('highlighted');
  $(this).addClass('highlighted');
})

////////////////////////////////////////////
// ...
////////////////////////////////////////////
=======
function highlight_selected(job) {
  $('.job').removeClass('highlighted');
  $(this).addClass('highlighted');
}
>>>>>>> production_edits:app/assets/javascripts/akio.js
