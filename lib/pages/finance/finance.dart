import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'account_admin/account_admin.dart';
import 'cash_bank_accounting/cash_bank_accounting.dart';
import 'costing_cost_planning/costing_cost_planning.dart';
import 'expense_management/expense_management.dart';
import 'acc_pay_acc_rec/acc_pay_acc_rec.dart';
import 'statutory_compliance/statutory_compliance.dart';
import 'financial_analysis/financial_analysis.dart';
import 'fixed_asset_manage/fixed_asset_manage.dart';

class FinancePage extends StatefulWidget {
  final MainModel model;

  FinancePage(this.model);

  @override
  State<StatefulWidget> createState() {
    return FinancePageState();
  }
}

class FinancePageState extends State<FinancePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          title: Text('Finance'),
          backgroundColor: Color(0xFF6200EE),
        ),
        body: Scrollbar(
          child: widget.model.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: <Widget>[
                    Button("Account Administration"),
                    Button("Cash & Bank Accounting"),
                    Button('Costing and Cost Planning'),
                    Button('Expense Management'),
                    Button('Account Payable and Account Receivable'),
                    Button('Statutory Compliances'),
                    Button('Financial Analysis'),
                    Button("Fixed Asset Management"),
                  ],
                ),
        ),
      ),
    );
  }

  Widget Button(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
        onPressed: () {
          if (title == "Account Administration")
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AccountAdministrationPage(widget.model)),
            );
          else if (title == "Cash & Bank Accounting")
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CashBankAccPage(widget.model)),
            );
          else if (title == "Costing and Cost Planning")
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CostingCostPlanPage(widget.model)),
            );
          else if (title == "Expense Management")
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExpenseManagePage(widget.model)),
            );
          else if (title == "Account Payable and Account Receivable")
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AccPayAccRecPage(widget.model)),
            );
          else if (title == "Fixed Asset Management")
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FixedAssetManagePage(widget.model)),
            );
          else if (title == "Statutory Compliances")
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      StatutoryCompliancePage(widget.model)),
            );
          else
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FinancialAnalysisPage(widget.model)),
            );
        },
        padding: const EdgeInsets.all(0.0),
        child: Container(
          
          width: double.infinity,
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              gradient: new LinearGradient(
                colors: [
                  Color(0xFF03DAC6),
                  Color(0xFF018786),

                ],
              )),
          padding: const EdgeInsets.all(13.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
