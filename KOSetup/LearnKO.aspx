<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LearnKO.aspx.cs" Inherits="KOSetup.LearnKO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Learning Knockout.js</title>
    <script src="Scripts/jquery-2.0.3.min.js"></script>
    <script src="Scripts/knockout-3.0.0.js"></script>
    <script src="Scripts/LearnKO.js"></script>
    <link href="Styles/Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <span style="align-content:center;margin-bottom:30px;font-size:xx-large;font-weight:bolder;text-decoration:underline;display:block;">Learning Knockout.js with Asp.net Web Forms</span>
        <div style="width:25%;float:left;min-width:300px;margin-right:10px;display:inline-block;" >
            <h2>Add Student</h2>
        <table style="width:100%;" >
            <tbody>
                <tr>
                    <th style="width:100px;">Property Name</th>
                    <th style="width:100px;">Enter Value</th>
                    <th style="width:100px;">Example of two Way Binding</th>
                </tr>
                </tbody>
            <tr>
                <td>Student ID (int):</td>
                <td>
                    <input data-bind="value: StudentId" /></td> <!--,valueUpdate:'keypress'-->
                <td><span data-bind="text: StudentId" /></td>
            </tr>
            <tr>
                <td>First Name :</td>
                <td>
                    <input data-bind="value: FirstName" /></td>
                <td  ><span data-bind="text: FirstName" /></td>
            </tr>
            <tr>
                <td>Last Name :</td>
                <td>
                    <input data-bind="value: LastName" /></td>
                <td><span data-bind="text: LastName" /></td>
            </tr>
            
            <tr>
                <td>Student Age (int) :</td>
                <td>
                    <input data-bind="value: Age" /></td>
                <td><span data-bind="text: Age" /></td>
            </tr>
            <tr>
                <td>Gender :</td>
                <td>
                    <select data-bind="options: Genders, value: Gender, optionsCaption: 'Select Gender...'"></select></td>
                <td><span data-bind="text: Gender" /></td>
            </tr>
            <tr>
                <td>Batch :</td>
                <td>
                    <input data-bind="value: Batch" /></td>
                <td><span data-bind="text: Batch" /></td>
            </tr>
            <tr>
                <td>Address :</td>
                <td>
                    <input data-bind="value: Address" /></td>
                <td><span data-bind="text: Address" /></td>
            </tr>
            <tr>
                <td>Class :</td>
                <td>
                    <input data-bind="value: Class" /></td>
                <td><span data-bind="text: Class" /></td>
            </tr>
            <tr>
                <td>School :</td>
                <td>
                    <input data-bind="value: School" /></td>
                <td><span data-bind="text: School" /></td>
            </tr>
            <tr>
                <td>Domicile :</td>
                <td>
                    <select data-bind="options: Domiciles, value: Domicile, optionsCaption: 'Select Domicile...'"></select>
                </td>
                <td><span data-bind="text: Domicile" /></td>
            </tr>
            <tr>
                <td colspan="3">
                    <button type="button" data-bind="click: AddStudent">Add Student</button>
                    <button type="button" data-bind="click: SaveStudent">Save Student To Database</button>
                </td>
            </tr>

        </table>
            </div>

         <div style="width:70%;float:left;display:inline-block;">
             <h2>List of Students</h2>
        <table style="width:100%;" data-bind="visible: Students().length > 0" border="0">
            <tr>
                <th>Student Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Batch</th>
                <th>Address</th>
                <th>Class</th>
                <th>School</th>
                <th>Domicile</th>
            </tr>
            <tbody data-bind="foreach: Students">
                <tr>
                    <td><span data-bind="text: StudentId" /></td>
                    <td>
                        <input data-bind="value: FirstName" /></td>
                    <td>
                        <input data-bind="value: LastName" /></td>
                    <td>
                        <input data-bind="value: Age" /></td>
                   
                    <td>
                        <select data-bind="options: $root.Genders, value: Gender"></select></td>
                    <td>
                        <input data-bind="value: Batch" /></td>
                    <td>
                        <input data-bind="value: Address" /></td>
                    <td>
                        <input data-bind="value: Class" /></td>
                    <td>
                        <input data-bind="value: School" /></td>
                    <td>
                        <select data-bind="options: $root.Domiciles, value: Domicile"></select></td>

                    <td><a href="#" data-bind="click: $root.DeleteStudent">Delete</a></td>
                </tr>
            </tbody>
        </table>
               </div>
    </form>
</body>
</html>
