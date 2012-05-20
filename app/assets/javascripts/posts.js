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
    var q = $(this);
    var post = q.closest('.post');
    var url = $(this).attr('href') + '.json';
    $.ajax({
      type: 'POST',
      url: url,
      data: '',
      success: function(data, status, jqxhr) {
        var post_id = post.attr('rel');
        if ( post_id > 0 ) {
          $(".post[rel="+post_id+"]").find('.btn-voteup span').text(data.plus);
          $(".post[rel="+post_id+"]").find('.btn-votedown span').text(data.minus);
          if ( data.voted === true ) {
            post.find('.btn-voteup').removeClass('active');
            post.find('.btn-votedown').removeClass('active');
            q.closest('.btn').addClass('active');
          }
        }
      }
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
        setTimeout(parseSocial, 100);
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

  $.getJSON('http://api.twitter.com/1/statuses/user_timeline/CaroGoverno.json?count=1&callback=?',function(tweet){  
     tweet = linkify(tweet[0].text);  
     $("#tweet").html(tweet);  
  });
});

function voteSuccess(data, status, jqxhr)
{

}

function reportSuccess(data, status, jqxhr)
{
  alert("Post segnalato con successo!");
}

function linkify(string){  
  string = string.replace(  
      /((https?\:\/\/)|(www\.))(\S+)(\w{2,4})(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/gi,  
      function(url){  
        var full_url = url;  
        if (!full_url.match('^https?:\/\/')) {  
          full_url = 'http://' + full_url;  
        }  
        return '<a href="' + full_url + '">' + url + '</a>';  
      }  
      );  
  return string;  
}  
function parseSocial()
{
    gapi.plusone.go();
}
