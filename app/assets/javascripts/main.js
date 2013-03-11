$(function() {
  $('.job_list').on('click', '.job', highlight_selected);
  $('#loadingModal').append('All done. Come on in.')
  var min_height = $(window).height();
  $('.main_section').first().css('min-height', min_height + 100);
});

////////////////////////////////////////////
// HIGHLIGHT & SELECT JOBS
////////////////////////////////////////////

function highlight_selected(job) {
  $('.job').removeClass('highlighted');
  $(this).addClass('highlighted');
}

////////////////////////////////////////////
// ...
////////////////////////////////////////////