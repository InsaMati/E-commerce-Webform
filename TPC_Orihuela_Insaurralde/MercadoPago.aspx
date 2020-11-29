<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="MercadoPago.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MercadoPago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 style="text-align: center">Mercado Pago</h1>
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-success" style="font-size: 40px" role="alert">
                      <h1 class="alert-heading">Felicidades !!</h1>                    
                    <hr />
                      <p style="font-size: 20px">Ha realizado la compra exitosamente. Le enviamos un mail con el link de pago, a la direccion de correo con la que se registro.</p>                      
                </div>
            </div>
        </div>

    </div>
    <center>
        <asp:button text="Terminar" ID="txtTerminar" runat="server" CssClass="btn btn-outline-success" OnClick="txtTerminar_Click" />
    </center>


</asp:Content>
