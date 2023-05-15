<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <style>
           .containerpdf {
               text-align: center;
               padding: 3em;
               max-width: 1000px auto;
               margin: 0;
               box-sizing: border-box;
               font-family: Arial;
               align-items: center;
           }

           .invoice, ._grid {
               display: none;
           }

           .containerpdf h4 {
               text-align: center;
           }

           .Search-item {
               margin-top: 10px;
               width: 100%;
           }

           .Search-grid {
               /*   margin-top: 10px;*/
               border: 1px solid;
               margin-left: 37px;
               margin-right: 37px;
           }

           .pdfTable {
               align-items: center;
               border-collapse: collapse;
               width: 100%;
           }

           .pdfTableth {
               background-color: floralwhite;
           }

           .in_details {
               text-align: right;
               margin-right: 50px;
           }

           #inbold td {
               border: 1px solid;
               padding: 2px;
               text-align: center;
           }

           .pdfTableth, .pdfTabletd {
               text-align: center;
               padding: 2px;
               border: 1px solid;
           }

           .Client_container {
               text-align: left;
               display: flex;
               justify-content: space-between;
               margin-left: 50px;
           }

           .containerpdf {
               padding: 3em;
               max-width: 1000px auto;
               margin: 0;
               box-sizing: border-box;
               font-family: sans-serif;
           }

           .lghd {
               width: 100%;
               text-align: center;
               display: flex;
               flex-direction: column;
           }
       </style>
    <link href="StyleSheet.css" rel="stylesheet" />
      <script>


          $(document).ready(function () {

              $(".Masking").mask("99/99/9999");
              FillDropDown(1, 'CboClientSearch', null, null, null, null, null, 0, 'SPR_dropdowns');
              FillDropDown(1, null, null, 'CboServiceSearch', null, null, null, 0, 'SPR_dropdowns');

          });


          function SearchData() {
              $("._grid").show();
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
                      'FromDate': FromDate,
                      'ToDate': ToDate,
                  }
                  , 'SPR_Payments');
          }

          function FillGrid(response) {
              var xmlDoc = $.parseXML(response.d);
              var xml = $(xmlDoc);
              var table = xml.find("Table");
              var Tbl = $('#Search-grid').DataTable();
              Tbl.clear();
              var count = 0;
              var Total_Debit = 0;
              var Total_Credit = 0;
              var amount = 0;

              if (table.length > 0) {
                  table.each(function () {
                      count += 1;


                      if ($(this).find("Credit").text() > 0) {
                          amount = amount + parseFloat($(this).find("Credit").text());
                          Total_Credit = Total_Credit + parseFloat($(this).find("Credit").text());

                      }
                      else {
                          amount = amount - parseFloat($(this).find("Debit").text());
                          Total_Debit = Total_Debit + parseFloat($(this).find("Debit").text());
                      }

                      printhtml = "PrintData(5,'PayID'," + $(this).find("PayID").text() + ",'SPR_Payments')";
                      edithtml = "FillData(1,'PayID'," + $(this).find("PayID").text() + ",'SPR_Payments')";
                      delhtml = "DeleteRow(3,'PayID'," + $(this).find("PayID").text() + ",'SPR_Payments')";


                      Tbl.row.add([
                          count,

                          $(this).find("PaymentDate").text(),
                          $(this).find("Client").text(),
                          $(this).find("AServices").text(),
                          $(this).find("Debit").text(),
                          $(this).find("Credit").text(),
                          amount,


                          '<a href="#" id="btnPrint" onclick=' + printhtml + '><img src="ICON/view.png" /></a>&ensp;|&ensp;' +
                          '<a href="#" id="btnEdit" onclick=' + edithtml + '><img src="ICON/edit.png" /></a>&ensp;|&ensp;' +
                          '<a href="#" id="btnDelete" onclick=' + delhtml + '><img src="ICON/delete.png"/></a>'
                      ]);
                      Tbl.draw(false);
                  });

                  Tbl.row.add([
                      '<div style="display:none">10000000</div>', '', '', 'Total',
                      Total_Debit,
                      Total_Credit,
                      
                      amount
                  ]);
                  Tbl.draw(false);
              }
              else {
                  Tbl.draw(false);
              }
              SetModelDisplay("largemodal", 'hide');
              cleartextbox();

          }

          function printData() {
              var FromDate = '';
              var ToDate = '';
              if ($("#FDsearch").val().length > 0) {
                  FromDate = ([$("#FDsearch").val().split("/")[1], $("#FDsearch").val().split("/")[0], $("#FDsearch").val().split("/")[2]]).join("/");
              }
              if ($("#TDsearch").val().length > 0) {
                  ToDate = ([$("#TDsearch").val().split("/")[1], $("#TDsearch").val().split("/")[0], $("#TDsearch").val().split("/")[2]]).join("/");
              }
              executewithFillDataandprint(
                  {
                      'OpCode': 6,
                      'FK_ClientID': $('#CboClientSearch option:selected').val(),
                      'FK_ServiceID': $('#CboServiceSearch option:selected').val(),
                      'FromDate': FromDate,
                      'ToDate': ToDate,
                  }
                  , 'SPR_Payments');
          }
          function revenuesummary(responses) {
              var FDsearch = '';
              var TDsearch = '';

              if ($("#FDsearch").val().trim() == "") {
                  FDsearch = "";
              } else {
                  FDsearch = $("#FDsearch").val();
              }
              if ($("#TDsearch").val().trim() == "") {
                  TDsearch = "";
              } else {
                  TDsearch = $("#TDsearch").val();
              }

              _html = "<div class='containerpdf'style='padding: 3em'max - width: 1000px; auto;margin: 0;box - sizing: border - box; font - family:arial;'>"
                  + "  <div class='lghd' style='flex-direction:column; text-align:center;'>"
                  + " <div style='margin-bottom=100px' class='logo'>"

                  + " <img widt='50px' height='50px'   src='Images/PDFLogo.JPEG'/>"
                  + "  </div>"
                  + "<div class='Abc'>"
                  + "<h4  style='text-align:center' > Client Payment History</h4>"
                  + "   <a>" + FDsearch + "</a>To<a>" + TDsearch + "</a>"
                  + "<div class='Client_container' style='display:flex; text-align:left;justify-content:space-between;margin-left:40px;'>"
                  + "<tr>"
                  + " <td>Client :</td>"
                  + " <td>" + $('#CboClientSearch option:selected').text() + "</td>"
                  + "<div class='in_details' style='margin-right:33px';>"

                  + "  <tr>"
                  + " <td>Service :</td>"
                  + " <td>" + $('#CboServiceSearch option:selected').text() + "</td>"

                  + "</tr>"
                  + " <tr>"
                  + "</table>"
                  + " </div>"
                  + "</div>"
                  + "<div class='Search-grid' style='margin - left: 37px;margin - right: 37px';>"
                  + "<table class='pdfTable style='  align-items: center; border - collapse: collapse'; style='width:100%; text-align:center;'>"
                  + "<thead>"
                  + "<tr class='pdfTabletr'>"
                  + "<th class='pdfTableth'>SR.NO#</th>"
                  + "<th class='pdfTableth'>Date</th>"
                  + "<th class='pdfTableth'>Client</th>"
                  + "<th class='pdfTableth'>Service</th>"
                  + "<th class='pdfTableth'>Paid</th>"
                  + "<th class='pdfTableth'>Due</th>"
                  + "<th class='pdfTableth'>Balance</th>"
                  + "</tr>"

                  + "</thead>"
                  + "<tbody>"
              var xmlDoc = $.parseXML(responses.d);
              var xml = $(xmlDoc);
              var table = xml.find("Table");
              var Tbl = $('#searchGrid').DataTable();
              Tbl.clear();
              var count = 0;
              var Total_Debit = 0;
              var Total_Credit = 0;
              var amount = 0;

              var TableRow = $(this);
              if (table.length > 0) {
                  table.each(function () {
                      count += 1;
                      if ($(this).find("Credit").text() > 0) {
                          amount = amount + parseFloat($(this).find("Credit").text());
                          Total_Credit = Total_Credit + parseFloat($(this).find("Credit").text());

                      }
                      else {
                          amount = amount - parseFloat($(this).find("Debit").text());
                          Total_Debit = Total_Debit + parseFloat($(this).find("Debit").text());
                      }
                      Tbl.row.add([
                          count,
                          _html = _html + "<tr class='pdfTabletr'>"
                          + " <td class='pdfTabletd'>" + count + "</td>"
                          + "<td class='pdfTabletd'>" + $(this).find("PaymentDate").text() + "</td>"
                          + "<td class='pdfTabletd'>" + $(this).find("Client").text() + "</td>"
                          + "<td class='pdfTabletd'>" + $(this).find("AServices").text() + "</td>"
                          + " <td class='pdfTabletd'>" + $(this).find("Debit").text() + "</td>"
                          + "<td class='pdfTabletd'>" + $(this).find("Credit").text() + "</td>"
                          + " <td class='pdfTabletd'>" + amount + "</td>"
                          + " </tr >"
                      ]);
                      Tbl.draw(false);
                  });
              } else {
                  Tbl.draw(false);
              }
              _html = _html + "<tr id='inbold'>"
                  + " <td  colspan='4' style='text-align:right' margin-left:60px' cellspacing='0';>Total</td>"
                  + "<td>" + Total_Debit + "</td>"
                  + "<td>" + Total_Credit + "</td>"
                  + "<td>" + amount + "</td>"
                  + " </tr> </table> </div>"
                  + "  <br/>"
                  + " </div>"
                  + "</tbody>"
                  + "</table>"
                  + "</div>"
                  + "</div>";
              generatePDF(_html, 'portrait')
          }
          function generatePDF(_html, orientation) {
              // Choose the element that our invoice is rendered in.
              const element = document.getElementById('invoice');
              element.innerHTML = _html;

              // Choose the element and save the PDF for our user.
              var opt = {
                  margin: 0,
                  filename: 'Summary.pdf',
                  image: { type: 'jpeg', quality: 0.98 },
                  html2canvas: { scale: 2 },
                  jsPDF: { unit: 'in', format: 'letter', orientation: orientation }
              };
              html2pdf().set(opt).from(element).save();
          }


      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  <div class="row">
        <div class="col-12">
            <div class="card">
                
                <div class="card-body">
                    <div class="row">
                              
                                <div class="col-lg-2 col-md-2 col-sm-12" >
                                    <label class="txtwhite">Client</label>
                                    <select id="CboClientSearch" class="form-control Search">
                                    </select>
                                </div>
                                 <div class="col-lg-2 col-md-2 col-sm-12" >
                                    <label class="txtwhite">Service</label>
                                    <select id="CboServiceSearch" class="form-control Search">
                                    </select>
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12"  ">
                                    <label class="txtwhite">From Date</label>
                                    <input id="FDsearch" type="text" autocomplete="off" class="form-control Masking TxtClr">
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12"  >
                                    <label class="txtwhite">To Date</label>
                                    <input id="TDsearch" type="text" autocomplete="off" class="form-control Masking TxtClr">
                                </div>
                       
                              
                                <div class="col-lg-1 col-md-1 col-sm-12" >
                                    <button type="button" id="Btnsearch" class="btn btn-primary" style="margin-top:10px;margin-bottom:10px" onclick=" SearchData();">Search</button>
                                     </div>
                         <div class="col-lg-1 col-md-1 col-sm-12"  >
                                 <button type="button" id="BtnPrint" class="btn btn-primary" style="margin-top:10px;margin-bottom:10px"onclick="printData();">Print Data</button>
                                </div>
                      </div>
                 <div class="modal fade show" id="largemodal1" tabindex="-1" role="dialog" aria-labelledby="largemodal" aria-hidden="true">
                        <div id="invoice" >

                        </div>
                            </div>

                          <div class="table-responsive _grid">
                        <table id="Search-grid" class="table table-bordered text-nowrap dataTable no-footer dtr-inline" data-page-length="1000" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    
                                    <th>SR.NO#</th>
                                      <th >Date</th>
                                        <th >Client</th>
                                    <th>Services</th>
                                
                                    <th>Paid</th>
                                    <th>Due</th>
                                   
                                    <th >Balance</th>
                                   
                                  
                                </tr>
                            </thead>
                         
                            <tbody>
                            </tbody>
                             
                        </table>


  
                    </div>
                        </div>
                </div>
            
                            </div>
                    </div>
             


                   
          
            
    
</asp:Content>

