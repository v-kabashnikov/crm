var ready;
ready = function() {

  $("#user_role").change(function() {
       $(".hiddenable").addClass("hidden");
       $("."+ $(this).val()).removeClass("hidden");  
    });



};

$(document).ready(ready);
$(document).on('page:load', ready)
