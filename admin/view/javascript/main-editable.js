$(document).ready(function() {
    //toggle `popup` / `inline` mode
    $.fn.editable.defaults.mode = 'popup';
//$.fn.editable.defaults.ajaxOptions = {type: "POST"};
    //make username editable
    $('.ocedit').editable({
error: function(response, newValue) {
    if(response.status === 401) {
      location.reload();
        return 'Not Authorized';
    } else {
        return response.responseText;
    }
}
    });


    $('.toggle-event-status').change(function() {
      var thisenable = $(this);
      if(thisenable.prop('checked')==true) { var switchvalue = 1; } else { var switchvalue = 0;}

             $.post(thisenable.attr('data-url'), {name: "status", pk: thisenable.attr('data-pk'), value: switchvalue}, function(data, textStatus, jqXHR){
             if(jqXHR.status!=200) {alert('error update status:'+jqXHR.status+'|'+textStatus); thisenable.bootstrapToggle('toggle').bootstrapToggle('disable'); }
             }).fail(function() {  alert('Error. Not autorize'); thisenable.bootstrapToggle('toggle').bootstrapToggle('disable'); });

    })



});