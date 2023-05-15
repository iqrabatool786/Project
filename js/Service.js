$(document).ready(function () {
    FillDropDown(1, null, null, 'cboService', null, null, null, 0, 'SPR_dropdowns');
    executewithFillData({ 'OpCode': 1 }, 'SPR_Services');
});
function InsertData() {
    if (ValidateTextBox($("#TxtService"), 'Service cannot not be empty')) {
        executewithFillData(
            {
                'OpCode': 2,
                'AServices': $("#TxtService").val(),
                'isActive': $("#cboStatus").val(),
                'ServiceID': $("#hdnPrimaryFieldID").val(),
            }
            , 'SPR_Services');
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



                edithtml = "FillData(1,'ServiceID'," + $(this).find("ServiceID").text() + ",'SPR_Services')";
                delhtml = "DeleteRow(3,'ServiceID'," + $(this).find("ServiceID").text() + ",'SPR_Services')";
                Tbl.row.add([
                    count,
                    $(this).find("AServices").text(),
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
        $("#hdnPrimaryFieldID").val($(this).find("ServiceID").text());
        $("#TxtService").val($(this).find("AServices").text());
        if ($(this).find("isActive").text() == 'true') {
            $("#cboStatus").val("1");
        } else {
            $("#cboStatus").val("0");
        }
    });
}