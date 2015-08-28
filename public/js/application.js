$(document).ready(function() {

  $("a.signup").on("click", function(event){
    event.preventDefault();
    $("form.signup").toggle();
  });

  $("a.login").on("click", function(event){
    event.preventDefault();
    $("form.login").toggle();
  });

  $("a.create").on("click", function(event){
    event.preventDefault();
    $("form.create").toggle();
  });

  $("form.signup").submit(function(event){
    event.preventDefault();

    $.ajax({
      method: "post",
      url: $(this).attr("action"),
      data: $(this).serialize()
    }).done(function(response){
      $(".signup input[name='email']").val('');
      $(".signup input[name='password']").val('');
      $(".response").empty();
      $(".response").append("<p>" + response + "</p>");
      $(".response").show();
    });
  });

  $("form.login").submit(function(event){
    event.preventDefault();

    $.ajax({
      method: "post",
      url: $(this).attr("action"),
      data: $(this).serialize()
    }).done(function(response){
      $(".login input[name='email']").val('');
      $(".login input[name='password']").val('');
      $(".response").empty();
      $(".response").append("<p>" + response + "</p>");
      $(".response").show();
    });
  });

  $("form.create").submit(function(event){
    event.preventDefault();

    $.ajax({
      method: "post",
      url: $(this).attr("action"),
      data: $(this).serialize()
    }).done(function(response){
      $(".create input[name='name']").val('');
      $(".create input[name='rate']").val('');
      $(".create input[name='capacity']").val('');
      $(".create input[name='address']").val('');
      $(".create input[name='tags']").val('');
      $(".response").empty();
      $(".response").append("<p>" + response + "</p>");
      $(".response").show();
      location.reload();
    });
  });

  $("form.booking").submit(function(event){
    event.preventDefault();

    $.ajax({
      method: "post",
      url: $(this).attr("action"),
      data: $(this).serialize()
    }).done(function(response){
      $(".booking input[name='start_date']").val('');
      $(".booking input[name='end_date']").val('');
      $(".response").empty();
      $(".response").append("<p>" + response + "</p>");
      $(".response").show();
      location.reload();
    });
  });
});