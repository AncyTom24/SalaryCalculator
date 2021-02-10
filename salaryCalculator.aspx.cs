using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using salaryCalculator;
using salaryCalculator.App_Code;

namespace salaryCalculator
{
    public partial class salaryCalculator : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            salaryResult.Visible = false;
            getDetails.Visible = true;
        }

        protected void btnCalculateSalary_Click(object sender, EventArgs e)
        {
            salaryCalculatorClass calculator = new salaryCalculatorClass();
            string name = txtEmpName.Text;
            string gender = "";
            if (rdoMale.Checked)
            {
                gender = "M";
            }
            else if (rdoFemale.Checked)
            {
                gender = "F";
            }
            int dependents = 0;
            if (rdoDependentTwo.Checked)
            {
                dependents = 2;
            }
            else if (rdoDependentThree.Checked)
            {
                dependents = 3;
            }
            else if (rdoDependentFour.Checked)
            {
                dependents = 4;
            }
            double grossPay = Convert.ToDouble(txtGrossPay.Text);
            double bonus = Convert.ToDouble(txtBonus.Text);
            double allowance = Convert.ToDouble(txtAllowance.Text);
            int incomeTax = Convert.ToInt32(txtIncomeTax.Text);
            int empInc = Convert.ToInt32(txtEmpInsurance.Text);
            int empCPP = Convert.ToInt32(txtEmpCPP.Text);
            int itPercentage = calculator.incomeTaxPercentage(incomeTax, gender, dependents);
            double additions = calculator.additions(bonus, allowance);
            double netPay = calculator.netPay(grossPay, additions, itPercentage, empCPP, empInc);

            tdName.InnerText = name;
            if(gender == "M")
            {
                tdGender.InnerText = "Male";
            }
            else if(gender == "F")
            {
                tdGender.InnerText = "Female";
            }
            tdDependents.InnerText = dependents.ToString();
            tdGrossPay.InnerText = grossPay.ToString();
            tdBonus.InnerText = "$" + bonus.ToString() + " CAD";
            tdAllowance.InnerText = "$" + allowance.ToString() + " CAD";
            tdIncomeTax.InnerText = incomeTax.ToString() + "%";
            tdEmpCPP.InnerText = empCPP.ToString() + "%";
            tdEmpIns.InnerText = empInc.ToString() + "%";
            tdNetPay.InnerText = "$" + netPay.ToString() + " CAD";

            salaryResult.Visible = true;
            getDetails.Visible = false;
        }
    }
}