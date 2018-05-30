$(function(){
  $("#doctors-table th a").live("click", function(){
    $.getScript(this.href);
    return false;
  });
});