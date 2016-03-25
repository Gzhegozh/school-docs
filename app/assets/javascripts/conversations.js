$('#myTabs a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})

ready = function() {
  $('.star').on('click', function () {
    $(this).toggleClass('star-checked');
  });
  
  $('.ckbox label').on('click', function () {
    $(this).parents('tr').toggleClass('selected');
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
