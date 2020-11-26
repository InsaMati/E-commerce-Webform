<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="DatosBancarios.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.DatosBancarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <script src="Scripts/ScriptsValidaciones.js"></script>
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1>DATOS BANCARIOS</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <asp:Label Style="font-size: 15px; color: black; font-weight: 700" Text="Banco" runat="server" />
                <asp:TextBox CssClass="form-control" Style="font-size: 15px" ID="TxtBanco" runat="server" />
            </div>
            <div class="col-md-4">
                <asp:Label Style="font-size: 15px; color: black; font-weight: 700" Text="Cuil" runat="server" />
                <asp:TextBox CssClass="form-control" Style="font-size: 15px" ID="TxtCuil" OnKeyPress="return SoloNumeros(event);" runat="server" />
            </div>
            <div class="col-md-4">
                <asp:Label Style="font-size: 15px; color: black; font-weight: 700" Text="CBU" runat="server" />
                <asp:TextBox CssClass="form-control" Style="font-size: 15px" ID="TxtCbu" OnKeyPress="return SoloNumeros(event);" runat="server" />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4">
                <asp:Label Style="font-size: 15px; color: black; font-weight: 700" Text="Alias" runat="server" />
                <asp:TextBox CssClass="form-control" Style="font-size: 15px" ID="TxtAlias" runat="server" />
            </div>
        </div>
    </div>

    <br />
    <br />

    <center>
    <asp:Button ID="BtnPagar" CssClass="btn btn-outline-success" style="font-size:15px" Text="Pagar" runat="server" OnClick="BtnPagar_Click" />&nbsp;
    <asp:Button ID="BtnVolver" CssClass="btn btn-outline-danger"  style="font-size:15px" Text="Volver" runat="server" OnClick="BtnVolver_Click"/>
    </center>

</asp:Content>