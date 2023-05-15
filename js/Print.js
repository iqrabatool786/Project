$(document).ready(function () {
    // location.href = https://www.google.com/search?q=bitbug
    const queryParams = new URLSearchParams(window.location.search);
    const keyword = queryParams.get('ClientID');
    EditRecord(keyword);
});



function EditRecord(FK_ClientID) {
    var valueobject = {};
    valueobject['OpCode'] = 10;
    valueobject['FK_ClientID'] = FK_ClientID;
    GetDataGrid1("1", FillEditeGrid, valueobject, "SPR_Payments");
}
function GetDataGrid1(dt, SucessFunction, ParamVal, Spname) {
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
function FillEditeGrid(response) {
    var xmlDoc = $.parseXML(response.d);
    var xml = $(xmlDoc);
    var TableData = xml.find("Table");
    var TableData1 = xml.find("Table1");
    var count = 0;
    var _html = '';


    var today = new Date();
    var date = today.getDate() + '/' + (today.getMonth() + 1) + '/' + today.getFullYear();
    var time = today.getHours() + ":" + today.getMinutes();


    var Total = 0;


    TableData.each(function () {
        var TableRow = $(this);


        if (count == 0) {

            CreatedDate = TableRow.find("CreatedDate").text();
            _html = "<div id='invoice_container' class='containerpdf''>"
                + "           <div class='lghd' >"
                + "           <div style='margin-bottom=100px' class='logo'>"
                + "            <img widt='50px' height='50px' src='Images/PDFLogo.JPEG'/>"
                + "              </div>"


                + " </div>"
                + " </div>"

                + "   <div class='Abc'>"
                + " <td> Dera IT Solutions</td>"
                + " <td>A&Z Plaza,VIP Block <br>Ghouri Town, Islamabad</td>"
                + "         </tr>"

                + "</div>"


                + "<div class='customer_container'>"
                + "  <tr>"
                + " <td>Invoice No:</td>"
                + "  <td>" + TableRow.find("Invoice").text() + "</td>"
                + "<br>"
                + "  <tr>"
                + " <td>Invoice Date:</td>"
                + "   <td>" + TableRow.find("PayDate").text() + "</td>"
                + "<br>"
                + "  <tr>"
                + " <td>Due Date :</td>"
                + "   <td>" + TableRow.find("PayDate").text() + "</td>"
                + "<br>"

                + "</tr>"
                + " <tr>"
                + "</table>"
                + " </div>"


                + " <div id = 'InvoicedTo' class='in_details' >"

                + " <h4 style='margin-bottom:1px;margin-left:1px';>Invoiced To</h4>"
                + " <span>" + TableRow.find("CompanyName").text() + "<br>" + TableRow.find("FullName").text() + "<br>" + TableRow.find("Address").text() + "<br>" + TableRow.find("Designation").text() + "<br>"


                + "</span>"
                + "</div>"
                + " <div style='margin-top:23px; class='product_container' >"
                + "  <table class='item_table' border='1' style='border-color: #f1eaea' cellspacing='0'>"
                + " <tr style='text-align: center; padding:10px 30px;background: #f1eaea'>"
                + "  <th style='text-align:justify;'>Description</th>"
                + "   <th style='text-align:justify;'>Total</th>"
                + "  </tr>"
            count = count + 1;
        }

        _html = _html + " <tr>"
            + " <td>" + TableRow.find("AServices").text() + "</td>"
            + " <td>" + TableRow.find("Balance").text() + "</td>"
            + " </tr >"

        Total = Total + parseFloat(TableRow.find("Balance").text());
    });

    _html = _html + "<tr id='inbold'>"
        + " <td style='text-align: right'>Total</td>"
        + "<td>" + Total + "</td>"
        + " </tr> </table> </div > "
        + "  <br/>"
        + " </div>";



    TableData1.each(function () {
        var TableRow = $(this);

        _html = _html + "<div class='Trx_container'>"
            + " <h2 style='margin-left:30px';>Transactions</h2>"
            + " <table class='item_table' border='1' style='border-color: #f1eaea; text - align: center; ' cellspacing='0'>"
            + " <thead style='background: #f1eaea'>"
            + " <th>PaymentDate</th>"
            + " <th>Gateway</th>"
            + " <th>Transaction ID</th>"
            + " <th>Amount</th>"
            + " </thead><tbody>"
            + " <tr>"
            + " <td  >" + TableRow.find("PaymentDate").text() + "</td>"
            + " <td  >" + TableRow.find("PayMethod").text() + "</td>"
            + " <td  >" + TableRow.find("PayID").text() + "</td>"
            + " <td  >" + TableRow.find("Paid").text() + "</td>"
            + " </tr>"


            + "<div class='Trx_container'>"
            + " <table class='item_table'  style='text-align: center; ' cellspacing='0'>"
            + "<p  style='text-align: center;class='footerdt_'> <b>Print Date and Time: </b>" + date + " " + time + "</p>"

            + " </thead><tbody>"


            + "</div>"
            + "</div>"




    });

    _html = _html + " </tbody></table>"

        + " </div >"
        + " </div>";



    generatePDF(_html);
}


function generatePDF(_html) {
    // Choose the element that our invoice is rendered in.
    const element = document.getElementById('invoice');
    element.innerHTML = _html;
    // Choose the element and save the PDF for our user.
    html2pdf().from(element).save();
}