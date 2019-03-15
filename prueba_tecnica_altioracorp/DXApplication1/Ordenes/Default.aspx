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
                    <dx:BootstrapGridView ID="GridViewClientes" runat="server" KeyFieldName="IdCliente">
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
            <div class="col-lg-12">
                <h3>Gestionar artículos</h3>
                <p>
                    <dx:BootstrapGridView ID="GridViewArticulos" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource" KeyFieldName="IdArticulo">
                        <SettingsDataSecurity AllowEdit="True" AllowInsert="True" AllowDelete="True"></SettingsDataSecurity>
                        <Columns>
                            <dx:BootstrapGridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowNewButtonInHeader="True" ShowDeleteButton="True"></dx:BootstrapGridViewCommandColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="IdArticulo" ReadOnly="True" VisibleIndex="1" Visible="false">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="Codigo" VisibleIndex="2" Caption="C&#243;digo"></dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="Nombre" VisibleIndex="3"></dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="PrecioUnitario" VisibleIndex="4" Caption="Precio unitario"></dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="CreadoPor" VisibleIndex="5" Caption="Creado por">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewDateColumn FieldName="FechaCreacion" VisibleIndex="6" Caption="Fecha creaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewDateColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="EstacionCreacion" VisibleIndex="7" Caption="Estaci&#243;n creaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="ModificadoPor" VisibleIndex="8" Caption="Modificado por">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                            <dx:BootstrapGridViewDateColumn FieldName="UltimaModificacion" VisibleIndex="9" Caption="&#218;ltima modificaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewDateColumn>
                            <dx:BootstrapGridViewTextColumn FieldName="EstacionModificacion" VisibleIndex="10" Caption="Estaci&#243;n modificaci&#243;n">
                                <SettingsEditForm Visible="False"></SettingsEditForm>
                            </dx:BootstrapGridViewTextColumn>
                        </Columns>
                    </dx:BootstrapGridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT tArticulos.* FROM tArticulos" InsertCommand="sp_InsertarArticulos" InsertCommandType="StoredProcedure" UpdateCommand="sp_ActualizarArticulos" UpdateCommandType="StoredProcedure" DeleteCommand="sp_EliminarArticulos" DeleteCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="IdArticulo" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Codigo" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Nombre" Type="String"></asp:Parameter>
                            <asp:Parameter Name="PrecioUnitario" Type="Decimal"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="IdArticulo" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Codigo" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Nombre" Type="String"></asp:Parameter>
                            <asp:Parameter Name="PrecioUnitario" Type="Decimal"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </p>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-lg-12">
                <h3>Gestionar órdenes</h3>
                <p>
                    <dx:BootstrapGridView ID="GridViewOrdenes" runat="server"></dx:BootstrapGridView>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
