<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="DatosTarjeta.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.DatosTarjeta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1 style="text-align:center">Información de pago</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Text="Numero de la tarjeta" Style="font-size: 15px" runat="server" />
                <asp:TextBox ID="TxtNumTarjeta" OnKeyPress="return SoloNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" runat="server" Style="font-size: 15px" placeholder="**** **** **** **** **** **** **** **** ****" CssClass="form-control" />
            </div>

            <div class="col-md-4">
                <asp:Label Text="Fecha de Vencimiento" Style="font-size: 15px" runat="server" />
                <asp:TextBox ID="TxtFechaVenci" runat="server" Style="font-size: 15px" TextMode="Month" CssClass="form-control" />

            </div>

            <div class="col-md-4">
                <asp:Label Text="CVV" Style="font-size: 15px" runat="server" />
                <asp:TextBox ID="TxtCvv" runat="server" OnKeyPress="return SoloNumeros(event);" OnCopy="return false" OnPaste="return false" OnCut="return false" Style="font-size: 15px" Width="50px" CssClass="form-control" />
            </div>
        </div>

    </div>
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <asp:Label Text="Cuotas" Style="font-size: 15px" runat="server" />
                <asp:DropDownList Style="font-size: 15px" ID="DDCuotas" CssClass="form-control" runat="server">
                    <asp:ListItem Text="1" />
                    <asp:ListItem Text="2" />
                    <asp:ListItem Text="4" />
                    <asp:ListItem Text="6" />
                    <asp:ListItem Text="8" />
                    <asp:ListItem Text="12" />
                </asp:DropDownList>
            </div>
        </div>
    </div>

    <hr />

    <p></p>

    <center>
     <asp:button text="Continuar" ID="BtnContinuar" CssClass="btn btn-outline-success"  style="font-size:15px" runat="server" OnClick="BtnContinuar_Click"/>
    </center>
    <hr />
</asp:Content>
