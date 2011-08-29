var DNSimpleTouch ={};

DNSimpleTouch.AjaxProgress = function(body) {  
  var $progress = $("<div/>").addClass("progress");
  var $error = $("<div/>")
    .addClass("error")
    .text("Error retrieving data ...");
  
  var display = function(element) {
    body.find(".current").append(element);
  }

  body
    .ajaxStart(function() { 
      $error.remove();
      display($progress); 
    })
    .ajaxComplete(function() { $progress.remove(); })
    .ajaxError(function() { display($error); });
};

DNSimpleTouch.Login = function ($form) {
  $.ajax({
    type:$form.attr("method"), url:$form.attr("action"),
    dataType:"json", data:$form.serialize(),
    sucess:function (req) {
      if (req.status === 200 || req.status === 304) {
        jQT.goBack();
      } else {
        alert("There was an error logging in. Try again.");
      }
    },
    error: function(){/*console.log( "Login error")*/}
  });    

  return false;
};

jQuery(function() {
  
  DNSimpleTouch.AjaxProgress( $("body"));
  /**
   * todo: use Ajax for form submissions [2011.08.27 florin]
   */ 
});