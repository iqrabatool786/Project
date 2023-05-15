<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Default2" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="app-content page-body">
        <div class="container">
            <div class="row">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <label class="txtwhite">Client</label>
                                <select id="CboClientSearch" onkeyup="IS_aLPHA(this);" class="form-control Search">
                                </select>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <label class="txtwhite">Service</label>
                                <select id="CboServiceSearch" onkeyup="IS_aLPHA(this);" class="form-control Search">
                                </select>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <label class="txtwhite">From Date</label>
                                <input id="FDsearch" type="text" autocomplete="off" class="form-control Masking TxtClr">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <label class="txtwhite">To Date</label>
                                <input id="TDsearch" type="text" autocomplete="off" class="form-control Masking TxtClr">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2">
                                <label class="txtwhite">Pay Status</label>
                                <select id="CboPStatus" class="form-control">
                                    <option value="0">--All--</option>
                                    <option value="1">Paid</option>
                                    <option value="2">Due</option>
                                </select>
                            </div>
                            <div class="col-lg-1 col-md-1 col-sm-1">
                                <button type="button" id="Btnsearch" class="btn btn-primary" style="margin-top: 10px; margin-bottom: 10px" onclick=" SearchData();">Search</button>
                            </div>

                            <div class="col-lg-1 col-md-1 col-sm-1 ">
                                <button type="button" id="Btnadd" class="btn btn-primary" style="margin-top: 10px; margin-bottom: 10px" data-target="#largemodal" data-toggle="modal">Add Data</button>
                            </div>
                            <div class="table-responsive">
                                <table id="example3" class="table table-bordered text-nowrap dataTable no-footer dtr-inline" data-page-length="1000" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>SR.NO#</th>
                                            <th>Client</th>
                                            <th>Services</th>
                                            <th>Narration</th>
                                            <th>Payment Method</th>
                                            <th>Payment Date</th>
                                            <th>Amount</th>
                                            <th>Action</th>
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
    <div class="modal fade" id="largemodal" tabindex="-1" role="dialog" aria-labelledby="largemodal" aria-hidden="true">
        <div class="modal-dialog modal-md " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="lbltitle">ADD/EDIT Payment</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cleartextbox();">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" id="hdnPrimaryFieldID" />
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <label class="txtwhite">Client:</label>
                            <select id="cboClient" class="form-control">
                            </select>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <label class="txtwhite">Narration:</label>
                            <input id="TxtNarration" type="text" onkeyup="IS_aLPHA(this);" class="form-control clrtxt" />
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <label class="txtwhite">Services:</label>
                            <select id="cboService" onkeyup="IS_aLPHA(this);" class="form-control">
                            </select>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12" style="margin-top: 10px" onchange="paiddue();">
                            <label class="txtwhite">PayType:</label>
                            <input type="Radio" id="TxtDue" name="PayType" checked="checked" />
                            <span>Due</span>
                            <input type="Radio" id="TxtPaid" name="PayType" />
                            <span>Paid</span>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 hs1">
                            <label class="txtwhite">Payment Method:</label>
                            <select id="cboPayMethod" class="form-control " onchange="showHide()">
                                <option value='1'>Cash</option>
                                <option value='2'>Cheque</option>
                                <option value='3' selected="selected">Online Transfer</option>
                            </select>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 hs1">
                            <label class="txtwhite">Payment Date</label>
                            <input id="paymentDate" type="text" class="form-control Masking">
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <label class="txtwhite">Amount:</label>
                            <input id="TxtAmount" type="text" onkeyup="isfloat(this);" class="form-control clrtxt" />
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 hs1 hp">
                            <label class="txtwhite">Cheque Number:</label>
                            <input id="ChequeNumber" type="text" class="form-control clrtxt" />
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 hs1 hp">
                            <label class="txtwhite">Cheque Date:</label>
                            <input id="ChequeDate" type="text" class="form-control Masking">
                        </div>

                        <div class="col-lg-6 col-md-6 col-sm-6 hs1 hp1">
                            <label class="txtwhite">TRX Number:</label>
                            <input id="TRXNumber" type="text" class="form-control clrtxt" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="InsertData();">Save</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="cleartextbox();">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/Payment.js"></script>
</asp:Content>