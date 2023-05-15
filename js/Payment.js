$(document).ready(function () {
    $(".Masking").mask("99/99/9999");
    GetDate('paymentDate');
    GetDate('ChequeDate');
    FillDropDown(1, 'cboClient', null, 'cboService', null, null, null, 0, 'SPR_dropdowns');
    FillDropDown(1, 'CboClientSearch', null, 'CboServiceSearch', null, null, null, 1, 'SPR_dropdowns');
    executewithFillData({ 'OpCode': 1 }, 'SPR_Payments');
    $("#cboPayMethod").val() == 1;
    TxtDue.checked = true;
    showHide();
    paiddue();
});

function showHide() {

    if ($("#cboPayMethod").val() == 2) {
        $(".hp").show();
        $(".hp1").hide();
    }
    else if ($("#cboPayMethod").val() == 3) {
        $(".hp1").show();
        $(".hp").hide();
    }

    else {
        $(".hp").hide();
        $(".hp1").hide();
    }
}
function paiddue() {

    if (TxtDue.checked) {
        $(".hs1").hide();
    } else {
        $(".hs1").show();
        showHide();
    }
}
function InsertData() {
    if (ValidateTextBox($("#TxtNarration"), 'Narration cannot not be empty')) {
        var valueobject = {};
        var paymentDate = ([$("#paymentDate").val().split("/")[1], $("#paymentDate").val().split("/")[0], $("#paymentDate").val().split("/")[2]]).join("/");
        var chequeDate = ([$("#ChequeDate").val().split("/")[1], $("#ChequeDate").val().split("/")[0], $("#ChequeDate").val().split("/")[2]]).join("/");
        valueobject['OpCode'] = 2;
        valueobject['PayID'] = $("#hdnPrimaryFieldID").val();
        valueobject['FK_ClientID'] = $("#cboClient").val();
        valueobject['Narration'] = $("#TxtNarration").val();
        valueobject['FK_ServiceID'] = $("#cboService").val();
        valueobject['PaymentMethod'] = $("#cboPayMethod").val();
        valueobject['ChequeNumber'] = $("#ChequeNumber").val();
        valueobject['ChequeDate'] = chequeDate;
        valueobject['TRXNumber'] = $("#TRXNumber").val();
        if (cboPayMethod.value == 2) {
            valueobject['TRXNumber'] = '';
        } else if (cboPayMethod.value == 3) {
            valueobject['ChequeNumber'] = '';
            valueobject['ChequeDate'] = '';
        } else {
            valueobject['ChequeNumber'] = '';
            valueobject['ChequeDate'] = '';
            valueobject['TRXNumber'] = '';
        }
        valueobject['PaymentDate'] = paymentDate;
        if (TxtPaid.checked == true) {
            valueobject['Debit'] = $("#TxtAmount").val();
        } else {
            valueobject['Credit'] = $("#TxtAmount").val();
        }
        executewithFillData(valueobject, 'SPR_Payments');
    }
}
function SearchData() {
    var FromDate = '';
    var ToDate = '';
    if ($("#FDsearch").val().length > 0) {
        FromDate = ([$("#FDsearch").val().split("/")[1], $("#FDsearch").val().split("/")[0], $("#FDsearch").val().split("/")[2]]).join("/");
    }
    if ($("#TDsearch").val().length > 0) {
        ToDate = ([$("#TDsearch").val().split("/")[1], $("#TDsearch").val().split("/")[0], $("#TDsearch").val().split("/")[2]]).join("/");
    }
    executewithFillData(
        {
            'OpCode': 6,
            'FK_ClientID': $('#CboClientSearch option:selected').val(),
            'FK_ServiceID': $('#CboServiceSearch option:selected').val(),
            'chkDC': $('#CboPStatus option:selected').val(),
            'FromDate': FromDate,
            'ToDate': ToDate,
        }
        , 'SPR_Payments');
}
function FillGrid(response) {

    var xmlDoc = $.parseXML(response.d);
    var xml = $(xmlDoc);
    var table = xml.find("Table");
    var Tbl = $('#example3').DataTable();
    Tbl.clear();
    var count = 0;
    if (table.length > 0) {
        table.each(function () {
            count += 1;
            edithtml = "FillData(1,'PayID'," + $(this).find("PayID").text() + ",'SPR_Payments')";
            delhtml = "DeleteRow(3,'PayID'," + $(this).find("PayID").text() + ",'SPR_Payments')";
            if ($(this).find("PaymentMethod").text() == 1) {
                $(this).find("PaymentMethod").text('Cash');
            } else if ($(this).find("PaymentMethod").text() == 2) {
                $(this).find("PaymentMethod").text('Cheque');
            } else {
                $(this).find("PaymentMethod").text('Online Transfer');
            }

            Tbl.row.add([
                count,

                $(this).find("Client").text(),
                $(this).find("AServices").text(),
                $(this).find("Narration").text(),
                $(this).find("PaymentMethod").text(),
                $(this).find("PaymentDate").text(),
                $(this).find("Amount").text(),
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


function FillEditeGrid(response) {
    SetModelDisplay("largemodal", 'show')
    var xmlDoc = $.parseXML(response.d);
    var xml = $(xmlDoc);
    var TableData = xml.find("Table");
    TableData.each(function () {
        $("#hdnPrimaryFieldID").val($(this).find("PayID").text());
        $("#TxtNarration").val($(this).find("Narration").text());
        $("#FK_ClientID").val($(this).find("Client").text());
        $("#FK_ServiceID").val($(this).find("AServices").text());
        $("#TxtAmount").val($(this).find("Amount").text());
        $("#cboPayMethod").val($(this).find("PaymentMethod").text());
        $("#paymentDate").val($(this).find("PaymentDate").text());
        $("#ChequeNumber").val($(this).find("ChequeNumber").text());
        $("#ChequeDate").val($(this).find("ChequeDate").text());
        $("#TRXNumber").val($(this).find("TRXNumber").text());
        if ($(this).find("ChkVal").text() > 1) {
            TxtPaid.checked = true;
        } else {
            TxtDue.checked = true;
        }
        paiddue();
    })
}