$(function() {
  $('.job_list').on('click', '.job', highlight_selected);
  $('.dropdown').on('click', '#cancel', close_dropdown);
  var min_height = $(window).height();
  $('.main_section').first().css('min-height', min_height + 100);
});

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