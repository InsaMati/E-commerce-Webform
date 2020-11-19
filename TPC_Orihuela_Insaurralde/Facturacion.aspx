<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Facturacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <script src="Scripts/ScriptsValidaciones.js"></script>
    <h1>Facturacion</h1>
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
            <div class="col-md-4">
                <asp:Label Style="font-size: 15px; color: black; font-weight: 700" Text="Metodo De Pago" runat="server" />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 15px" ID="DDTipoPago" />
            </div>

            <div class="col-md-4">
            </div>
        </div>
    </div>
    <br />
    <br />
    <center>
    <asp:Button ID="BtnPagar" CssClass="btn btn-outline-success" style="font-size:15px" Text="Pagar" runat="server" OnClick="BtnPagar_Click" />&nbsp;
    <asp:Button ID="BtnCancelar" CssClass="btn btn-outline-danger"  style="font-size:15px" Text="Cancelar" runat="server" OnClick="BtnCancelar_Click" />
</center>

</asp:Content>
