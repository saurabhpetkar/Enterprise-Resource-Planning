import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../../global_widgets/drawer.dart';
import 'dart:convert';

class MeetingListPage extends StatefulWidget {
  final MainModel model;

  MeetingListPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return MeetingListPageState();
  }
}

class MeetingListPageState extends State<MeetingListPage> {
  List<dynamic> _meetings = [];
  bool isloading = true;

  @override
  void initState() {
    doit();
    super.initState();
  }
  void doit() async {
    _meetings = await GetMeetings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(context, widget.model.logout),
        appBar: AppBar(
          title: Text('Meetings'),
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
//                            widget.model.SetMeetingId(_meetings[index]['id']);
//                            Navigator.pushNamed(context, '/meeting-detail');
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
                                          _meetings[index]['organiser'],
                                          style: TextStyle(fontSize: 17, fontFamily: 'UbuntuMono',fontWeight: FontWeight.w600,),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          _meetings[index]['description'],
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
                                        _meetings[index]['date'].toString(),
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
                  itemCount: _meetings.length,
                ),
              ),);
  }

  Future<List<dynamic>> GetMeetings() async {
    setState(() {
      isloading = true;
    });
    http.Response response = await http
        .get('http://10.0.51.119:8000/hr/meetinglist/');

    final d = response.body;
    final list = json.decode(d);



//    _meetings = [
//      {
//        'topic': 'Backend work',
//        'description':
//            'Backend work has to be done today at any cost, please do anything inorder to complete it.',
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

    setState(() {
      isloading = false;
    });

    return list;
  }
}

