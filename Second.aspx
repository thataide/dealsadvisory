<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Second.aspx.cs" Inherits="AnalyticsRDP.Second" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        function hover(x) {
            $(x).css("background-color", "grey");
        }

        function out(x) {
            $(x).css("background-color", "navy");
        }
    </script>

</head>
<body style="color: white; font-family:Arial">
    <form id="form1" runat="server">
        <table style="width: 1280px; height: 720px; background-color: navy">
            <tr>
                <td style="width: 2.5%; height: 100%">
                </td>
                <td style="width: 65%; height: 100%">
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 15%">
                            <td style="font-size: 40px">
                                <asp:DataList ID="dtlSector" runat="server" DataSourceID="dtsSector">
                                    <ItemTemplate>
                                        <asp:Label ID="SectorNameLabel" runat="server" Text='<%# Eval("SectorName") %>' />
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="dtsSector" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [SectorName] FROM [Sector] WHERE ([SectorId] = @SectorId)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="SectorId" QueryStringField="SectorId" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr style="height: 85%; vertical-align:top">
                            <td>
                                <table>
                                    <tr>
                                        <td style="font-size: 28px">
                                            <strong>Tiles</strong>
                                        </td>
                                     </tr>
                                    <tr>
                                        <td>
                                            <asp:DataList ID="dtlCategory" runat="server" DataKeyField="CategoryId" DataSourceID="dtsCategory" RepeatColumns="5">
                                                <ItemTemplate>
                                                    <asp:Label ID="CategoryIdLabel" runat="server" Text='<%# Eval("CategoryId") %>' Visible="false"/>
                                                    <asp:LinkButton ID="CategoryNameLinkButton" runat="server" Text='<%# Eval("CategoryName") %>' PostBackUrl='<%# "Second.aspx?SectorId=" + Eval("SectorId") + "&CategoryId=" + Eval("CategoryId") %>' BorderWidth="1px" BorderStyle="Solid" ForeColor="White" Height="40px" Width="160px" Font-Underline="false" style="text-align:center" onmouseover="hover(this)" onmouseout="out(this)"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <asp:SqlDataSource ID="dtsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT *, SectorId=@SectorId FROM [Category] WHERE [CategoryId] IN
                                                    (SELECT CategoryId FROM CategoryToObject
                                                     WHERE ObjectId = @SectorId)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="SectorId" QueryStringField="SectorId" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="overflow-y: auto; max-height:450px">

                                            

                                            <asp:DataList ID="dtlTile" runat="server" DataKeyField="TileId" DataSourceID="dtsTile" RepeatColumns="4">
                                                <ItemTemplate>
                                                    <table style="border:solid; border-width:1px; width:202px; height:125px" onmouseover="hover(this)" onmouseout="out(this)">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="TileIdLabel" runat="server" Text='<%# Eval("TileId") %>' Visible="false"/>
                                                                <asp:LinkButton ID="lkbTileName" runat="server" Text='<%# Eval("TileName") %>' PostBackUrl='<%# "Second.aspx?SectorId=" + Eval("SectorId") + "&CategoryId=" + Eval("CategoryId") + "&TileId=" + Eval("TileId") %>' ForeColor="White" Font-Underline="false" style="text-align:center"></asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:LinkButton ID="lkbTileDescription" runat="server" Text='<%# Eval("TileDescription") %>' PostBackUrl='<%# "Second.aspx?SectorId=" + Eval("SectorId") + "&CategoryId=" + Eval("CategoryId") + "&TileId=" + Eval("TileId") %>' ForeColor="White" Font-Underline="false" Font-Size="12px" style="text-align:center"></asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                            <asp:SqlDataSource ID="dtsTile" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT Tile.*, CategoryId=@CategoryId, SectorId=@SectorId FROM Tile
WHERE TileId IN
( SELECT TileId FROM TileToCategory
 WHERE CategoryId = @CategoryId)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="CategoryId" QueryStringField="CategoryId" />
                                                    <asp:QueryStringParameter Name="SectorId" QueryStringField="SectorId" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                            </div>
                                        </td>
                                    </tr>
                                </table>
                           </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 2.5%; height: 100%">
                </td>
                <td style="width: 30%; height: 100%">
                    <table style="width: 100%; height: 100%; vertical-align:top;">
                        <tr style="height: 20%">
                            <td>

                            </td>
                        </tr>
                        <tr style="height: 60%">
                            <td>
                                <table style="border-left:solid; border-width: 1px; width:100%"> 
                                    <tr>
                                        <td style="width:5%">
                                        </td>
                                        <td style="width:95%; vertical-align:top; font-size: 28px"">
                                           <strong>Contact team</strong>
                                           <br />
                                            <asp:DataList ID="dtlContact" runat="server" DataKeyField="ContactId" DataSourceID="dtsContact">
                                                <ItemTemplate>
                                                    <!- FORCED WIDTH BECAUSE DATALIST PREVENTS INHERITANCE FROM OUTER TABLE ->
                                                    <table style="width:360px">
                                                                <tr>
                                                                    <td style="width:25%">
                                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageURL") %>' BorderColor="White" BorderStyle="Solid" BorderWidth="1px" Height="80px" Width="80px" />
                                                                    </td>
                                                                    <td style="font-size:16px; width:75%">
                                                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("DisplayName") %>' /><br />
                                                                        <span style="font-size:12px">
                                                                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /><br />
                                                                            <asp:HyperLink ID="EmailHyperLink" runat="server" ForeColor="White" Text='<%# Eval("EmailAddress") %>' NavigateUrl='<%# "mailto:" + Eval("EmailAddress") %>'></asp:HyperLink><br />
                                                                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                                <asp:SqlDataSource ID="dtsContact" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [Contact] WHERE ([ObjectId] = @ObjectId)">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter Name="ObjectId" QueryStringField="SectorId" Type="Int32" />
                                                    </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr style="height: 20%; vertical-align: top">
                            <td style="font-size: 28px">
                                <table style="border-left:solid; border-width: 1px; width:100%"> 
                                    <tr>
                                        <td style="width:5%">
                                        </td>
                                        <td style="width:95%">
                                           <strong>Resources</strong>
                                           <br />
                                           <span style="font-size: 16px">
                                                Training
                                                <br />
                                                Credentials
                                               <br />
                                               Videos
                                           </span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
