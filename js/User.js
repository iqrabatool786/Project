$(document).ready(function () {
    FillDropDown(1, null, null, null, 'cboRole', null, null, 0, 'SPR_dropdowns');
    FillDropDown(1, null, null, null, 'cboRoles', null, null, 1, 'SPR_dropdowns');
    executewithFillData({ 'OpCode': 1 }, 'SPR_User');
});
function InsertData() {
    if (ValidateTextBox($("#TxtUserName"), 'UserName cannot not be empty')) {

        executewithFillData(
            {
                'OpCode': 2,
                'FK_RoleID': $("#cboRole").val(),
                'UserName': $("#TxtUserName").val(),
                'UPassword': $("#TxtPassword").val(),
                'FullName': $("#TxtFullName").val(),
                'UStatus': $("#cboStatus").val(),
                'UserID': $("#hdnPrimaryFieldID").val(),
                'UserAddress': $("#TxtAddress").val(),
                'CellNo': $("#TxtCellNo").val(),
                'UserEmail': $("#TxtMail").val(),
            }
            , 'SPR_User');
    }
}
function jsFunction() {
    executewithFillData(
        {
            'OpCode': 6,
            'FK_RoleID': $('#cboRoles option:selected').val(),
        }
        , 'SPR_User');
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
                edithtml = "FillData(1,'UserID'," + $(this).find("UserID").text() + ",'SPR_User')";
                delhtml = "DeleteRow(3,'UserID'," + $(this).find("UserID").text() + ",'SPR_User')";

                Tbl.row.add([
                    count,
                    $(this).find("UserName").text(),
                    $(this).find("UPassword").text(),
                    $(this).find("FullName").text(),
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
        $("#hdnPrimaryFieldID").val($(this).find("UserID").text());
        $("#TxtUserName").val($(this).find("UserName").text());
        $("#TxtPassword").val($(this).find("UPassword").text());
        $("#TxtFullName").val($(this).find("FullName").text());
        $("#cboRole").val($(this).find("FK_RoleID").text());
        $("#TxtAddress").val($(this).find("UserAddress").text());
        $("#TxtCellNo").val($(this).find("CellNo").text());
        $("#TxtMail").val($(this).find("UserEmail").text());
        if ($(this).find("UStatus").text() == 'true') {
            $("#cboStatus").val("1");
        } else {
            $("#cboStatus").val("0");
        };
    })

}