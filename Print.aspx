<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Print.aspx.cs" Inherits="Print" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
<%--    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>PDF</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/MyJS.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
            integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>


    <style>
        * {
            font-family: arial;
        }

        .invoice_footer {
            padding: 10px 10px;
        }

        .customer_container {
            padding: 17px 10px;
        }

        #inbold {
            font-weight: bold;
        }

        .in_details {
            margin-left:40px;
            margin-top:-97px;
        }

        .invoice_header {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }


     

          

        #invoice1 {
            margin-bottom: 5px;
        }

        .customer_container {
            margin-left: 16px;
            text-align:right;
            margin-right:62px;
        }

            .customer_container p {
                width: 100%;
            }

        .item_table {
            width: 92%;
            margin-left: 30px;
            margin-bottom: 0px;
        }



        .company_address h2 {
            text-align: center;
        }

        .Abc {
            text-align:center;
            margin-top:-36px;
          
        }

        .item_table td, th {
            padding: 10px 30px;
        }
        #colour{
            background:red;
        }
    .containerpdf {
    padding: 3em;
    max-width: 1000px auto;
    margin: 0;
    box-sizing: border-box;
    font-family:sans-serif;
}
     .lghd {
    width: 100%;
    text-align: center;
    display: flex;
    flex-direction: column;
}

        tr:nth-child(even) {
            background-color:lightgray;
        }
           tr:nth-child(odd) {
            background-color:paleturquoise;
        }
    </style>
   
        <script src="js/Print.js"></script> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div class="modal fade show" id="largemodal1" tabindex="-1" role="dialog" aria-labelledby="largemodal" aria-hidden="true">
    <div id="invoice">
      
</div>
       </div>
        
</asp:Content>

