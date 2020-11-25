<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="MetodoDePago.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MetodoDePago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">

            <div class="col-md-12">                
            <center>
                <h1>METODO DE PAGO</h1>
                <br />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 20px" ID="DDTipoPago" />
                <br />
                <br />
                <asp:button text="Volver" ID="btnVolver" CssClass="btn btn-outline-danger"  style="font-size:15px" runat="server" OnClick="btnVolver_Click" />&nbsp;
                <asp:button text="Siguiente" ID="btnSiguiente" CssClass="btn btn-outline-success"  style="font-size:15px" runat="server" OnClick="btnSiguiente_Click" />&nbsp;
            </center>

            </div>
        </div>
    </div>



</asp:Content>
