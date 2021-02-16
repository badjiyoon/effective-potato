*** Settings ***
Library	 Selenium2Library

*** Variables ***
${APP}            inswave
${URL}           http://poc.inswave.com/websquare/websquare.html?w2xPath=/template/index_tabcontrol_newIframe.xml 
#${URL}            https://www.google.co.kr
${BROWSER}        chrome

#${SEARCHBTN}		window.frames['tab_main_contents_AGRD01_body'].document.getElementById('btn_sch').click();
#${SEARCHBTN}		tab_main.getWindow().$w.getComponentById("sbx_SelectCount").setSelectedIndex(3);
${SEARCHBTN} 		tab_main.getWindow().$w.getComponentById("btn_sch").click();
${DOWNLOADECELL}	scwin.btn_ExcelDown_onclick();

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
	#Execute JavaScript	var timer_index = 0;function myLoop (){setTimeout(function(){timer_index++;if (timer_index == 1) {${TEMPLATE}}else if(timer_index == 2){${CELLMERGE}${SEARCHBTN}}else if(timer_index == 3){${COPYPASTE}${SEARCHBTN}}else if(timer_index == 4){${DRILLDOWN}${SEARCHBTN}}else if(timer_index == 5){${EXCEL}${SEARCHBTN}${DOWNLOADECELL}}else if(timer_index == 6){${PAGE}}else if(timer_index == 8){${SCROLL}}else if(timer_index == 9){${RESIZECOLUMMOVE}}else if(timer_index == 10){${SUBMISSIONFUNC}}else if(timer_index == 11){${LARGEDATA}}else if(timer_index == 12){${MULTILANG}}else if(timer_index == 13){${MULTIUPLOAD}}else if(timer_index == 14){${CAL}}else if(timer_index == 15){${FROMTOCAL}timer_index=0;}myLoop();}, 5000)}myLoop();
	#Execute JavaScript	var timer_index = 0;var timer_timeset = 5000;var is_searchbtn = false;function myLoop () {setTimeout(function () {timer_index++;timer_timeset=5000;if(is_searchbtn){${SEARCHBTN}is_searchbtn=false;myLoop();}if (timer_index == 1) {${TEMPLATE}}else if(timer_index == 2){${CELLMERGE}is_searchbtn=true;}else if(timer_index == 3){${COPYPASTE}is_searchbtn=true;}else if(timer_index == 4){${DRILLDOWN}is_searchbtn=true;}else if(timer_index == 5){${EXCEL}is_searchbtn=true;}else if(timer_index == 6){${FOOTERSUBTOTAL}is_searchbtn=true;}else if(timer_index == 7){${PAGE}is_searchbtn=true;}else if(timer_index == 8){${SCROLL}is_searchbtn=true;}else if(timer_index == 9){${RESIZECOLUMMOVE}is_searchbtn=true;}else if(timer_index == 10){${SUBMISSIONFUNC}}else if(timer_index == 11){${LARGEDATA}timer_timeset=60000*5;is_searchbtn=true;}else if(timer_index == 12){${MULTILANG}is_searchbtn=true;}else if(timer_index == 13){${MULTIUPLOAD}is_searchbtn=true;}else if(timer_index == 14){${CAL}}else if(timer_index == 15){${FROMTOCAL}timer_index=0;}myLoop();}, timer_timeset)}myLoop();
	#Execute JavaScript var timer_index = 0;var timer_timeset = 5000;var is_searchbtn = false;function myLoop () {setTimeout(function () {timer_index++;timer_timeset=5000;if(is_searchbtn){${SEARCHBTN}is_searchbtn=false;myLoop();}if (timer_index == 1) {${TEMPLATE}}else if(timer_index == 2){${CELLMERGE}is_searchbtn=true;}else if(timer_index == 3){${COPYPASTE}is_searchbtn=true;}else if(timer_index == 4){${DRILLDOWN}is_searchbtn=true;}else if(timer_index == 5){${EXCEL}is_searchbtn=true;}else if(timer_index == 6){${FOOTERSUBTOTAL}is_searchbtn=true;}else if(timer_index == 7){${PAGE}is_searchbtn=true;}else if(timer_index == 8){${SCROLL}is_searchbtn=true;}else if(timer_index == 9){${RESIZECOLUMMOVE}is_searchbtn=true;}else if(timer_index == 10){${SUBMISSIONFUNC}}else if(timer_index == 11){${LARGEDATA}timer_timeset=60000*5;is_searchbtn=true;}else if(timer_index == 12){${MULTILANG}is_searchbtn=true;}else if(timer_index == 13){${MULTIUPLOAD}is_searchbtn=true;}else if(timer_index == 14){${CAL}}else if(timer_index == 15){${FROMTOCAL}timer_index=0;}myLoop();}, timer_timeset)}myLoop();
	#Execute JavaScript	var timer_index = 0;var timer_timeset = 5000;var is_searchbtn = false;function myLoop () {setTimeout(function () {timer_index++;if(is_searchbtn){${SEARCHBTN}is_searchbtn=false;}else{if(timer_index == 2){${CELLMERGE}is_searchbtn=true;}else if(timer_index == 3){${COPYPASTE}is_searchbtn=true;}else if(timer_index == 4){${DRILLDOWN}is_searchbtn=true;}}myLoop();},timer_timeset)}myLoop();
	Execute JavaScript	var timer_index = 1;var timer_timeset = 1500;var is_searchbtn = false;function myLoop () {setTimeout(function () {timer_timeset=4500;if(is_searchbtn){${SEARCHBTN}is_searchbtn=false;}else{if (timer_index == 1) {${TEMPLATE}timer_index++;}else if(timer_index == 2){${CELLMERGE}timer_index++;is_searchbtn=true;}else if(timer_index == 3){${COPYPASTE}timer_index++;is_searchbtn=true;}else if(timer_index == 4){${DRILLDOWN}timer_index++;is_searchbtn=true;}else if(timer_index == 5){${EXCEL}timer_index++;is_searchbtn=true;}else if(timer_index == 6){${FOOTERSUBTOTAL}timer_index++;is_searchbtn=true;}else if(timer_index == 7){${PAGE}timer_index++;is_searchbtn=true;}else if(timer_index == 8){${SCROLL}timer_index++;is_searchbtn=true;}else if(timer_index == 9){${RESIZECOLUMMOVE}timer_index++;is_searchbtn=true;}else if(timer_index == 10){${SUBMISSIONFUNC}timer_index++;}else if(timer_index == 11){${LARGEDATA}timer_index++;is_searchbtn=false;}else if(timer_index == 12){${MULTILANG}timer_index++;is_searchbtn=true;}else if(timer_index == 13){${MULTIUPLOAD}timer_index++;is_searchbtn=false;}else if(timer_index == 14){${CAL}timer_index++;}else if(timer_index == 15){${FROMTOCAL}timer_index=1;anc_tabClose.click();timer_timeset=5000;}}myLoop();}, timer_timeset)}myLoop();

	#Execute JavaScript	${SEARCHBTN}

Launch Application
#    Wait Until Element Is Visible    link=User-Friendly Techy-Help      20 Seconds
    Click Link     xpath=//a[@href="http://ufthelp.com/"]

Close Br
	Close BROWSER
