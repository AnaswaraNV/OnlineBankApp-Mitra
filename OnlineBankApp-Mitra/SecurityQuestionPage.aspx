﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SecurityQuestionPage.aspx.vb" Inherits="OnlineBankApp_Mitra.SecurityQuestionPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <!-- LOGOUT -->
    <div class="logout-container">
        <span class="avatar-position">
            <asp:Image ID="Image2" ImageUrl="~/Resources/avatar.png" 
                class="image-container" runat="server" />  
                      </span>
        <asp:HyperLink ID="HyperLink1" href="Default.aspx"
            runat="server"> 
            <asp:Image ID="Image1" ImageUrl="~/Resources/logout.jpg" 
                class="image-container" runat="server" />  
        </asp:HyperLink>    
    </div>
    <script runat="server">

        Sub OnCancelButtonClick(ByVal sender As Object, ByVal e As EventArgs)
            ' When the Cancel button is clicked, redirect to sign in page.
            Server.Transfer("Default.aspx")
        End Sub

    </script>

    <h1>Security Questions</h1>
    <p>This computer or device is not registered in your profile. Please verify your identity by answering your personal security question. This computer or device is not registered in your profile. Please verify your identity by answering your personal security question. </p>
    <fieldset>
        <div class="form-group">
            <label>Question</label>
            <asp:TextBox ID="InputQuestion" runat="server" CssClass="form-control" Text="Which school did you go to?" ReadOnly="True" Width="236px"></asp:TextBox>
            <label>Answer</label>
            <asp:TextBox ID="InputAnswer" runat="server" type="password" CssClass="form-control" placeholder="Password" Width="235px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                ControlToValidate="InputAnswer" runat="server" 
                ForeColor="Red"
                ErrorMessage="Enter an answer"></asp:RequiredFieldValidator>
            <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
                <strong>
                    <asp:Label ID="lblMessage" runat="server" />
                </strong>
            </div>
        </div>

        <div class="row btn-container">
            <div class="col-1 cancel-btn">
                <asp:Button ID="CancelButton" runat="server" Text="Cancel" type="submit" CssClass="btn btn-primary float-left" />
            </div>
            <div class="col-1 continue-btn">
                <asp:Button ID="ContinueButton" runat="server" Text="Continue" type="submit" CssClass="btn btn-primary float-right" Width="84px" />
            </div>
        </div>
        <br />
        <br />
        <h3>Register This computer/Device in my profile</h3>
        <p>If this is a personal computer or device, select "Yes" to have it registered and you won't have to answer security questions when signing on to Mitra Home page</p>
        <div>
            <span>
                <input id="Radio1" type="radio" />
                <label><strong>Yes, this is a personal computer or device</strong></label>
            </span>
        </div>
        <div>
            <span>
                <input id="Radio2" type="radio" />
                <label><strong>No, this is a public device</strong></label>
                <br />
            </span>
        </div>
    </fieldset>
</asp:Content>
