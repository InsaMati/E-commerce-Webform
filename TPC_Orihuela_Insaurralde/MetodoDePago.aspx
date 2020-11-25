<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="MetodoDePago.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MetodoDePago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">

            <div class="col-md-12">
                <h1>METODO DE PAGO</h1>
                <div class="list-group">
                      <a href = "MetodoDePago?ID=1" class="list-group-item list-group-item-action">Efectivo </a>
                      <a href = "MetodoDePago?ID=2" class="list-group-item list-group-item-action">Tarjeta Credito/debito</a>
                      <a href = "MetodoDePago?ID=3" class="list-group-item list-group-item-action">Transferencia</a>
                      <a href = "MetodoDePago?ID=4" class="list-group-item list-group-item-action">Paypal</a>
                      <a href = "MetodoDePago?ID=5" class="list-group-item list-group-item-action disabled">MercadoPago</a>
                </div>
            <center>
                <asp:button text="Volver" ID="btnVolver" CssClass="btn btn-outline-danger"  style="font-size:15px" runat="server" OnClick="btnVolver_Click" />
            </center>
                <%--<br />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 20px" ID="DDTipoPago" />
                <asp:button text="Siguiente" ID="btnSiguiente" CssClass="btn btn-outline-success"  style="font-size:15px" runat="server" OnClick="btnSiguiente_Click" />&nbsp;
                --%>
                <br />
                <br />

            </div>
        </div>
    </div>



</asp:Content>
