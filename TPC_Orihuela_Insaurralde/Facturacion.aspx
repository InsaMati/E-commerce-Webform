<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.Facturacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Facturacion</h1>
    <hr />

    <div class="container">
        <div class="row">
            <div class="col-md-4">

                <asp:Label Style="font-size: 15px; color:black;font-weight:700" Text="Metodo De Pago" runat="server" />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 15px" ID="DDTipoPago" />
            </div>
            <div class="col-md-4"></div>
            <div class="col-md-4"></div>
        </div>

    </div>


</asp:Content>
