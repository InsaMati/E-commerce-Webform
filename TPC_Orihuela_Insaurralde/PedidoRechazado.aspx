<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.Master" AutoEventWireup="true" CodeBehind="PedidoRechazado.aspx.cs" Inherits="TPC_Orihuela_Insaurralde.PedidoRechazado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Rechazo de pedido</h1>
    <br />
    <br />
    <div class="container">

        <div class="col-md-12">
            <center>
                <div class="form-group">
                    <label Style="font-size: 20px; color: black; font-weight: 700" for="exampleFormControlTextarea1">Motivo de rechazo</label>
                    <br />
                    <textarea Style="font-size: 20px" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    <br />
                    <button Style="font-size: 20px" type="submit" class="btn btn-primary mb-2">Enviar</button>
                </div>
            </center>
            <label Style="font-size: 15px; color: black" for="exampleFormControlTextarea1">Cliente: <% =Cliente %></label>
            
        </div>
    </div>


</asp:Content>