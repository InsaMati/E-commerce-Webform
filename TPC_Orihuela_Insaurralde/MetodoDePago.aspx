<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="MetodoDePago.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MetodoDePago" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="Scripts/ScriptsValidaciones.js"></script>

    <h1>Metodos de Pago</h1>
    <hr />

    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="list-group" style="font-size: 12.5px">
                    <a href="MetodoDePago?ID=1" class="list-group-item list-group-item-action">MercadoPago</a>
                    <a href="MetodoDePago?ID=2" class="list-group-item list-group-item-action">Tarjeta Credito/debito</a>
                    <a href="MetodoDePago?ID=3" class="list-group-item list-group-item-action">Efectivo</a>
                    
                </div>
                <%--<br />
                <asp:DropDownList runat="server" CssClass="form-control" Style="font-size: 20px" ID="DDTipoPago" />
                <asp:button text="Siguiente" ID="btnSiguiente" CssClass="btn btn-outline-success"  style="font-size:15px" runat="server" OnClick="btnSiguiente_Click" />&nbsp;
                --%>
            </div>
        </div>
    </div>
    <br />
    <div class="col-md-12" style="text-align: center">
        <asp:Button Text="Volver" ID="btnVolver" CssClass="btn btn-outline-danger" Style="font-size: 15px" runat="server" OnClick="btnVolver_Click" />
    </div>
    <hr />
</asp:Content>
