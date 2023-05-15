<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
 
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>

    <!-- Meta data -->
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>

    <!-- Title -->
    <title>Services Management</title>


    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <link href="assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />



    <script type="text/javascript">



        function CheckfromAuth() {
            var TxtUserName = document.getElementById('TxtUserName');
            var txtpassword = document.getElementById('txtpassword');
            if (TxtUserName.value.length == 0) {
                alert('User Name cannot be blank.');
                TxtUserName.focus();
                return false;
            }
            else if (txtpassword.value.length == 0) {
                alert('Password cannot be blank.');
                txtpassword.focus();
                return false;
            }
            return true;
        }

    </script>
    <style>
        .bg-primary22 {
            background-color: #DBDAC4;
        }

        html {
            height: 100%;
        }

        body {
            margin: 0;
        }

        .bg {
            animation: slide 3s ease-in-out infinite alternate;
            background-image: linear-gradient(-60deg, #6c3 50%, #09f 50%);
            bottom: 0;
            left: -50%;
            opacity: .5;
            position: fixed;
            right: -50%;
            top: 0;
            z-index: -1;
        }

        .bg2 {
            animation-direction: alternate-reverse;
            animation-duration: 4s;
        }

        .bg3 {
            animation-duration: 5s;
        }


        @keyframes slide {
            0% {
                transform: translateX(-25%);
            }

            100% {
                transform: translateX(25%);
            }
        }
    </style>
</head>

<body class="h-100vh page-style1 light-mode">
    <div class="bg"></div>
    <div class="bg bg2"></div>
    <div class="bg bg3"></div>

    <form id="form1" runat="server">
        <div class="page">
            <div class="page-single">
                <div class="p-5" style="margin-top: 50px">
                    <div class="row">
                        <div class="col mx-auto">
                            <div class="row justify-content-center">
                                <div class="col-lg-9 col-xl-8">
                                    <div class="card-group mb-0">
                                        <div class="card p-4 page-content">
                                            <div class="card-body page-single-content">
                                                <div class="w-100">
                                                    <div class="">
                                                        <h1 class="mb-2">Services Management System</h1>
                                                        <hr />


                                                    </div>

                                                    <div class="input-group mb-3">
                                                        <span class="input-group-addon">
                                                            <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
                                                                <path d="M0 0h24v24H0V0z" fill="none" />
                                                                <path d="M12 16c-2.69 0-5.77 1.28-6 2h12c-.2-.71-3.3-2-6-2z" opacity=".3" />
                                                                <circle cx="12" cy="8" opacity=".3" r="2" />
                                                                <path d="M12 14c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4zm-6 4c.22-.72 3.31-2 6-2 2.7 0 5.8 1.29 6 2H6zm6-6c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0-6c1.1 0 2 .9 2 2s-.9 2-2 2-2-.9-2-2 .9-2 2-2z" />
                                                            </svg></span>
                                                        <asp:TextBox ID="TxtUserName" class="form-control" runat="server" autocomplete="off" aria-describedby="emailHelp" placeholder="Enter User Name" required="true"></asp:TextBox>
                                                    </div>
                                                    <div class="input-group mb-4">
                                                        <span class="input-group-addon">
                                                            <svg class="svg-icon" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
                                                                <g fill="none">
                                                                    <path d="M0 0h24v24H0V0z" />
                                                                    <path d="M0 0h24v24H0V0z" opacity=".87" />
                                                                </g><path d="M6 20h12V10H6v10zm6-7c1.1 0 2 .9 2 2s-.9 2-2 2-2-.9-2-2 .9-2 2-2z" opacity=".3" /><path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zM9 6c0-1.66 1.34-3 3-3s3 1.34 3 3v2H9V6zm9 14H6V10h12v10zm-6-3c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2z" /></svg></span>
                                                        <asp:TextBox class="form-control" ID="txtpassword" runat="server" TextMode="Password" autocomplete="off" placeholder="Enter Password" required="true"></asp:TextBox>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <%--<button type="button" class="btn btn-lg btn-primary btn-block"><i class="fe fe-arrow-right"></i> Login</button>--%>
                                                            <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-block" runat="server" Text="Login" OnClick="btnSubmit_Click" OnClientClick="return CheckfromAuth();" />
                                                        </div>

                                                    </div>
                                                    <div id="DivError"   runat="server">
                                                        <asp:Label ID="lblError" runat="server"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card text-white bg-primary22 py-5 d-md-down-none page-content mt-0">
                                            <div class="card-body text-center justify-content-center page-single-content">
                                                <img src="assets/images/pattern/login.png" alt="img">
                                            </div>
                                          
                                            <ul class="bg-bubbles">
                                                <li></li>
                                                <li></li>
                                                <li></li>
                                                <li></li>
                                                <li></li>
                                                <li></li>
                                                <li></li>
                                                <li></li>
                                                <li></li>
                                                <li></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>
