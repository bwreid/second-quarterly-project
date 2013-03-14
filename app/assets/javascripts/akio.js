$(function() {
  $('.job_list').on('click', '.job', highlight_selected);
  var min_height = $(window).height();
  $('.main_section').first().css('min-height', min_height + 100);
});

function highlight_selected(job) {
  $('.job').removeClass('highlighted');
  $(this).addClass('highlighted');
}