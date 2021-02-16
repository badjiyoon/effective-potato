*** Settings ***
Library	 Selenium2Library

*** Variables ***
${APP}            inswave
${URL}           http://poc.inswave.com/websquare/websquare.html?w2xPath=/template/index_tabcontrol_new.xml 
#${URL}            https://www.google.co.kr
${BROWSER}        chrome

${SEARCHBTN}		tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_sch').trigger('onclick');
${DOWNLOADECELL}	tab_main.getFrame(tab_main.getSelectedTabIndex()).getObj('btn_ExcelDown').trigger('onclick');

${TEMPLATE}			scwin.addTab( "000001", {label:"["+"000001"+"] "+"화면샘플"} , {src:"/template/sample/gridview/template.xml"} );

${CELLMERGE}		scwin.addTab( "AGRD01", {label:"["+"AGRD01"+"] "+"셀병합"} , {src:"/template/sample/gridview/cellMerge.xml"} );
${COPYPASTE}		scwin.addTab( "AGRD02", {label:"["+"AGRD02"+"] "+"값 복사"} , {src:"/template/sample/gridview/copyPaste.xml"} );
${DRILLDOWN}		scwin.addTab( "AGRD03", {label:"["+"AGRD03"+"] "+"드릴다운 "} , {src:"/template/sample/gridview/drilldown.xml"} );
${EXCEL}			scwin.addTab( "AGRD04", {label:"["+"AGRD04"+"] "+"엑셀 다운로드"} , {src:"/template/sample/gridview/excel.xml"} );	
${FOOTERSUBTOTAL}	scwin.addTab( "AGRD05", {label:"["+"AGRD05"+"] "+"소계, 합계"} , {src:"/template/sample/gridview/footerSubTotal.xml"} ); 	
${PAGE}				scwin.addTab( "AGRD06", {label:"["+"AGRD06"+"] "+"페이징 처리"} , {src:"/template/sample/gridview/page.xml"} ); 
${SCROLL}			scwin.addTab( "AGRD07", {label:"["+"AGRD07"+"] "+"스크롤 처리"} , {src:"/template/sample/gridview/scroll.xml"} );	
${RESIZECOLUMMOVE}	scwin.addTab( "AGRD08", {label:"["+"AGRD08"+"] "+"컬럼이동 "} , {src:"/template/sample/gridview/resizeColumnMove.xml"} );

${SUBMISSIONFUNC}	scwin.addTab( "AACM01", {label:"["+"AACM01"+"] "+"submissionFunc"} , {src:"/template/sample/autoComplete/autoCompleteSubFunc.xml"} );

${LARGEDATA}		scwin.addTab( "B00001", {label:"["+"B00001"+"] "+"대량데이터 로딩"} , {src:"/template/sample/gridview/largeData.xml"} ); 

${MULTILANG}		scwin.addTab( "C00001", {label:"["+"C00001"+"] "+"다국어 "} , {src:"/template/sample/multiLang/serverMultiLang.xml"} );
${MULTIUPLOAD}		scwin.addTab( "D00001", {label:"["+"D00001"+"] "+"MultiUpload"} , {src:"/template/sample/udc/udcMultiUpload.xml"} );
${CAL}				scwin.addTab( "D00002", {label:"["+"D00002"+"] "+"계산기"} , {src:"/template/sample/udc/udcCal.xml"} );
${FROMTOCAL}		scwin.addTab( "D00003", {label:"["+"D00003"+"] "+"FromTo 달력"} , {src:"/template/sample/udc/udcFromToCalendar.xml"} );

${JQUERYCLEAN}		WebSquare.core.clearJQuery();
#${JQUERYCLEAN}		jQuery.cache = {};

${DELETE_MAINCONTENTS} 		tab_main_contents_content1_body_widgetContainer1.removeWidgets(["tab_main_contents_content1_body_widgetContainer1_widget0","tab_main_contents_content1_body_widgetContainer1_widget1","tab_main_contents_content1_body_widgetContainer1_widget2","tab_main_contents_content1_body_widgetContainer1_widget3","tab_main_contents_content1_body_widgetContainer1_widget4","tab_main_contents_content1_body_widgetContainer1_widget5"]);


*** Test Cases ***
[TC-001]-Launching the browser and search and launch the 'inswave' Application
    Launch Browser
    Search Application On Google
    #Launch Application
    #Close Br

*** Keywords ***
Launch Browser
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window

Search Application On Google
    #Input Text    id=lst-ib    ${APP}
	#Execute JavaScript	var timer_index = 0;var timer_timeset = 3000;function myLoop (){setTimeout(function(){timer_index++;timer_timeset=3000;if (timer_index == 1) {${TEMPLATE}}else if(timer_index == 2){${CELLMERGE}${SEARCHBTN}}else if(timer_index == 3){${COPYPASTE}${SEARCHBTN}}else if(timer_index == 4){${DRILLDOWN}${SEARCHBTN}}else if(timer_index == 5){${EXCEL}${SEARCHBTN}${DOWNLOADECELL}}else if(timer_index == 6){${PAGE}${SEARCHBTN}}else if(timer_index == 8){${SCROLL}${SEARCHBTN}}else if(timer_index == 9){${RESIZECOLUMMOVE}${SEARCHBTN}}else if(timer_index == 10){${SUBMISSIONFUNC}}else if(timer_index == 11){${LARGEDATA}${SEARCHBTN}timer_timeset=5000;}else if(timer_index == 12){${MULTILANG}${SEARCHBTN}}else if(timer_index == 13){${MULTIUPLOAD}}else if(timer_index == 14){${CAL}}else if(timer_index == 15){${FROMTOCAL}}else if(timer_index == 16){timer_index=0;anc_tabClose.click();}myLoop();}, timer_timeset)}myLoop();
	Execute JavaScript		${CURDIR}/T0404.js
	
	
Launch Application
#    Wait Until Element Is Visible    link=User-Friendly Techy-Help      20 Seconds
    Click Link     xpath=//a[@href="http://ufthelp.com/"]

Close Br
	Close BROWSER
