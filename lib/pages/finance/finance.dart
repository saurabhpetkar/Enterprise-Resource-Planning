import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'financial_tracking/financial_tracking.dart';
import 'financial_management/financial_management.dart';
import 'financial_statement/financial_statement.dart';
import 'financial_growth_proj/financial_growth_proj.dart';

class FinancePage extends StatefulWidget {
  final MainModel model;

  FinancePage(this.model);

  @override
  State<StatefulWidget> createState() {
    return FinancePageState();
  }
}

class FinancePageState extends State<FinancePage>
    with SingleTickerProviderStateMixin {



  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Color(0xFFEC407A);
    Color text_color = Colors.white;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Finance'),
          backgroundColor: Colors.lightBlueAccent,
        ),

        body: Container(
          color: Colors.white,
          child: Scrollbar(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                    EdgeInsets.only(top: 10, left: 10, bottom: 5, right: 5),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FinanceManagePage(widget.model),
                          ),
                        );
                      },
                      elevation: 10,
                      color: color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Financial Tracking',
                        style: TextStyle(fontWeight: FontWeight.w700, color: text_color),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(top: 10, left: 10, bottom: 5, right: 5),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FinanceManagePage(widget.model)),
                        );
                      },
                      elevation: 10,
                      color: color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Financial Management',
                        style: TextStyle(fontWeight: FontWeight.w700, color: text_color),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(top: 10, left: 10, bottom: 5, right: 5),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FinanceStatementPage(widget.model)),
                        );
                      },
                      elevation: 10,
                      color: color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Financial Statement',
                        style: TextStyle(fontWeight: FontWeight.w700, color: text_color),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(top: 10, left: 10, bottom: 5, right: 5),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FinanceGPPage(widget.model)),
                        );
                      },
                      elevation: 10,
                      color: color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Financial Growth Projection',
                        style: TextStyle(fontWeight: FontWeight.w700, color: text_color),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//  ListView(
//  children: <Widget>[
//  Button("Financial Tracking"),
//  Button("Financial Management"),
//  Button('Financial Statement'),
//  Button('Financial Growth Projection'),
//
//  ],
//  )

//  Widget Button(String title) {
//    return Padding(
//      padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
//      child: RaisedButton(
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.all(Radius.circular(5))),
//        onPressed: () {
//          if (title == "Financial Tracking")
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => FinanceTrackPage(widget.model)),
//            );
//          else if (title == "Financial Management")
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => FinanceManagePage(widget.model)),
//            );
//          else if (title == "Financial Statement")
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => FinanceStatementPage(widget.model)),
//            );
//          else if (title == "Financial Growth Projection")
//            Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => FinanceGPPage(widget.model)),
//            );
//        },
//        padding: const EdgeInsets.all(0.0),
//        child: Container(
//          width: double.infinity,
//          decoration: new BoxDecoration(
//              borderRadius: BorderRadius.all(Radius.circular(5)),
//              gradient: new LinearGradient(
//                colors: [
//                  Color(0xFF03DAC6),
//                  Color(0xFF018786),
//                ],
//              )),
//          padding: const EdgeInsets.all(13.0),
//          child: Text(
//            title,
//            style: TextStyle(color: Colors.white),
//          ),
//        ),
//      ),
//    );
//  }
//  Expanded(
//  flex: 1,
//  child: Container(
//  width: double.maxFinite,
//  padding: EdgeInsets.all(10),
//  child: Stack(fit: StackFit.expand,
//  children: <Widget>[
//  ClipRRect(
//  child: Image.network("https://image.shutterstock.com/image-photo/financial-data-term-digital-prices-600w-1096299314.jpg", fit: BoxFit.fitWidth),
//  borderRadius: BorderRadius.all(
//  Radius.circular(10),
//  ),
//  ),
//  Align(child: Text('Financial Tracking', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),), alignment: Alignment(0.8, 0.8),)
//  ],)
//  )),

//                      child: Container(
//                        decoration: BoxDecoration(
//                          image: DecorationImage(
//                            image: AssetImage(
//                                'assets/images/finance/finance_tracking.jpeg'),
//                          ),
//                        ),
//                        child: GestureDetector(
//                          onTap: () {
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) =>
//                                      FinanceTrackPage(widget.model)),
//                            );
//                          },
//                          child: Text(
//                            'Financial Tracking',
//                            style: TextStyle(fontWeight: FontWeight.w700),
//                          ),
//                        ),
//                        padding: EdgeInsets.all(10),
//                      ),

}
