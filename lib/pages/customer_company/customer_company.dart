import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../../global_widgets/drawer.dart';
import 'dart:convert';
import './company-detail.dart';


class CompanyPage extends StatefulWidget {
  final MainModel model;

  CompanyPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return CompanyPageState();
  }
}

class CompanyPageState extends State<CompanyPage> {
  List<dynamic> _companies = [];
  bool isloading = true;

  @override
  void initState() {
    doit();
    super.initState();
  }

  void doit() async {
    _companies = await GetCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.model.logout, widget.model),
      appBar: AppBar(
        title: Text('Customer Companies'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: isloading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Scrollbar(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ButtonTheme(
              minWidth: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 3.0, right: 0.0, bottom: 1),
                child: RaisedButton(
                  elevation: 1,
                  color: Colors.white,
                  onPressed: () {
//                    widget.model.SetMeetingId(_companies[index]['id']);
//                    Navigator.pushNamed(context, '/meeting-detail');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompanyDetailPage(
                            _companies[index],
                          )),
                    );

                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    height: 60,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 16,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Text(
                                  _companies[index]['company_name'],
                                  style: TextStyle(fontSize: 17, fontFamily: 'UbuntuMono',fontWeight: FontWeight.w600,),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  _companies[index]['email'],
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Align(
                              alignment: Alignment(0, 0),
                              child: Text(
                                _companies[index]['doj'],
                                style: TextStyle(color: Colors.blue, fontSize: 12, fontFamily: 'UbuntuMono',fontWeight: FontWeight.w600,),
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
          },
          itemCount: _companies.length,
        ),
      ),);
  }

  Future<List<dynamic>> GetCompanies() async {
    setState(() {
      isloading = true;
    });
//    http.Response response = await http
//        .get('http://jsonplaceholder.typicode.com/posts?_start=10&_limit=3');

    String link = 'http://' + '10.0.51.119:8000' + '/sales/restcustomer/';
    print(link);

    final responseBody = await http.get(
      link,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final list = json.decode(responseBody.body);
//    _companies = list;
    print(list);
    setState(() {
      isloading = false;
    });
    return list;



//    _companies = [
//      {
//        "id": 4,
//        "company_name": "Hindustan Uniliver",
//        "email": "hindustan@uniliver.in",
//        "mobile": 9889,
//        "account_number": 123456,
//        "ifsc_code": "sdjhj",
//        "bank_name": "bjsdj",
//        "address": "abcd",
//        "status": "Active",
//        "doj": "2019-11-15"
//      },
//      {
//        "id": 5,
//        "company_name": "werest",
//        "email": "gh1@email.com",
//        "mobile": 5645645646,
//        "account_number": 464564564564564,
//        "ifsc_code": "66456456456",
//        "bank_name": "l,kjhcvxvxc",
//        "address": "vxzcvxzcvz",
//        "status": "Active",
//        "doj": "2019-11-16"
//      }
//    ];
//
//    final _companies1 = [
//      {
//        'topic': 'Backend work',
//        'description':
//        'Backend work has to be done today at any cost, please do anything inorder to complete it.',
//        'day': 1,
//        'month': 'JAN',
//        'id': 1
//      },
//      {
//        'topic': 'Frontend work',
//        'description': 'Frontend work has to be done today.',
//        'day': 1,
//        'month': 'JAN',
//        'id': 2
//      },
//      {
//        'topic': 'API work',
//        'description': 'API work has to be done today.',
//        'day': 1,
//        'month': 'JAN',
//        'id': 3
//      },
//      {
//        'topic': 'Flutter work',
//        'description': 'Flutter work has to be done today.',
//        'day': 1,
//        'month': 'JAN',
//        'id': 4
//      },
//      {
//        'topic': 'Node js work',
//        'description': 'Node js work has to be done today.',
//        'day': 1,
//        'month': 'JAN',
//        'id': 5
//      },
//      {
//        'topic': 'Django work',
//        'description': 'Django work has to be done today.',
//        'day': 1,
//        'month': 'JAN',
//        'id': 6
//      },
//      {
//        'topic': 'Firebase work',
//        'description': 'Firebase work has to be done today.',
//        'day': 1,
//        'month': 'JAN',
//        'id': 7
//      },
//      {
//        'topic': 'Flask work',
//        'description': 'Flask work has to be done today.',
//        'day': 1,
//        'month': 'JAN',
//        'id': 8
//      },
//      {
//        'topic': 'Adobe work',
//        'description': 'Adobe work has to be done today.',
//        'day': 1,
//        'month': 'JAN',
//        'id': 9
//      },
//      {
//        'topic': 'Backend work',
//        'description': 'Backend work has to be done today.',
//        'day': 1,
//        'month': 'JAN',
//        'id': 10
//      },
//    ];

    // company_name, email, mobile, account_number, ifsc_code, bank_name, address, status, doj

  }
}

