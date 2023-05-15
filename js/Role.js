$(document).ready(function () {
    var valueobject = {};
    valueobject['OpCode'] = 1;
    FillData(valueobject, 'RoleID', 0, 'SPR_Role');
});
function InsertData() {
    if (ValidateTextBox($("#TxtRole"), 'Role cannot not be empty')) {

        executewithFillData(
            {
                'OpCode': 2,
                'Roles': $("#TxtRole").val(),
                'RoleID': $("#hdnPrimaryFieldID").val(),
            }
            , 'SPR_Role');
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
                edithtml = "FillData(1,'RoleID'," + $(this).find("RoleID").text() + ",'SPR_Role')";
                delhtml = "DeleteRow(3,'RoleID'," + $(this).find("RoleID").text() + ",'SPR_Role')";
                Tbl.row.add([
                    count,
                    $(this).find("Roles").text(),
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
        $("#hdnPrimaryFieldID").val($(this).find("RoleID").text());
        $("#TxtRole").val($(this).find("Roles").text());


    })
}