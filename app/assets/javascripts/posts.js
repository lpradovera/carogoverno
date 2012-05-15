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
  $('a[rel="tooltip"]').tooltip();
  $('.btn-voteup, .btn-votedown').live('click',function(e) {
    var url = $(this).attr('href') + '.json';
    $.ajax({
      type: 'POST',
      url: url,
      data: '',
      success: voteSuccess
    });
    e.preventDefault();
  });
  $('.detail').click(function(e) {
    e.preventDefault();
    var href = $(e.target).attr('href');
    var title = $(e.target).attr('title');
    if ( title === undefined ) {
      title = "Dettaglio Proposta";
    }
    if (href.indexOf('#') == 0) {
      $(href).modal('open');
    } else {
      $.get(href, function(data) {
        var modal = '<div class="modal fade"><div class="modal-header"><button class="close" data-dismiss="modal">&times;</button><h3>'+title+'</h3></div>';
        modal += '<div class="modal-body"><p>'+data+'</p></div>';
        modal += '<div class="modal-footer"> <a href="#" class="btn" data-dismiss="modal">Chiudi</a></div>';
        $(modal).modal();
      });
    }
  });
  $('.btn-report').click(function(e) {
    var url = $(this).attr('href') + '.json';
    $.ajax({
      type: 'POST',
      url: url,
      data: '',
      success: reportSuccess
    });
    e.preventDefault();
  });
});

function voteSuccess(data, status, jqxhr)
{

}

function reportSuccess(data, status, jqxhr)
{
  alert("Post segnalato con successo!");
}
