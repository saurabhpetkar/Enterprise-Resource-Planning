import 'package:flutter/material.dart';
import '../../../scoped_models/main.dart';

class AccPayAccRecPage extends StatefulWidget {
  final MainModel model;

  AccPayAccRecPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return AccPayAccRecPageState();
  }
}

class AccPayAccRecPageState extends State<AccPayAccRecPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6200EE),
          title: Text('Account Payable and Account Receivable'),
        ),
        body: Scrollbar(
          child: widget.model.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: <Widget>[
                    Button('Supplier Advance'),
                    Button('Purchase Invoice'),
                    Button('Service Invoice'),
                    Button('Commission Invoice'),
                    Button('Freight Invoice'),
                    Button('Payment Request'),
                    Button('Sundry Payment'),
                    Button('Receipt Request'),
                    Button('Sundry Receipt'),
                    Button('• Item Based Debit Note'),
                    Button('Item Based Credit Note'),
                    Button('• Reference Reconciliation'),
                  ],
                ),
        ),
      ),
    );
  }

  Widget Button(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: RaisedButton(
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          color: Color(0xFF03DAC6),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
