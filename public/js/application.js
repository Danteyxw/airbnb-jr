$(document).ready(function() {
  $("a.signup").on("click", function(event){
    event.preventDefault();

    $("form.signup").toggle();
  });

  $("a.login").on("click", function(event){
    event.preventDefault();

    $("form.login").toggle();
  });
});
