var timer_index = 1;
var timer_timeset = 1500;
var is_searchbtn = false;
function myLoop () {
	setTimeout(function () {
		timer_timeset=4500;
		if(is_searchbtn){
			//tab_main.getWindow().$w.getComponentById("btn_sch").click();
			tab_main.getWindow().$w.getComponentById("btn_sch").trigger("onclick");
			is_searchbtn=false;
		}else{
			if (timer_index == 1) {
				tw_menu_label_2.click();
				timer_index++;
			}else if(timer_index == 2){
				tw_menu_label_5.click();
				timer_index++;
				is_searchbtn=true;
			}else if(timer_index == 3){
				tw_menu_label_6.click();
				timer_index++;
				is_searchbtn=true;
			}else if(timer_index == 4){
				tw_menu_label_7.click();
				timer_index++;
				is_searchbtn=true;
			}else if(timer_index == 5){
				tw_menu_label_8.click();
				timer_index++;
				is_searchbtn=true;
			}else if(timer_index == 6){
				tw_menu_label_9.click();
				timer_index++;
				is_searchbtn=true;
			}else if(timer_index == 7){
				tw_menu_label_10.click();
				timer_index++;
				is_searchbtn=true;
			}else if(timer_index == 8){
				tw_menu_label_11.click();
				timer_index++;
				is_searchbtn=true;
			}else if(timer_index == 9){
				tw_menu_label_12.click();
				timer_index++;
				is_searchbtn=true;
			}else if(timer_index == 10){
				tw_menu_label_14.click();
				timer_index++;
			}else if(timer_index == 11){
				tw_menu_label_16.click();
				timer_index++;
				is_searchbtn=true;
			}else if(timer_index == 12){
				tw_menu_label_18.click();
				timer_index++;
				is_searchbtn=true;
			}else if(timer_index == 13){
				tw_menu_label_20.click();
				timer_index++;
				is_searchbtn=false;
			}else if(timer_index == 14){
				tw_menu_label_21.click();
				timer_index++;
			}else if(timer_index == 15){
				timer_index++;
				tw_menu_label_22.click();
			}else if(timer_index == 16){
				timer_index=1;
				anc_tabClose.click();
				timer_timeset=5000;
			}
		}myLoop();
	}, timer_timeset)
}myLoop();	