import 'package:flutter/material.dart';
import '../../../scoped_models/main.dart';

class FinanceGPPage extends StatefulWidget {
  final MainModel model;

  FinanceGPPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return FinanceGPPageState();
  }
}

class FinanceGPPageState extends State<FinanceGPPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6200EE),
          title: Text('Expense Management'),
        ),
        body: Scrollbar(
          child: widget.model.isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView(
            children: <Widget>[
              Button('Expense Category wise budgeting'),
              Button(' Role and User Wise Budgeting'),
              Button('Expense Approval Work Flow'),
              Button('Enforcing restrictions on expense limits and receipt'),
              Button('Show out of policy violations prior to submission'),
              Button('Approve / Forward / Reject Expenses'),
              Button('Receipt Management'),
              Button('Email and SMS notifications'),
            ],
          ),
        ),
      ),
    );
  }

  Widget Button(String title){
    return Padding(
      padding: const EdgeInsets.only(top:8.0, right: 8, left: 8),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: RaisedButton(
          onPressed: () {

          },
          child: Text(title, style: TextStyle(color: Colors.white),),
          color: Color(0xFF03DAC6),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
