// SPDX-License-Identifier: HAU
//Custodio, Archie D. WD - 401
pragma solidity ^0.8.0;

contract BankLoan {

    struct Loan {
        string clientName;
        uint loanAmount;
        uint interestRateInBPS; 
        uint annualInterest;    
        uint loanTermYears;     
        uint totalInterestAmount; 
        uint totalAmountDue;        
        uint monthlyRepayment;     
    }

    function CheckInterest(uint loanAmount) public pure returns (uint) {
        if (loanAmount >= 30000 && loanAmount <= 50000) {
            return 755; 
        } else if (loanAmount >= 50001 && loanAmount <= 70000) {
            return 875; 
        } else if (loanAmount >= 70001 && loanAmount <= 88000) {
            return 1123; 
        } else if (loanAmount >= 88001) {
            return 1375; 
        } else {
            revert("Invalid input of amount");
        }
    }

    
    function CheckDetails(string memory clientName, uint loanAmount, uint loanTermYears) public pure returns (Loan memory) {
        uint interestRateInBPS = CheckInterest(loanAmount); 
        uint annualInterest = (loanAmount * interestRateInBPS) / 10000; 
        uint totalInterestAmount = annualInterest * loanTermYears; 
        uint totalAmountDue = loanAmount + totalInterestAmount; 
        uint monthlyRepayment = totalAmountDue / (loanTermYears * 12); 

        Loan memory loan = Loan({
            clientName: clientName,
            loanAmount: loanAmount,
            loanTermYears: loanTermYears,
            annualInterest: annualInterest,
            interestRateInBPS: interestRateInBPS / 100, 
            totalInterestAmount: totalInterestAmount,
            totalAmountDue: totalAmountDue,
            monthlyRepayment: monthlyRepayment
        });

        return loan;
    }
}
