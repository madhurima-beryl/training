$(function(){
  $("#doctors-table, #doctors-table .pagination a").on("click", 'th a', function(){
    $.getScript(this.href);
    return false;
  });
  $("#doctors_search input").keyup(function() {
    $.get($("#doctors_search").attr("action"), $("#doctors_search").serialize(), null, "script");
    return false;
  });
});
