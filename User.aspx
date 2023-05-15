<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="Default2" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-12">
            <div class="card">

                <div class="card-header" style="float: left; width: 100%">
                    <div class="form-group" style="float: left; width: 60%; margin-top: 30px; margin-bottom: 10px">
                        <h4>User</h4>
                    </div>
                        <div class="col-lg-3 col-md-3 col-sm-3" style=" width: 40%">
                            <label class="txtwhite">Roles</label>
                            <select id="cboRoles" class="form-control Search" onchange="jsFunction();">
                            </select>
                        </div>
                        <div class="col-lg-1 col-md-1 col-sm-12" style=" width: 10%">
                            <button type="button" id="Btnadd" class="btn btn-primary" style="margin-top: 30px; margin-bottom: 10px" data-target="#largemodal" data-toggle="modal">Add Data</button>
                        </div>
                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <table id="example3" class="table table-bordered text-nowrap dataTable no-footer dtr-inline" data-page-length="1000" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>SR.NO#</th>
                                    <th>UserName </th>
                                    <th>Password </th>
                                    <th>FullName </th>
                                    <th>Role </th>
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
                    <h2 class="modal-title" id="lbltitle">ADD/EDIT User</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cleartextbox();">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" id="hdnPrimaryFieldID" />
                        <div class="col-lg-6 col-md-6 col-sm-6">

                            <label class="txtwhite">UserName:</label>
                            <input id="TxtUserName" type="text"onkeyup="isalpha(this);"  class="form-control clrtxt" />
                        </div>

                        <div class="col-lg-6 col-md-6 col-sm-6">

                            <label class="txtwhite">Password:</label>
                            <input id="TxtPassword" type="text" class="form-control clrtxt" />
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12">

                            <label class="txtwhite">FullName:</label>
                            <input id="TxtFullName" onkeyup="isalpha(this);" type="text" class="form-control clrtxt" />
                        </div>
                         <div class="col-lg-6 col-md-6 col-sm-6">
                            <label class="txtwhite">Cell No:</label>
                            <input id="TxtCellNo" type="text" onkeyup="isint(this);" placeholder="03000000000" class="form-control clrtxt" />
                        </div>
                          <div class="col-lg-12 col-md-12 col-sm-12">
                            <label class="txtwhite">Address:</label>
                            <input id="TxtAddress" type="text"   class="form-control clrtxt" maxlength="250"/>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <label class="txtwhite">EMail:</label>
                            <input id="TxtMail" type="email" class="form-control clrtxt" />
                        </div>

                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <label class="txtwhite">Status:</label>
                            <select id="cboStatus" class="form-control ">
                                <option value='1' selected="selected">Active</option>
                                <option value='0'>In-Active</option>
                            </select>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">

                            <label class="txtwhite">Role:</label>
                            <select id="cboRole" class="form-control ">
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
   <script src="js/User.js"></script>
</asp:Content>