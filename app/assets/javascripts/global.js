// Update Active spaces Ratio
function init(stat_count=10){
  if(stat_count > 50){
   icon_class = "fa-arrow-circle-up";
  }
  else {
   icon_class = "fa-arrow-circle-down" ;
  }
  $('span#stat-count').html('<i title="Increased" data-rel="bootstrap-tooltip" class="fa '+icon_class+'"></i> '+stat_count+'&nbsp;%');
}