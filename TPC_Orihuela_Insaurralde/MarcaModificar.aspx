<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="MarcaModificar.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.MarcaModificar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 style="font-size:20px">Modificacion de Marca</h1>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <br />
                <asp:TextBox ID="txtMarca" CssClass="form-control" style="font-size:13.5px" runat="server" ReadOnly="True" />
            </div>
            <div class="col-md-4">
                <br />
                <asp:TextBox ID="txtModificar" CssClass="form-control" placeholder="Ingresar nueva marca" style="font-size:13.5px" runat="server" />
            </div>
            <div class="col-md-12" style="text-align:center">
                <br />
                <asp:Button ID="btnModificar" Text="Modificar" style="font-size:15px" class="btn btn-outline-success" runat="server" OnClick="btnModificar_Click" />
                 <asp:Button ID="btnVolver" Text="Volver" style="font-size:15px" class="btn btn-outline-danger" runat="server" OnClick="btnVolver_Click" />
            </div>
        </div>
    </div>
    <hr />

</asp:Content>
