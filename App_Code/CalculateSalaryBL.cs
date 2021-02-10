using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace salaryCalculator.App_Code
{
    public class CalculateSalaryBL
    {
        public int incomeTaxPercentage(int incomeTax, String gender, int dependents)
        {
            int itr = incomeTax;
            if (gender == "F")
            {
                itr = incomeTax - 2;
            }
            if (dependents == 3)
            {
                itr = incomeTax - 2;
            }
            else if (dependents == 4)
            {
                itr = incomeTax - 4;
            }
            return itr;
        }
        public double additions(double bonus, double allowance)
        {
            double salAdditions = bonus + allowance;
            return salAdditions;
        }
        public double netPay(double grossPay, double additions, int incomeTax, int cpp, int empIns)
        {
            double netPay = 0.0;
            double totalDeductions = Convert.ToDouble((grossPay * incomeTax) / 100) +
                                     Convert.ToDouble((grossPay * empIns) / 100) +
                                     Convert.ToDouble((grossPay * cpp) / 100);
            netPay = grossPay - totalDeductions + additions;
            return netPay;
        }
    }
}