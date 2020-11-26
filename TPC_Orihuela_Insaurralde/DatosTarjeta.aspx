<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="DatosTarjeta.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.DatosTarjeta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Información de pago</h1>
    <hr />

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Text="Numero de la tarjeta" Style="font-size: 15px" runat="server" />
                <asp:TextBox Txt="TxtNumTarjeta" OnKeyPress="return SoloNumeros(event);" runat="server" Style="font-size: 15px" placeholder="**** **** **** **** **** **** **** **** ****" CssClass="form-control" />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Fecha de Vencimiento" Style="font-size: 15px" runat="server" />
                <asp:TextBox ID="TxtFechaVenci" runat="server" Style="font-size: 15px" TextMode="Month" CssClass="form-control" />

            </div>

            <div class="col-md-4">
                <asp:Label Text="CVV" Style="font-size: 15px" runat="server" />
                <asp:TextBox ID="TxtCvv" runat="server" OnKeyPress="return SoloNumeros(event);" Style="font-size: 15px" Width="50px" CssClass="form-control" />
            </div>
        </div>

    </div>

    <hr />

    <p></p>

    <center>
     <asp:button text="Continuar" ID="BtnContinuar" CssClass="btn btn-outline-success"  style="font-size:15px" runat="server"/>
    </center>
    <hr />
</asp:Content>
