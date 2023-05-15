<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Service.aspx.cs" Inherits="Default2" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header" style="float: left; width: 100%">
                    <div class="form-group" style="float: left; width: 65%; margin-top: 30px; margin-bottom: 10px">
                        <h4>Service</h4>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3" style="width: 20%">
                    </div>
                    <div class="col-lg-1 col-md-1 col-sm-12" style="width: 10%">
                        <button type="button" id="Btnadd" class="btn btn-primary" style="margin-top: 30px; margin-bottom: 10px" data-target="#largemodal" data-toggle="modal">Add Data</button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="example3" class="table table-bordered text-nowrap dataTable no-footer dtr-inline" data-page-length="1000" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>SR.NO#</th>
                                    <th>Services</th>
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
    <div class="modal fade" id="largemodal" tabindex="-1" role="dialog" aria-labelledby="largemodal" aria-hidden="true">
        <div class="modal-dialog modal-md " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="lbltitle">ADD/EDIT Services</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cleartextbox();">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <input type="hidden" id="hdnPrimaryFieldID" />
                            <label class="txtwhite">Service:</label>
                            <input id="TxtService" type="text" onkeyup="isalpha(this);" class="form-control clrtxt" />
                        </div>
                        
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <label class="txtwhite">Status:</label>
                            <select id="cboStatus" class="form-control ">
                                <option value='1' selected="selected">Active</option>
                                <option value='0'>In-Active</option>
                            </select>
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
    <script src="js/Service.js"></script>
  </asp:Content>