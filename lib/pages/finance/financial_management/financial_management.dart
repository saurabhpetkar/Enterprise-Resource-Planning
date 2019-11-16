import 'package:flutter/material.dart';
import '../../../scoped_models/main.dart';

class FinanceManagePage extends StatefulWidget {
  final MainModel model;

  FinanceManagePage(this.model);

  @override
  State<StatefulWidget> createState() {
    return FinanceManagePageState();
  }
}

class FinanceManagePageState extends State<FinanceManagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6200EE),
          title: Text('Cash and Bank Accounting'),
        ),
        body: Scrollbar(
          child: widget.model.isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView(
            children: <Widget>[
              Button('Payment Plan', ''),
              Button('Cheque Printing', ''),
              Button('Bank Journal', ''),
              Button('Auto Payment Posting', ''),
              Button('Bank Guaranty', ''),
              Button('Bank Reconciliation', ''),
              Button('Cash Reconciliation', ''),

            ],
          ),
        ),
      ),
    );
  }

  Widget Button(String title, String nav){
    return Padding(
      padding: const EdgeInsets.only(top:8.0, right: 8, left: 8),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: RaisedButton(
          onPressed: () {
            print(nav);

          },
          child: Text(title, style: TextStyle(color: Colors.white),),
          color: Color(0xFF03DAC6),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
