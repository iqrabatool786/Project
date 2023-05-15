<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClientServices.aspx.cs" Inherits="ClientServices" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="app-content page-body">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="card">

                        <div class="card-header" style="float: left;  margin-top: 10px; margin-bottom: 10px; width: 100%">
                            <div class="form-group" style="width: 40%">
                                <h4>Client Services</h4>
                            </div>
                            <div class="row" style="width: 50%">
                            <div class="col-lg-4 col-md-4 col-sm-4" >
                                <label class="txtwhite">Client</label>
                                <select id="CboClientSearch" class="form-control Search">
                                </select>
                                </div>
                             <div class="col-lg-4 col-md-4 col-sm-4" >
                                <label class="txtwhite">Service</label>
                                <select id="CboServiceSearch" class="form-control Search">
                                </select>
                             </div>
                             <div class="col-lg-1 col-md-1 col-sm-12" >
                                <button type="button" id="Btnsearch" class="btn btn-primary" style="margin-top: 30px; margin-bottom: 10px" onclick=" SearchData();">Search</button>
                            </div>
                                </div>
                            <div class="col-lg-1 col-md-1 col-sm-12" style="width: 10%">
                                <button type="button" id="Btnadd" class="btn btn-primary" style="margin-top: 30px; margin-bottom: 10px" data-target="#largemodal" data-toggle="modal">Add Data</button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">

                                    <div class="col-sm-12">
                                        <table id="example3" class="table table-bordered text-nowrap dataTable no-footer dtr-inline" data-page-length="1000" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>SR.NO#</th>
                                                    <th>Client</th>
                                                    <th>Services</th>
                                                    <th>type of service</th>
                                                    <th>Charges(RS)</th>
                                                    <th class="action">Action</th>
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
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="largemodal" tabindex="-1" role="dialog" aria-labelledby="largemodal" aria-hidden="true">
        <div class="modal-dialog modal-md " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="largemodal1">ADD/EDIT Client Services</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cleartextbox();">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" id="hdnPrimaryFieldID" />
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <label class="txtwhite">Client:</label>
                            <select id="CboClient" required="required" onkeyup="IS_aLPHA(this);"class="form-control">
                            </select>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <label class="txtwhite">Services:</label>
                            <select id="CboServices" required="required" onkeyup="IS_aLPHA(this);"class="form-control">
                            </select>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <label class="txtwhite">Service Type:</label>
                            <select id="CboSType" required="required"onkeyup="IS_aLPHA(this);" class="form-control">
                            </select>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <label class="txtwhite">Charges(RS):</label>
                            <input id="TxtCharges" required="required" type="text" onkeyup="isfloat(this);" class="form-control clrtxt" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="InsertData();">Save</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="cleartextbox();">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/ClientServices.js"></script>
</asp:Content>

