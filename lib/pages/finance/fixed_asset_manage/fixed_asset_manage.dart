import 'package:flutter/material.dart';
import '../../../scoped_models/main.dart';

class FixedAssetManagePage extends StatefulWidget {
  final MainModel model;

  FixedAssetManagePage(this.model);

  @override
  State<StatefulWidget> createState() {
    return FixedAssetManagePageState();
  }
}

class FixedAssetManagePageState extends State<FixedAssetManagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6200EE),
          title: Text('Fixed Assets Managements'),
        ),
        body: Scrollbar(
          child: widget.model.isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
              : ListView(
            children: <Widget>[
              Button('Asset Opening'),
              Button('Asset Capitalization'),
              Button('Asset Tag Bifurcation'),
              Button('Depreciation'),
              Button('Addition of Assets'),
              Button('Sales of Assets'),

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
