function SetModelDisplay(MyModel, show_hide) {
    $("#" + MyModel).modal(show_hide);
     
}

var AttachmentType = {
    Map: 1,
    Aggrement: 2,
    CNIC: 3,
    Transfer: 4,
    Witness: 5,
    LedgerAttach:6
};
function ValidateTextBox(TextboxName, Msg) {
    var _retval = true;
    var getVal = TextboxName.val().trim();
    if (getVal === "")
    {
        alert(Msg);
        TextboxName.focus();
        _retval = false;
    }
    return _retval;
}

function GetcheckboxVal(chboxIsown) {
    var IsOwn = "";
    if ($("#" + chboxIsown).prop('checked')) {
        IsOwn = 1;
    } else {
        IsOwn = 0;
    }
    return IsOwn;
}

function IssessionConnected(sessionvalue) {
    if (sessionvalue>0) {
        return true;
    }
    else {
        return false;
    }
    // if sesssion empty then login page
    //and resturn false
    // else true


    
}

 function not67(types,msgs) {
            notif({
                type: types,
                msg: msgs,
                position: "center",
                opacity: 0.8
            });
        }

function GetDataGrid(dt,SucessFunction, ParamVal, Spname)
{
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "WSLNDasmx.asmx/PostBack?dt=" + dt +"&Spname=" + Spname,
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify({ values: ParamVal }),
        success: SucessFunction,
        failure: function (response) {
            alert(response.d);
        },
        error: function (responce) {
            alert(responce.d);
        }
    });
}
  
function filljsonDropdowns(DropdownName, ParamVal, Spname) {
    $.ajax({
        type: "POST",
        url: "FillDataService.asmx/GetJsonObjectData?Spname=" + Spname,
        data: JSON.stringify({ values: ParamVal }),
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
    }).done(function (data) {
        dataSet = data.d;
        $("#" + DropdownName).empty();
        $.each(dataSet, function (key, value) {
            $("#" + DropdownName).append('<option value=' + value.RecordID + '>' + value.Record + '</option>');
        });
    }).fail(function (jqXHR, textStatus, errorThrown) { alert(textStatus.value); });
}
function filljsonDropdown(DropdownName, ParamVal) {
    $.ajax({
        type: "POST",
        url: "FillDataService.asmx/GetJsonObjectData?Spname=SPR_DropDowns",
        data: JSON.stringify({ values: ParamVal }),
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
    }).done(function (data) {
        dataSet = data.d;
        $("#" + DropdownName).empty();
        $.each(dataSet, function (key, value) {
            $("#" + DropdownName).append('<option value=' + value.RecordID + '>' + value.Record + '</option>');
        });
    }).fail(function (jqXHR, textStatus, errorThrown) { alert(textStatus.value); });
}

function fillDropdownss(DropdownName, values) {
    $.ajax({
        type: "POST",
        url: "FillDataService.asmx/GetJsonObject?Spname=SPR_DropDowns",
        data: '{OpCode:' + values + '}',
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
    }).done(function (data) {
        dataSet = data.d;
        $("#" + DropdownName).empty();
        $.each(dataSet, function (key, value) {
            $("#" + DropdownName).append('<option value=' + value.RecordID + '>' + value.Record + '</option>');
        });
    }).fail(function (jqXHR, textStatus, errorThrown) { alert(textStatus.value); });
}

function GetRedirect(PrimaryID, PageName) {

    $.ajax({
        type: "POST",
        url: "WSLNDasmx.asmx/RedirectURL",
        data: '{id:' + PrimaryID + ',pagename:"' + PageName + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            location.href = response.d;
        },
        failure: function (response) {
            alert(response.d);
        }
    });
}
 

function filljsonDropdownswithAll(DropdownName, ParamVal, Spname) {
    $.ajax({
        type: "POST",
        url: "FillDataService.asmx/GetJsonObjectData?Spname=" + Spname,
        data: JSON.stringify({ values: ParamVal }),
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
    }).done(function (data) {
        dataSet = data.d;
        $("#" + DropdownName).empty();
        $("#" + DropdownName).append('<option value="">-</option>');
        $.each(dataSet, function (key, value) {
            $("#" + DropdownName).append('<option value=' + value.RecordID + '>' + value.Record + '</option>');
        });
    }).fail(function (jqXHR, textStatus, errorThrown) { alert(textStatus.value); });
}

 





 