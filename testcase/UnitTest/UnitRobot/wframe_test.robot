*** Settings ***
Library	 Selenium2Library

*** Variables ***
${APP}            inswave
${URL}           http://poc.inswave.com/websquare/websquare.html?w2xPath=/template/index_tabcontrol_new.xml 
#${URL}            https://www.google.co.kr
${BROWSER}        chrome
#${CURDIR}			D:\\W-Tester\\testcase\\UnitTest\\UnitRobot\\js_to_execute.js
#${CURDIR}			D:/W-Tester/testcase/UnitTest/UnitRobot/js_to_execute.js

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

${SUBMISSIONFUNC}	scwin.addTab( "AACM01", {label:"["+"AACM01"+"] "+"submissionFunc"} , {src:"/template/sample/gridview/autoCompleteSubFunc.xml"} );

${LARGEDATA}		scwin.addTab( "B00001", {label:"["+"B00001"+"] "+"대량데이터 로딩"} , {src:"/template/sample/gridview/largeData.xml"} ); 

${MULTILANG}		scwin.addTab( "C00001", {label:"["+"C00001"+"] "+"다국어 "} , {src:"/template/sample/gridview/serverMultiLang.xml"} ); 
${MULTIUPLOAD}		scwin.addTab( "D00001", {label:"["+"D00001"+"] "+"MultiUpload"} , {src:"/template/sample/gridview/udcMultiUpload.xml"} );
${CAL}				scwin.addTab( "D00002", {label:"["+"D00002"+"] "+"계산기"} , {src:"/template/sample/gridview/udcCal.xml"} );
${FROMTOCAL}		scwin.addTab( "D00003", {label:"["+"D00003"+"] "+"FromTo 달력"} , {src:"/template/sample/gridview/udcFromToCalendar.xml"} ); 

${CONSOLE_LOG} 		var len = 0 ; for(key in jQuery.cache) {if(jQuery.cache.hasOwnProperty(key)) len++;} console.log(len);
#${CONSOLE_FILE}  	var len = 0 ; for(key in jQuery.cache) {if(jQuery.cache.hasOwnProperty(key)) len++;} console.save(len, "aaa.txt");


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
    #Execute JavaScript   _fZl.click();
	#Execute JavaScript	function myLoop () {   setTimeout(function () {      alert('hello');      i++;      if (i < 10) {         myLoop();       }   }, 5000)} myLoop();
	#Execute JavaScript	var timer_index = 0;var timer_timeset = 5000;function myLoop (){setTimeout(function(){timer_index++;timer_timeset=5000;if (timer_index == 1) {${TEMPLATE}}else if(timer_index == 2){${CELLMERGE}${SEARCHBTN}}else if(timer_index == 3){${COPYPASTE}${SEARCHBTN}}else if(timer_index == 4){${DRILLDOWN}${SEARCHBTN}}else if(timer_index == 5){${EXCEL}${SEARCHBTN}${DOWNLOADECELL}}else if(timer_index == 6){${PAGE}${SEARCHBTN}}else if(timer_index == 8){${SCROLL}${SEARCHBTN}}else if(timer_index == 9){${RESIZECOLUMMOVE}${SEARCHBTN}}else if(timer_index == 10){${SUBMISSIONFUNC}}else if(timer_index == 11){${LARGEDATA}${SEARCHBTN}timer_timeset=60000*3;}else if(timer_index == 12){${MULTILANG}}else if(timer_index == 13){${MULTIUPLOAD}}else if(timer_index == 14){${CAL}}else if(timer_index == 15){${FROMTOCAL}timer_index=0;anc_tabClose.click();}myLoop();}, timer_timeset)}myLoop();
	#Execute JavaScript	var timer_index = 0;var timer_timeset = 5000;function myLoop (){setTimeout(function(){timer_index++;timer_timeset=5000;if (timer_index == 1) {${TEMPLATE}}else if(timer_index == 2){${CELLMERGE}${SEARCHBTN}}else if(timer_index == 3){${COPYPASTE}${SEARCHBTN}}else if(timer_index == 4){${DRILLDOWN}${SEARCHBTN}}else if(timer_index == 5){${EXCEL}${SEARCHBTN}${DOWNLOADECELL}}else if(timer_index == 6){${PAGE}${SEARCHBTN}}else if(timer_index == 8){${SCROLL}${SEARCHBTN}}else if(timer_index == 9){${RESIZECOLUMMOVE}${SEARCHBTN}}else if(timer_index == 10){${SUBMISSIONFUNC}}else if(timer_index == 11){${LARGEDATA}}else if(timer_index == 12){${MULTILANG}}else if(timer_index == 13){${MULTIUPLOAD}}else if(timer_index == 14){${CAL}}else if(timer_index == 15){${FROMTOCAL}timer_index=0;anc_tabClose.click();timer_timeset=60000*3;}myLoop();}, timer_timeset)}myLoop();
	Execute JavaScript		D:/W-Tester/testcase/UnitTest/UnitRobot/js_to_execute.js



Launch Application
#    Wait Until Element Is Visible    link=User-Friendly Techy-Help      20 Seconds
    Click Link     xpath=//a[@href="http://ufthelp.com/"]
	

Close Br
	Close BROWSER
