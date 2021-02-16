var timer_index = 0;
var timer_timeset = 5000;
function myLoop (){
	var timeder_id = setTimeout(function(){
	timer_index++;
	timer_timeset=5000;
	if(timer_index == 1){
		tw_menu_label_20.click();
		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
	}else if(timer_index == 2){
		timer_index=0;
		anc_tabClose.click();
	}myLoop();
	}, timer_timeset)
}myLoop();