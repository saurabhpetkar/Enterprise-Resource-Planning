import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../../global_widgets/drawer.dart';
import 'dart:convert';
import './complain-detail.dart';

class ComplainPage extends StatefulWidget {
  final MainModel model;

  ComplainPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return ComplainPageState();
  }
}

class ComplainPageState extends State<ComplainPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  List<dynamic> _complains = [];
  bool isloading = true;

  @override
  void initState() {
    doit();
    print('init state');
    super.initState();
  }

  void doit() async {
    _complains = await GetComplains();
    setState(() {
      isloading = false;
    });
  }

  Future<Null> doitagain(){
    return GetComplains().then((_blah) {
      setState((){
        _complains = _blah;
        isloading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.model.logout, widget.model),
      appBar: AppBar(
        title: Text('Complains'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: doitagain,
        child: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scrollbar(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        // Removes that item the list on swipwe
                        setState(() {
                          _complains.removeAt(index);
                        });
                        // Shows the information on Snackbar
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text("complain dismissed")));
                      },
                      key: Key(_complains[index]['id'].toString()),
                      child: ButtonTheme(
                        minWidth: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 3.0, right: 0.0, bottom: 1),
                          child: RaisedButton(
                            elevation: 1,
                            color: Colors.white,
                            onPressed: () {
//                    widget.model.SetMeetingId(_companies[index]['id']);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ComplainDetailPage(
                                          _complains[index],
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
                                            _complains[index]['complainer'],
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'UbuntuMono',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            _complains[index]['against'],
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
                                          _complains[index]['date'],
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 12,
                                            fontFamily: 'UbuntuMono',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _complains.length,
                ),
              ),
      ),
    );
  }

  Future<List<dynamic>> GetComplains() async {
    setState(() {
      isloading = true;
    });
//    String link = 'http://' + '10.0.51.119:8000' + '/sales/restcustomer/';
//    print(link);
//
//    final responseBody = await http.get(
//      link,
//      headers: {
//        'Content-Type': 'application/json',
//      },
//    );
//
//    final list = json.decode(responseBody.body);
//    print(list);
    print(list.length);
    return list;
  }
}

List<dynamic> list = [
  {
    'complainer': 'teacher',
    'against': 'student',
    'date': '12 Dec, 2019',
    'reason': 'He ate my sandwitch',
    'id': 1
  },
  {
    'complainer': 'teacher',
    'against': 'student',
    'date': '12 Dec, 2019',
    'reason': 'He ate my sandwitch',
    'id': 2
  },
  {
    'complainer': 'teacher',
    'against': 'student',
    'date': '12 Dec, 2019',
    'reason': 'He ate my sandwitch',
    'id': 3
  },
  {
    'complainer': 'teacher',
    'against': 'student',
    'date': '12 Dec, 2019',
    'reason': 'He ate my sandwitch',
    'id': 4
  },
  {
    'complainer': 'teacher',
    'against': 'student',
    'date': '12 Dec, 2019',
    'reason': 'He ate my sandwitch',
    'id': 5
  },
  {
    'complainer': 'teacher',
    'against': 'student',
    'date': '12 Dec, 2019',
    'reason': 'He ate my sandwitch',
    'id': 6
  },
];
