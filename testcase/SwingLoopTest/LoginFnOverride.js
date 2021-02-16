/*
  해당 JS를 로딩하는 이유는 Swing Common에서 호출하고있는 Confirm / Alert창을 제외하고 로그인 프로세싱을 돌리기 위해
  함수 자체를 오버라이딩 하기위해 로딩함.
  RobotFramework에서는 해당 JS를 로딩하기 위해서 다음과 같은 Keyword를 사용하여 JS를 실행함.
  Execute JavaScript           ${CURDIR}/test.js
  해당 JS는 Swing Common에서 작성한 함수로 Swing PJ를 테스트시에만 사용한다.
 */
/**
 * [btn_search_onclick Swing ID 검색 Fn]
 * @param  {[type]} e [event]
 * @return {[type]}   [     ]
 */
scwin.btn_search_onclick = function (e) {
    if (ngmf.isMobile()) {
        if (dst_input.getCellData(0, "login_id") == "1") {
            var chkVal = GLD.ngmf.getFormID();
            if (chkVal.indexOf("ZLIBSMAN700") == 0) {
                GLD.ngmf.destroy("ifr_1");
                GLV.iframeFixCnt = 2;
                GLV.iframeSetCnt = 10;
                GLD.scwin.native.setIframeCount(GLV.iframeFixCnt);
                return;
            }
        }
    }

    if (typeof GLD.ngmf._setCtiCall == "function") GLD.ngmf._setCtiCall("", false);
    var inDataList = "dst_input";
    var outDataList = "dsl_output";
    var trxCode = "ZNGMSLIN00010_TR02";
    if (typeof GLD.scwin.GlobalSetDum == "function") GLD.scwin.GlobalSetDum();
    var promise = ngmf.promise.asyncCall(trxCode, "ZNGMSLIN00020", "", inDataList, outDataList);
    promise.then(function (rtnObj) {
        var SrvId = rtnObj.svcId;
        var ErrorCode = rtnObj.errorCode;
        var ErrorMsg = rtnObj.errorMsg;
        scwin.callbackFunc(SrvId, ErrorCode, ErrorMsg);
    }).then(function () {
        GLD.scwin.setLoginData();
    }).then(function () {
        if (!ngmf.isMobile()) {
            GLD.scwin.f_HotKeyLoad();
        }
    });
};

/**
 * [btn_save_onclick Swing ID 저장 Fn]
 * @param  {[type]} e [event]
 * @return {[type]}   [     ]
 */
scwin.btn_save_onclick = function (e) {
    try {
        var modifiedArr = G_DS.getModifiedIndex();
        if (modifiedArr.length > 0) {
            GLD.GDS_GLOBALVARIABLE.setEventPause(null, true);
            GLD.GDS_GLOBALVARIABLE.removeAll();
            var newIndex = -1, ReqVariable = "", ReqVariableValue = "";
            for (var rowIndex = 0; rowIndex < G_DS.getRowCount(); rowIndex++) {
                newIndex = GLD.GDS_GLOBALVARIABLE.insertRow();
                ReqVariable = G_DS.getCellData(rowIndex, "Variable");
                ReqVariableValue = G_DS.getCellData(rowIndex, "Value");
                GLD.GDS_GLOBALVARIABLE.setCellData(newIndex, "ReqVariable", ReqVariable);
                GLD.GDS_GLOBALVARIABLE.setCellData(newIndex, "ReqVariableValue", ReqVariableValue);
            }
            GLD.GDS_GLOBALVARIABLE.setEventPause(null, false);
        }
        GLD.scwin.G_GetSysDate();

        if (!ngmf.isMobile()) {
            $w.local.setItem("globalVariables", JSON.stringify(GLD.GDS_GLOBALVARIABLE.getAllJSON()));
        }
        if (GLV["mdiGlobalVarsVal"]) $w.local.setItem("mdiGlobalVarsVal", JSON.stringify(GLV["mdiGlobalVars"]));
        GLV.G_DEVFG = "L";
        lbDevStatus.setValue("<font color='red'>[운영-로그인모드]</font>");
        ngmf.watermark(ngmf.getGlobalValue("g_Ngms_LogInId"));
        GLD.scwin.f_getMenuList();
        GLD.scwin.f_getJobList();
        if (ngmf.isMobile()) {
            GLD.ngmf.destroy("ifr_1");
            GLD.scwin.native.setIframeCount(GLV.iframeFixCnt);
            GLD.scwin.f_HotKeyLoad();
        }

        scwin.initGLD();
    } catch (e) {
    }
};

/**
 * 해당 함수는 Swing Project에서 Promise로 리턴되는 데이터를 받아 호출하는 함수이다. 결과적으로 Local Storage에 있는
 * 데이터를 WebSquare에서 읽을 수 있는 DataSet -> DataList로 사용자의 정보를 입력하는 CallBack Fn임.
 * @param transactionCode Service Code
 * @param errCode Error시 Error Code 전달
 * @param errMsg Error시 Error Msg 전달
 */
