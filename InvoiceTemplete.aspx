<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InvoiceTemplete.aspx.cs" Inherits="InvoiceTemplete" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
            $(document).ready(function () {
                FillDropDown(1, null, 'CboSType', null, null, null, null, 0, 'SPR_dropdowns');
                FillData(1, 'FK_isSTypeID', $('#CboSType option:selected').val(), 'SPR_Template');
            });
        function InsertData() {
            if (ValidateTextBox($("#txtTemplate"), 'Template cannot not be empty')) {
                var ParamVal = {};
                ParamVal['OpCode'] = 2;
                ParamVal['FK_isSTypeID'] = $("#CboSType").val();
                ParamVal['Templates'] = $("#txtTemplate").val();
                GetDataGrid(1, savingAlert, ParamVal, 'SPR_Template')
                 
            }
        }
        function savingAlert(responce) {

            alert('saved');
        }

        function SearchData() {
            FillData(1, 'FK_isSTypeID', $('#CboSType option:selected').val(), 'SPR_Template');
        }
                 

                function FillEditeGrid(response) {
                     
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var TableData = xml.find("Table");
                    var TableData = xml.find("Table1");
                    TableData.each(function () {
                        
                       
                        //document.getElementById("txtTemplate").innerText = $(this).find("Templates").text();
                          $("#txtTemplate").val($(this).find("Templates").text());  
                        //var editorElement = CKEDITOR.document.getById('txtTemplate');
                        ////editorElement.setHtml($(this).find("Templates").text());
                        //editorElement.replace($(this).find("Templates").text());
                       
 
                        
                        //innerHTML
                        //""
                        //innerText
                        //:
                        //""
                        //inputMode
                        //:
                        //""


                    })
                }
            
             
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
      <div class="row">
        <div class="col-12">
            <div class="card">
                 <div class="card-header" style="float: left">
                    <div class="form-group" style="float: left; width: 40%; margin-top: 30px; margin-bottom: 10px">
                        <h4>Template</h4>
                    </div>
                         
                       <div class="form-group"  style=" width: 60%">
                           
                         <select id="CboSType" class="form-control clrtxt Search" onchange="SearchData();"></select>
                             </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                                             
                        <div class="row">

                        
                
                   <div class="col-lg-12 col-md-12 col-sm-12">
                            
                            <label class="txtwhite">Template:</label>
                            
                       <input type="text" id="txtTemplate"   class="content" name="example"/>



                      <%-- <textarea id="txtTemplate"  class="content clrtxt" name="example"></textarea>--%>
                        </div> 

                     


                        <div class="col-lg-12 col-md-12 col-sm-12">
                        <button type="button" class="btn btn-primary" onclick="InsertData();">Save</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="cleartextbox();">Close</button>

                            </div>

                                        </div>
                                    
                                </div>
                            </div>
                        
         </div>
            </div>
          </div>
     
</asp:Content>

