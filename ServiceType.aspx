<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ServiceType.aspx.cs" Inherits="SType" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header" style="width:100%">
                    <div class="form-group" style="float: left; width: 70%">
                       <h4>Service Type</h4>
                    </div>
                    <div class="form-group" style="float: left; width: 30%">
                       <a class="btn btn-primary" data-target="#largemodal" data-toggle="modal" href="">ADD DATA</a>
                    </div>
                    
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="example3" class="table table-bordered text-nowrap dataTable no-footer dtr-inline" data-page-length="1000">
                            <thead>
                                <tr>
                                    <th>SR.NO#</th>
                                        <th>Service Type</th> 
                                        <th  class="action">Action</th>
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
                    <h2 class="modal-title" id="lbltitle">ADD/EDIT Service Types</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cleartextbox();">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                         <input type="hidden" id="hdnPrimaryFieldID" />
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <label class="txtwhite">Service Type:</label>
                            <input id="TxtSType" autocomplete="off" onkeyup="isalpha(this);" class="form-control clrtxt" type="text" />
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
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="js/ServiceType.js"></script>
</asp:Content>