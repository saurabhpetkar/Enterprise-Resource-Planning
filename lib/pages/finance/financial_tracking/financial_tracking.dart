import 'package:flutter/material.dart';
import '../../../scoped_models/main.dart';

class FinanceTrackPage extends StatefulWidget {
  final MainModel model;

  FinanceTrackPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return FinanceTrackPageState();
  }
}

class FinanceTrackPageState extends State<FinanceTrackPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6200EE),
          title: Text('Accounts and Administration'),
        ),
        body: Scrollbar(
          child: widget.model.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: <Widget>[
                    Button('Group and unit level consolidation', ''),
                    Button('Multiple finance books', ''),
                    Button('Multiple tax books and tax rules', ''),
                    Button('Fixed asset and depreciation book', ''),
                    Button('Operative and reporting chart of accounts', ''),
                    Button('Configuration for auto accounting voucher generation', ''),
                    Button('Financial Periods', ''),
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
