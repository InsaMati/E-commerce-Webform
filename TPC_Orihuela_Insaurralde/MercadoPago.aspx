<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="MercadoPago.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MercadoPago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 style="text-align: center">Mercado Pago</h1>
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-success" style="font-size: 35px" role="alert">
                    <h1 class="alert-heading">Felicidades !!</h1>
                    <hr />
                    <p style="font-size: 20px">Ha realizado la compra exitosamente. Le enviamos un mail con el link de pago, a la direccion de correo con la que se registro.</p>
                </div>
            </div>
        </div>

    </div>
    <div class="col-md-12" style="text-align: center">
        <asp:Button Text="Inicio" Style="font-size: 15px" ID="BtnConfirmar" runat="server" CssClass="btn btn-outline-success" OnClick="BtnConfirmar_Click"  />
        <asp:Button Text="Volver" Style="font-size: 15px" ID="BtnVolver" runat="server" CssClass="btn btn-outline-danger" OnClick="BtnVolver_Click"  />

    </div>

</asp:Content>
