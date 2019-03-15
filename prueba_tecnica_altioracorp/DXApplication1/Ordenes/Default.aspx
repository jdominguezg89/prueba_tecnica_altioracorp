<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="Default.aspx.cs" Inherits="Ordenes._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript">
        function onFocusedRowChanged(s, e) {
            $("#focusedRowLabel").html("Focused row index: " + s.GetFocusedRowIndex());
        }
    </script>
    <div class="jumbotron">
        <div class="container">
            <h1>Ejercicio de Desarrollo de Software - Clientes, Ódenes, Artículos.</h1>
            <p>
                <dx:BootstrapHyperLink ID="link_ejercicio_practico" runat="server" NavigateUrl="~/Documents/EjercicioPractico.pdf" Text="Descargar EjercicioPractico.pdf" Target="_blank"></dx:BootstrapHyperLink>
            </p>
        </div>
    </div>

    <div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-lg-4">
                <h3>Datos del cliente</h3>
                <p>
                    <dx:BootstrapTextBox ID="txbNombres" runat="server" NullText="Ingrese los nombres del cliente"></dx:BootstrapTextBox>
                </p>
                <p>
                    <dx:BootstrapTextBox ID="txbApellidos" runat="server" NullText="Ingrese los apellidos del cliente"></dx:BootstrapTextBox>
                </p>
                <div class="row float-lg-right">
                    <div class="col-lg-4">
                        <dx:BootstrapButton ID="btnInsertar" runat="server" Text="Insertar" AutoPostBack="false">
                            <SettingsBootstrap RenderOption="Primary" Sizing="Small" />
                        </dx:BootstrapButton>
                    </div>
                    <div class="col-lg-4">
                        <dx:BootstrapButton ID="btnModificar" runat="server" Text="Modificar" AutoPostBack="false">
                            <SettingsBootstrap RenderOption="Default" Sizing="Small" />
                        </dx:BootstrapButton>
                    </div>
                    <div class="col-lg-4">
                        <dx:BootstrapButton ID="btnEliminar" runat="server" Text="Eliminar" AutoPostBack="false">
                            <SettingsBootstrap RenderOption="Danger" Sizing="Small" />
                        </dx:BootstrapButton>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <h3>Clientes almacenados</h3>
                <p>
                    <dx:BootstrapGridView runat="server"  KeyFieldName="IdCliente">
                        <SettingsBehavior AllowFocusedRow="true" />
                        <ClientSideEvents FocusedRowChanged="onFocusedRowChanged" />
                        <Columns>
                            <dx:BootstrapGridViewDataColumn FieldName="Nombres" />
                            <dx:BootstrapGridViewDataColumn FieldName="Apellidos" />
                        </Columns>
                    </dx:BootstrapGridView>
                </p>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-lg-4">
                <h2>Visually Consistent</h2>
                <p>Focus on business and stop wasting cycles on design. Leave it to Bootstrap's myriad of available visual themes to guarantee consistent look and feel throughout your web application - from early prototype to production. </p>
                <p>
                    <dx:BootstrapButton ID="Button4" runat="server" Text="View details &raquo;" AutoPostBack="false">
                    </dx:BootstrapButton>
                </p>
            </div>
            <div class="col-lg-4">
                <h2>An Extensive Control Suite</h2>
                <p>The DevExpress Bootstrap Control Suite includes a GridView with powerful data analysis and display features, Data Editors with automatic layout management, Navigation Controls, and fast and lightweight Chart controls. </p>
                <p>
                    <dx:BootstrapButton ID="Button5" runat="server" Text="View details &raquo;" AutoPostBack="false">
                    </dx:BootstrapButton>
                </p>
            </div>
            <div class="col-lg-4">
                <h2>Powered by ASP.NET Controls</h2>
                <p>New render comes with familiar feature set. Expect the same level of server-side and client-side API as in DevExpress ASP.NET WebForms Controls. And yes, we made sure that transition to the new suite is a breeze. </p>
                <p>
                    <dx:BootstrapButton ID="Button6" runat="server" Text="View details &raquo;" AutoPostBack="false">
                    </dx:BootstrapButton>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
