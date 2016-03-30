$('#myTabs a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})

ready = function() {
  $('.chosen-select').chosen({
      allow_single_deselect: true,
      no_results_text: 'No results matched',
      width: '100%'
  });
  $('.star').on('click', function () {
    $(this).toggleClass('star-checked');
  });
  
  $('.ckbox label').on('click', function () {
    $(this).parents('tr').toggleClass('selected');
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
