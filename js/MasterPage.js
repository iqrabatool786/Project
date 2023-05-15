function formatDatetodd(input) {
    if (input.length > 0) {
        var datePart = input.match(/\d+/g),
            year = '20' + datePart[0].substring(2),
            month = datePart[1],
            day = datePart[2];

        return month + '/' + day + '/' + year;
    }
    return null;
}


function DeleteRow(OpCode, PrimaryFieldName, PrimaryFieldVal, StoreProc) {
    var v = confirm('Are You Sure to Deleting this record!!!!');
    if (v === true) {
        var valueobject = {};
        valueobject['OpCode'] = OpCode;
        valueobject[PrimaryFieldName] = PrimaryFieldVal;
        executewithFillData(valueobject, StoreProc)
    }
}


function cleartextbox() {
    $('.clrtxt').val("");
    $("#hdnPrimaryFieldID").val('');
}

function FillData(Opcode, PrimaryKeyField, PrimaryKeyFieldValue, StoreProc) {
    if (PrimaryKeyFieldValue > 0) {
        var valueobject = {};
        valueobject['Opcode'] = Opcode;
        valueobject[PrimaryKeyField] = PrimaryKeyFieldValue;

        GetDataGrid("1", FillEditeGrid, valueobject, StoreProc);
    }
    else {
        GetDataGrid("1", FillGrid, Opcode, StoreProc);
    }
}

function executewithFillData(valueobject, StoreProc) {
    GetDataGrid("1", FillGrid, valueobject, StoreProc);
}









function GetDataGrid(dt, SucessFunction, ParamVal, Spname) {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "WSLNDasmx.asmx/PostBack?dt=" + dt + "&Spname=" + Spname,
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


function PrintData(Opcode, PrimaryKeyField, PrimaryKeyFieldValue, StoreProc) {

    var valueobject = {};
    valueobject['Opcode'] = Opcode;
    valueobject[PrimaryKeyField] = PrimaryKeyFieldValue;

    GetDataGrid("1", printDatagrid, valueobject, StoreProc);

}

function executewithFillData(valueobject, StoreProc) {
    GetDataGrid("1", FillGrid, valueobject, StoreProc);
     
    } 
    function executewithFillDataandprint(valueobject, StoreProc) {
    GetDataGrid("1", revenuesummary, valueobject, StoreProc);
}








function looptofillData(dtdata, dropdownName, EmptyVal) {
    $("#" + dropdownName).empty();
    if (EmptyVal == '1') {
        $("#" + dropdownName).append('<option value="">--All--</option>');
    }
    dtdata.each(function () {
        $("#" + dropdownName).append('<option value="' + $(this).find("RecordID").text() + '">' + $(this).find("Record").text() + '</option>');

    })
}


function looptofillDataWithSelect(dtdata, dropdownName, EmptyVal, SelVal) {
    $("#" + dropdownName).empty();
    if (EmptyVal == '1') {
        $("#" + dropdownName).append('<option value="">--All--</option>');
    }
    dtdata.each(function () {
        $("#" + dropdownName).append('<option value="' + $(this).find("RecordID").text() + '">' + $(this).find("Record").text() + '</option>');

    })
    /*$('#' + dropdownName + 'option[value=2]').attr('selected', 'selected');*/
    $("#" + dropdownName + " select").val(SelVal);
}

function FillDropDownwithSelect(valueobject, dropdownName, dropdownName1, dropdownName2, dropdownName3, dropdownName4, dropdownName5, EmptyVal, Spname, SelVal) {

    $.ajax({
        type: "POST",
        dataType: "json",
        url: "WSLNDasmx.asmx/PostBack?dt=1&Spname=" + Spname,
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify({ values: valueobject }),
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            if (dropdownName != null) {
                looptofillDataWithSelect(xml.find("Table"), dropdownName, EmptyVal, SelVal)
            }
            if (dropdownName1 != null) {
                looptofillDataWithSelect(xml.find("Table1"), dropdownName1, EmptyVal, SelVal)
            }
            if (dropdownName2 != null) {
                looptofillDataWithSelect(xml.find("Table2"), dropdownName2, EmptyVal, SelVal)
            }
            if (dropdownName3 != null) {
                looptofillDataWithSelect(xml.find("Table3"), dropdownName3, EmptyVal, SelVal)
            }
            if (dropdownName4 != null) {
                looptofillDataWithSelect(xml.find("Table4"), dropdownName4, EmptyVal, SelVal)
            }
            if (dropdownName5 != null) {
                looptofillDataWithSelect(xml.find("Table5"), dropdownName5, EmptyVal, SelVal)
            }
        },
        failure: function (response) {
            alert(response.d);
        },
        error: function (responce) {
            alert(responce.d);
        }
    });
}




function FillDropDown(Opcode, dropdownName, dropdownName1, dropdownName2, dropdownName3, dropdownName4, dropdownName5, EmptyVal, Spname) {
    var valueobject = {};
    valueobject['OpCode'] = Opcode;
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "WSLNDasmx.asmx/PostBack?dt=1&Spname=" + Spname,
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify({ values: valueobject }),
        success: function (response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            if (dropdownName != null) {
                looptofillData(xml.find("Table"), dropdownName, EmptyVal)
            }
            if (dropdownName1 != null) {
                looptofillData(xml.find("Table1"), dropdownName1, EmptyVal)
            }
            if (dropdownName2 != null) {
                looptofillData(xml.find("Table2"), dropdownName2, EmptyVal)
            }
            if (dropdownName3 != null) {
                looptofillData(xml.find("Table3"), dropdownName3, EmptyVal)
            }
            if (dropdownName4 != null) {
                looptofillData(xml.find("Table4"), dropdownName4, EmptyVal)
            }
            if (dropdownName5 != null) {
                looptofillData(xml.find("Table5"), dropdownName5, EmptyVal)
            }
        },
        failure: function (response) {
            alert(response.d);
        },
        error: function (responce) {
            alert(responce.d);
        }
    });
}


function iscnic(txt) {
    txt.value = txt.value.replace(/[^0-9\n\r-]+/g, '');

}
function isemail(txt) {
    var validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if (txt.value.match(validRegex)) {
        return true;
    } else {
        txt.value = "";
        return false;
    }
}

function isalpha(txt) {
    txt.value = txt.value.replace(/[^a-zA-Z \n\r\/,]+/g, '');
}
function isint(txt) {
    txt.value = txt.value.replace(/[^0-9\n\r]+/g, '');
}

function isfloat(txt) {
    txt.value = txt.value.replace(/[^0-9\n\r.]+/g, '');
}
function GetDate(dropdownName) {
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = dd + '/' + mm + '/' + yyyy;

    $("#" + dropdownName).val(today)

}