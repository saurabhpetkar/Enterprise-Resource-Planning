import 'package:flutter/material.dart';

class CompanyDetailPage extends StatelessWidget {
  final _company;
  CompanyDetailPage(this._company);


  TextStyle attr = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  TextStyle content = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w500,  fontFamily: 'UbuntuMono',
    color: Color(0xff333333),
  );

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Company Detail'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Company',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _company['company_name'],
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Email',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _company['email'],
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Mobile',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _company['mobile'].toString(),
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Account Number',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _company['account_number'].toString(),
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'IFSC Code',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _company['ifsc_code'].toString(),
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Bank Name',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _company['bank_name'],
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Address',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _company['address'],
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Status',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _company['status'],
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Date of Joining',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _company['doj'].toString(),
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}