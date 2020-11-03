<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMLMarca.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.ABMLMarca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col">
                <table class="table">
                    <tr class="bg-whitesmoke" style="color: orangered; font-size: 15px; font-style: italic">
                        <td>Codigo</td>
                        <td>Nombre</td>
                        <td>Eliminar</td>
                        <td>Modificar</td>
                    </tr>

                    <% if (Lista != null)
                        { %>
                    <%foreach (var Item in Lista)
                        {
                    %>

                    <tr>
                        <td style="font-size:12px"><% = Item.Id %></td>
                        <td style="font-size:12px"><% = Item.Nombre %></td>
                        <td><span style="font-size:15px;color:orangered" class="glyphicon glyphicon-remove"></span></td>
                        <td><span style="font-size:15px;color:orangered" class="glyphicon glyphicon-pencil"></span></td>                        
                    </tr>


                    <% } %>
                    <% } %>
                </table>
            </div>
        </div>
        <center>
        <asp:Button ID="BtnAgregar" class="btn btn-primary" Style="font-size:15px" Text="Agregar" runat="server" OnClick="BtnAgregar_Click" />
        <asp:Button ID="BtnVolver" class="btn btn-danger" Style="font-size:15px" Text="Volver" runat="server" OnClick="BtnVolver_Click" />
        </center>
    </div>

</asp:Content>
