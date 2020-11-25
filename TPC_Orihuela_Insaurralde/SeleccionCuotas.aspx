<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="SeleccionCuotas.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.SeleccionCuotas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container">
        <div class="row">

            <div class="col-md-12">
                <h1>CANTIDAD DE CUOTAS</h1>
                <div class="list-group">
                      <a href = "SeleccionCuotas?ID=1" class="list-group-item list-group-item-action">1 Cuota</a>
                      <a href = "SeleccionCuotas?ID=2" class="list-group-item list-group-item-action">3 Cuotas</a>
                      <a href = "SeleccionCuotas?ID=3" class="list-group-item list-group-item-action">6 Cuotas</a>
                      <a href = "SeleccionCuotas?ID=4" class="list-group-item list-group-item-action">12 Cuotas</a>
                </div>
            <center>
                <asp:button text="Volver" ID="btnVolver" CssClass="btn btn-outline-danger"  style="font-size:15px" runat="server" OnClick="btnVolver_Click"/>
            </center>
                <br />
                <br />

            </div>
        </div>
    </div>
</asp:Content>
