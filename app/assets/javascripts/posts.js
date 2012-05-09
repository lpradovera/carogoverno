$(document).ajaxSend(function(e, xhr, options) {
  var token = $("meta[name='csrf-token']").attr("content");
  xhr.setRequestHeader("X-CSRF-Token", token);
});

$.ajaxSetup({
error: function(xhr, status, err) {
if (xhr.status == 401)
window.location.href = '/users/sign_in';
}
});

$(function() {
  $('.btn-voteup').click(function(e) {
    var url = $(this).attr('href') + '.json';
    $.ajax({
      type: 'POST',
      url: url,
      data: '',
      success: voteSuccess
    });
    e.preventDefault();
  });
});

function voteSuccess(data, status, jqxhr)
{

}
