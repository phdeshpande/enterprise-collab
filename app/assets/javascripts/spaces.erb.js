// Update Active spaces Ratio
function init(active_spaces_ratio=10){
  if(active_spaces_ratio > 50){
   icon_class = "fa-arrow-circle-up";
  }
  else {
   icon_class = "fa-arrow-circle-down" ;
  }
  $('span#active-spaces').html('<i title="Increased" data-rel="bootstrap-tooltip" class="fa '+icon_class+'"></i> '+active_spaces_ratio+'&nbsp;%');
}
