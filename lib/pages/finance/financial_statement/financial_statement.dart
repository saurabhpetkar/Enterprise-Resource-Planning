import 'package:flutter/material.dart';
import '../../../scoped_models/main.dart';

class FinanceStatementPage extends StatefulWidget {
  final MainModel model;

  FinanceStatementPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return FinanceStatementPageState();
  }
}

class FinanceStatementPageState extends State<FinanceStatementPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6200EE),
          title: Text('Costing and Cost Planning'),
        ),
        body: Scrollbar(
          child: widget.model.isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView(
            children: <Widget>[
              Button('Material Costing'),
              Button('Production Costing'),
              Button('Project Costing'),

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
