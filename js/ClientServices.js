$(document).ready(function () {
    FillDropDown(1, 'CboClient', 'CboSType', 'CboServices', null, null, null, 0, 'SPR_dropdowns');
    FillDropDown(1, 'CboClientSearch', null, 'CboServiceSearch', null, null, null, 1, 'SPR_dropdowns');
    executewithFillData({ 'OpCode': 1 }, 'SPR_ClientServ');
});
function InsertData() {
    if (ValidateTextBox($("#TxtCharges"), 'Charges cannot not be empty')) {

        executewithFillData(
            {
                'OpCode': 2,
                'FK_ClientID': $("#CboClient").val(),
                'FK_ServiceID': $("#CboServices").val(),
                'FK_isSTypeID': $("#CboSType").val(),
                'Charges': $("#TxtCharges").val(),
                'CSID': $("#hdnPrimaryFieldID").val(),
            }
            , 'SPR_ClientServ');
    }
}
function SearchData() {

    executewithFillData(
        {
            'OpCode': 6,
            'FK_ClientID': $('#CboClientSearch option:selected').val(),
            'FK_ServiceID': $('#CboServiceSearch option:selected').val(),
        }
        , 'SPR_ClientServ');
}
function FillGrid(response) {
    if (response.d.includes('Error:')) {
        alert(response.d);
    }
    else {
        var xmlDoc = $.parseXML(response.d);
        var xml = $(xmlDoc);
        var table = xml.find("Table");
        var Tbl = $('#example3').DataTable();
        Tbl.clear();
        var count = 0;
        if (table.length > 0) {
            table.each(function () {
                count += 1;
                delhtml = "DeleteRow(3,'CSID'," + $(this).find("CSID").text() + ",'SPR_ClientServ')";
                edithtml = "FillData(1,'CSID'," + $(this).find("CSID").text() + ",'SPR_ClientServ')";
                Tbl.row.add([
                    count,
                    $(this).find("Client").text(),
                    $(this).find("AServices").text(),
                    $(this).find("SType").text(),
                    $(this).find("Charges").text(),
                    '<a href="#" id="btnEdit" onclick=' + edithtml + '><img src="ICON/edit.png" /></a> &ensp;|&ensp;' +
                    '<a href="#" id="btnDelete" onclick=' + delhtml + '><img src="ICON/delete.png"/></a>'
                ]);
                Tbl.draw(false);
            });
        }
        else {
            Tbl.draw(false);
        }
        SetModelDisplay("largemodal", 'hide');
        cleartextbox();
    }
}

function FillEditeGrid(response) {
    SetModelDisplay("largemodal", 'show')
    var xmlDoc = $.parseXML(response.d);
    var xml = $(xmlDoc);
    var TableData = xml.find("Table");
    TableData.each(function () {
        $("#hdnPrimaryFieldID").val($(this).find("CSID").text());
        $("#CboClient").val($(this).find("FK_ClientID").text());
        $("#CboServices").val($(this).find("FK_ServiceID").text());
        $("#CboSType").val($(this).find("FK_isSTypeID").text());
        $("#TxtCharges").val($(this).find("Charges").text());
    })
}