scwin.callbackFunc = function (transactionCode, errCode, errMsg) {
    if (transactionCode == "ZNGMSLIN00010_TR02") {
        if (Number(errCode[0]) == 0) {
            var confirmMsg = "조회한 정보를 Local Storage에 저장하시겠습니까?";
            var localIp = ngmf.getGlobalValue("g_Ngms_IpAddr");
            // ngmf.confirm(confirmMsg, function(returnVal) {

            G_DS.setCellData(0, "Value", dsl_output.getCellData(0, "user_id"));
            G_DS.setCellData(1, "Value", dsl_output.getCellData(0, "login_id"));
            G_DS.setCellData(2, "Value", dsl_output.getCellData(0, "emp_nm"));
            G_DS.setCellData(3, "Value", dsl_output.getCellData(0, "emp_num"));
            G_DS.setCellData(4, "Value", dsl_output.getCellData(0, "org_id"));
            G_DS.setCellData(5, "Value", dsl_output.getCellData(0, "hr_org_cd"));
            G_DS.setCellData(6, "Value", dsl_output.getCellData(0, "post_org_cd"));
            G_DS.setCellData(7, "Value", dsl_output.getCellData(0, "post_org_nm"));
            G_DS.setCellData(8, "Value", dsl_output.getCellData(0, "post_sale_org_cd"));
            G_DS.setCellData(9, "Value", dsl_output.getCellData(0, "post_sale_org_nm"));
            G_DS.setCellData(10, "Value", dsl_output.getCellData(0, "sup_sale_org_cd"));
            G_DS.setCellData(11, "Value", dsl_output.getCellData(0, "sup_sale_org_nm"));
            G_DS.setCellData(12, "Value", localIp || dsl_output.getCellData(0, "ip_addr"));
            G_DS.setCellData(13, "Value", dsl_output.getCellData(0, "br_typ_cd"));
            G_DS.setCellData(14, "Value", dsl_output.getCellData(0, "auth_id"));
            G_DS.setCellData(15, "Value", dsl_output.getCellData(0, "conn_org_id"));
            G_DS.setCellData(16, "Value", dsl_output.getCellData(0, "conn_org_cd"));
            G_DS.setCellData(17, "Value", dsl_output.getCellData(0, "conn_sale_org_id"));
            G_DS.setCellData(18, "Value", dsl_output.getCellData(0, "conn_sale_org_cd"));
            G_DS.setCellData(19, "Value", dsl_output.getCellData(0, "auth_typ_perm_cd"));
            G_DS.setCellData(20, "Value", dsl_output.getCellData(0, "post_sale_org_id"));
            G_DS.setCellData(21, "Value", dsl_output.getCellData(0, "sup_sale_org_id"));
            G_DS.setCellData(54, "Value", dsl_output.getCellData(0, "op_lvl_cd"));
            G_DS.setCellData(55, "Value", dsl_output.getCellData(0, "op_typ_cd"));
            G_DS.setCellData(62, "Value", dsl_output.getCellData(0, "mkt_div_org_id"));
            G_DS.setCellData(63, "Value", dsl_output.getCellData(0, "mkt_div_org_cd"));
            G_DS.setCellData(68, "Value", dsl_output.getCellData(0, "mktg_org_lvl_cd"));
            G_DS.setCellData(71, "Value", dsl_output.getCellData(0, "co_cl_cd"));
            G_DS.setCellData(78, "Value", dsl_output.getCellData(0, "conn_org_id_cl_cd"));
            G_DS.setCellData(79, "Value", dsl_output.getCellData(0, "sms_auth_yn"));
            G_DS.setCellData(80, "Value", dsl_output.getCellData(0, "screen_name"));
            G_DS.setCellData(81, "Value", dsl_output.getCellData(0, "user_main_id"));

            if (dsl_output.getCellData(0, "doc_auth_gubun")) {
                var doc_auth_gubun = dsl_output.getCellData(0, "doc_auth_gubun");
                if (GLV["G_CoClCd"] == "B") GLV["G_UsrDocAcl"] = "0" + doc_auth_gubun;
                else GLV["G_UsrDocAcl"] = doc_auth_gubun.substr(0, 1) + "0" + doc_auth_gubun.substr(1);
            }

            var modifiedArr = G_DS.getModifiedIndex();

            for (var i = 0; i < modifiedArr.length; i++) {
                var rowIndex = modifiedArr[i];
                var ReqVariable = G_DS.getCellData(rowIndex, "Variable");
                var ReqVariableValue = G_DS.getCellData(rowIndex, "Value");
                ngmf.setGlobalValue(ReqVariable, ReqVariableValue);
            }
            if (typeof GLD.scwin.setLoginStatus == "function") {
                GLD.scwin.setLoginStatus();
            }
            scwin.btn_save_onclick();
        }
    }
};