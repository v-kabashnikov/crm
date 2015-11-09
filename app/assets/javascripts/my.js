var ready;
ready = function() {

  $("#user_role").change(function() {
       $(".hiddenable").addClass("hidden");
       $("."+ $(this).val()).removeClass("hidden");  
    });

	$(".mobile-phone").mask("+999 99 999 99 99");
	$('.datetimepicker').datetimepicker();
	$('.datepicker').datetimepicker();

};

$(document).ready(ready);
$(document).on('page:load', ready)
