<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="salaryCalculator.aspx.cs" Inherits="salaryCalculator.salaryCalculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<style>
.formStyle{
background-color: #C9A5A0;
}
/*#salaryResult{
display:none;
}*/
</style>
</head>
<body>
<div class="container">
	<div class="row display-block" id ="getDetails" runat="server">
		<div class="col-md-12 formStyle">
			<h1 class="text-center">Salary Calculator</h1>
				<form id="form1" runat = "server">
					<div class="jumbotron">
						<div class="form-row">
							<div class="col-md-6">
								<label for="empName">Employee Name: </label>
								<asp:TextBox runat="server" CssClass="form-control" id="txtEmpName" placeholder="Enter Employee Name" ValidateRequestMode="Enabled"/>
								<%--<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>--%>					
							</div>
							<div class="col-md-6">
								<label for="grossPay">Gross Pay: </label>
								<asp:TextBox runat="server" CssClass="form-control" id="txtGrossPay" placeholder="Enter Gross Pay" ValidateRequestMode="Enabled"/>
								<%--<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>		--%>						
							</div>
						</div>
						<br/>
						<div class="form-row">
							<div class="col-md-6">
								<label for="gender">Gender: </label>
								<div class="radio">
									<label><asp:RadioButton runat="server" ID="rdoFemale" name="rdoGender" ValidateRequestMode="Enabled"/> Female</label>
								</div>
								<div class="radio">
									<label><asp:RadioButton runat="server" ID="rdoMale" name="rdoGender" ValidateRequestMode="Enabled"/> Male</label>
								</div>								
							</div>				
							<div class="col-md-6">
								<label for="dependents">Dependents: </label>
								<div class="radio">
									<label><asp:RadioButton runat="server" ID="rdoDependentTwo" name="rdoDependent" ValidateRequestMode="Enabled"/> 2</label>
								</div>
								<div class="radio">
									<label><asp:RadioButton runat="server" ID="rdoDependentThree" name="rdoDependent" ValidateRequestMode="Enabled"/> 3</label>
								</div>
								<div class="radio">
									<label><asp:RadioButton runat="server" ID="rdoDependentFour" name="rdoDependent" ValidateRequestMode="Enabled"/> 4</label>
								</div>								
							</div>
						</div>
					</div>					
					<h1 class="text-center">Additions in $</h1>
					<div class="jumbotron">						
						<div class="form-row">
							<div class="col-md-6">
								<label for="bonus">Bonus $: </label>
								<asp:TextBox runat="server" CssClass="form-control" id="txtBonus" placeholder="Enter your Bonus $" ValidateRequestMode="Enabled"/>
								<%--<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>	--%>							
							</div>							
							<div class="col-md-6">
								<label for="allowance">Allowance $: </label>
								<asp:TextBox runat="server" CssClass="form-control" id="txtAllowance" placeholder="Enter your Allowance $" ValidateRequestMode="Enabled"/>	
								<%--<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>		--%>						
							</div>
						</div>
					</div>
					<h1 class="text-center">Deductions in %</h1>
					<div class="jumbotron">						
						<div class="form-row">
							<div class="col-md-6">
								<label for="incomeTax">Income Tax %: </label>
								<asp:TextBox runat="server" CssClass="form-control" id="txtIncomeTax" placeholder="Enter your Income Tax %" ValidateRequestMode="Enabled"/>	
								<%--<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>	--%>							
							</div>
							<div class="col-md-6">
								<label for="empInsurance">Employee Insurance %: </label>
								<asp:TextBox runat="server" CssClass="form-control" id="txtEmpInsurance" placeholder="Enter your EI %" ValidateRequestMode="Enabled"/>	
								<%--<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>		--%>						
							</div>
							<div class="col-md-6">
								<label for="empCPP">CPP %: </label>
								<asp:TextBox runat="server" CssClass="form-control" id="txtEmpCPP" placeholder="Enter your CPP %" ValidateRequestMode="Enabled"/>	
								<%--<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>	--%>							
							</div>
						</div>
					</div>					
					<asp:Button runat="server" CssClass="btn btn-secondary btn-lg btn-block" ID="btnCalculateSalary" onclick="btnCalculateSalary_Click" Text="Calculate Salary"></asp:Button>
				</form>
		</div>
	</div>
	<div class="row" id="salaryResult" runat="server">
		<div class="col-md-12">
			<h1>Your salary slip</h1>
			<table class="table table-striped">			  
			  <tbody>
				<tr>
				  <th>Name</th>
				  <td><span runat="server" id="tdName"></span></td>				  
				</tr>
				<tr>
				  <th>Gross Pay</th>
				  <td><span runat="server" id="tdGrossPay"></span></td>
				</tr>
				<tr>
				  <th>Gender</th>
				  <td><span runat="server" id="tdGender"></span></td>
				</tr>
				<tr>
				  <th>Dependents</th>
				  <td><span runat="server" id="tdDependents"></span></td>
				</tr>
				<tr>
				  <th>Bonus</th>
				  <td><span runat="server" id="tdBonus"></span></td>
				</tr>
				<tr>
				  <th>Allowance</th>
				  <td><span runat="server" id="tdAllowance"></span></td>
				</tr>
				<tr>
				  <th>Income Tax</th>
				  <td><span runat="server" id="tdIncomeTax"></span></td>
				</tr>
				<tr>
				  <th>Employee Insurance</th>
				  <td><span runat="server" id="tdEmpIns"></span></td>
				</tr>
				  <tr>
				  <th>Employee Insurance</th>
				  <td><span runat="server" id="tdEmpCPP"></span></td>
				</tr>
				<tr>
				  <th>Net pay</th>
				  <td><span runat="server" id="tdNetPay"></span></td>
				</tr>
			  </tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>
