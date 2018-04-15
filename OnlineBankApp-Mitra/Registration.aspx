<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Registration.aspx.vb" Inherits="OnlineBankApp_Mitra.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- this logic is to validate if password and confirm password conain same values--%>

    <br />
    <h1>Customer Registration page</h1>
    <fieldset>
        <div class="form-group">
            <label for="Firstname">FirstName</label>
            <asp:TextBox ID="InputFirstname" runat="server" type="text" class="form-control" required="true"></asp:TextBox>
            <asp:RegularExpressionValidator
                ID="RegularExpressionValidator2"
                ControlToValidate="InputFirstname"
                ValidationExpression="([A-Za-z])+"
                ErrorMessage="Invalid Firstname!"
                Display="Static"
                Text="Invalid First name!"
                ForeColor="Red"
                runat="server">
            </asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <label for="Lastname">LastName</label>
            <asp:TextBox ID="InputLastname" runat="server" type="text" class="form-control" required="true"></asp:TextBox>
            <asp:RegularExpressionValidator
                ID="RegularExpressionValidator3"
                ControlToValidate="InputLastname"
                ValidationExpression="([A-Za-z])+"
                ErrorMessage="Invalid Lastname!"
                Display="Static"
                Text="Invalid Lastname!"
                ForeColor="Red"
                runat="server">
            </asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <label for="Telephone">Telephone</label>
            <asp:TextBox ID="InputTel" runat="server" type="Tel" placeholer="123-456-789" class="form-control" required="true"></asp:TextBox>
            <asp:RegularExpressionValidator
                ID="TelRegValidator"
                ControlToValidate="InputTel"
                ValidationExpression="^\d{10}$"
                ErrorMessage="Number not valid"
                Display="Static"
                Text="Tel number is not valid!"
                ForeColor="Red"
                runat="server">
            </asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <label for="SecurityQuestion">SecurityQuestion</label>
            <asp:TextBox ID="InputQuestion" runat="server"
                type="text" Text="Which school did you go to?" ReadOnly="true" class="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="Answer">SecurityAnswer</label>
            <asp:TextBox ID="InputAnswer" runat="server"
                type="password" class="form-control" required="true"></asp:TextBox>

        </div>
        <div class="form-group">
            <label for="Username">Username</label>
            <asp:TextBox ID="InputUsername" runat="server"
                type="text" class="form-control" required="true" placeholder="eg:firstname.lastname"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="InputPassword">Password</label>
            <asp:TextBox ID="InputPassword" runat="server" type="password"
                class="form-control" placeholder="Password" minlength="5"
                CausesValidation="true"></asp:TextBox>
            <asp:RegularExpressionValidator
                ID="PwdRegExValidator"
                ControlToValidate="InputPassword"
                ValidationExpression="([A-Za-z0-9!@#%^&*()_+])+"
                ErrorMessage="Password Not Valid!"
                Display="Static"
                Text="Password Not Valid!"
                ForeColor="Red"
                runat="server">
            </asp:RegularExpressionValidator>

        </div>
        <div class="form-group">
            <label for="InputPwd">Confirm Password</label>
            <asp:TextBox ID="ConfirmPswd" runat="server" type="password" class="form-control"
                placeholder="Password" CausesValidation="true"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1"
                runat="server"
                ControlToValidate="ConfirmPswd"
                ControlToCompare="InputPassword"
                Type="String"
                Display="Static"
                Text="Passwords do not match!"
                ForeColor="red"
                ErrorMessage="Passwords do not match!">

            </asp:CompareValidator>

            <div class="form-check">
                <label class="form-check-label">
                    <!--<input class="form-check-input" type="checkbox" value=""> -->
                    <span><asp:CheckBox ID="chkBox" runat="server" />
                    <asp:Label AssociatedControlID="chkBox" runat="server">I here by agree that all the information given is correct</asp:Label>
                         </span>
                    <asp:CustomValidator ID="CustomValidator1" runat="server"
                        ErrorMessage="Please confirm whether entered info is correct!"
                        ForeColor="Red"
                        OnServerValidate="CustomValidator1_ServerValidate">
                    </asp:CustomValidator>
                       
                </label>
                <br />
            </div>

        </div>
        <br />
        <asp:Button ID="RegisterButton" runat="server" Text="Register"
            type="submit" Class="btn btn-primary" />
         <!-- ERROR/MESSAGE LABEL-->
        <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
            <asp:Label ID="lblMessage" runat="server">
            </asp:Label>
            <asp:HyperLink href="Default.aspx" runat="server" class="btn btn-link">Sign In back</asp:HyperLink>
        </div>
        <br />
    </fieldset>
</asp:Content>
