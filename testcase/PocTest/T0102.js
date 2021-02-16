var timer_index = 0;
var timer_timeset = 5000;
function myLoop (){
	var timeder_id = setTimeout(function(){
	timer_index++;
	timer_timeset=5000;
	if (timer_index == 1) {
		tw_menu_label_2.click();
	}else if(timer_index == 2){
		tw_menu_label_5.click();
		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
	}else if(timer_index == 3){
		tw_menu_label_6.click();
		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
	}else if(timer_index == 4){
		tw_menu_label_7.click();
		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
	}else if(timer_index == 5){
		tw_menu_label_8.click();
		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
	}else if(timer_index == 6){
		tw_menu_label_9.click();
		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
	}else if(timer_index == 7){
		tw_menu_label_10.click();
		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
	}else if(timer_index == 8){
		tw_menu_label_11.click();
		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
	}else if(timer_index == 9){
		tw_menu_label_12.click();
		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
	}else if(timer_index == 10){
		tw_menu_label_14.click();
	}else if(timer_index == 11){
		tw_menu_label_16.click();
		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
		timer_timeset=5000;
	}else if(timer_index == 12){
		tw_menu_label_18.click();
		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
	}else if(timer_index == 13){
		tw_menu_label_20.click();
	}else if(timer_index == 14){
		tw_menu_label_21.click();
	}else if(timer_index == 15){
		tw_menu_label_22.click();
	}else if(timer_index == 16){
		anc_tabClose.click();
	}else if(timer_index == 17){
		timer_index=0;
		WebSquare.core.clearJQuery();
	}myLoop();
	}, timer_timeset)
}myLoop();