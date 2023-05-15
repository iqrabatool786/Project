$(document).ready(function () {
    var valueobject = {};
    valueobject['OpCode'] = 1;
    FillData(valueobject, 'STypeID', 0, 'SPR_SType');
});
function InsertData() {
    if (ValidateTextBox($("#TxtSType"), 'SType cannot not be empty')) {
        executewithFillData(
            {
                'OpCode': 2,
                'SType': $("#TxtSType").val(),
                'STypeID': $("#hdnPrimaryFieldID").val(),
            }
            , 'SPR_SType');
    }
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
                edithtml = "FillData(1,'STypeID'," + $(this).find("STypeID").text() + ",'SPR_SType')";
                delhtml = "DeleteRow(3,'STypeID'," + $(this).find("STypeID").text() + ",'SPR_SType')";

                Tbl.row.add([
                    count,

                    $(this).find("SType").text(),
                    '<a href="#" id="btnEdit" onclick=' + edithtml + '><img src="ICON/edit.png" /></a>&ensp;|&ensp;' +
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
        var TableRow = $(this);
        $("#hdnPrimaryFieldID").val(TableRow.find("STypeID").text());
        $("#TxtSType").val(TableRow.find("SType").text());
    })
}