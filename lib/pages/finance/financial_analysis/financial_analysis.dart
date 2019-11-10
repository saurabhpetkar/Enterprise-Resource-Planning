import 'package:flutter/material.dart';
import '../../../scoped_models/main.dart';

class FinancialAnalysisPage extends StatefulWidget {
  final MainModel model;

  FinancialAnalysisPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return FinancialAnalysisPageState();
  }
}

class FinancialAnalysisPageState extends State<FinancialAnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6200EE),
          title: Text('Financial Analysis'),
        ),
        body: Scrollbar(
          child: widget.model.isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView(
            children: <Widget>[
              Button('Balance Sheet (Horizontal & Vertical)'),
              Button('Profit and Loss (Horizontal & Vertical)'),
              Button('Trial Balance'),
              Button('Group Summary'),
              Button('Cash Flow'),
              Button('Fund Flow'),
              Button('Ratio Analysis'),
              Button('Outstanding Analysis and other reports'),

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
