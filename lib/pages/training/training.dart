import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../../global_widgets/drawer.dart';
import 'dart:convert';
import './training-detail.dart';


class TrainingPage extends StatefulWidget {
  final MainModel model;

  TrainingPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return TrainingPageState();
  }
}

class TrainingPageState extends State<TrainingPage> {
  List<dynamic> _trainings = [];
  bool isloading = true;

  @override
  void initState() {
    doit();
  print('in initstate');
//    _trainings = list;

    super.initState();
  }

  void doit() async {
    _trainings = await GetCompanies();
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.model.logout, widget.model),
      appBar: AppBar(
        title: Text('Training'),
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
                          builder: (context) => TrainingDetailPage(
                            _trainings[index],
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
                                  _trainings[index]['trainee'],
                                  style: TextStyle(fontSize: 17, fontFamily: 'UbuntuMono',fontWeight: FontWeight.w600,),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  _trainings[index]['trainer'],
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
                                _trainings[index]['start_date'],
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
          itemCount: _trainings.length,
        ),
      ),);
  }

  Future<List<dynamic>> GetCompanies() async {
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


    return list;


  }
}

List<dynamic> list = [
  {'trainer': 'teacher', 'trainee': 'student', 'start_date': '12 Dec, 2019', 'end_date': '12 Dec, 2019', 'description': 'Lorem ipson'},
  {'trainer': 'teacher', 'trainee': 'student', 'start_date': '12 Dec, 2019', 'end_date': '12 Dec, 2019', 'description': 'Lorem ipson'},
  {'trainer': 'teacher', 'trainee': 'student', 'start_date': '12 Dec, 2019', 'end_date': '12 Dec, 2019', 'description': 'Lorem ipson'},
  {'trainer': 'teacher', 'trainee': 'student', 'start_date': '12 Dec, 2019', 'end_date': '12 Dec, 2019', 'description': 'Lorem ipson'},
  {'trainer': 'teacher', 'trainee': 'student', 'start_date': '12 Dec, 2019', 'end_date': '12 Dec, 2019', 'description': 'Lorem ipson'},
  {'trainer': 'teacher', 'trainee': 'student', 'start_date': '12 Dec, 2019', 'end_date': '12 Dec, 2019', 'description': 'Lorem ipson'},
  {'trainer': 'teacher', 'trainee': 'student', 'start_date': '12 Dec, 2019', 'end_date': '12 Dec, 2019', 'description': 'Lorem ipson'},
  {'trainer': 'teacher', 'trainee': 'student', 'start_date': '12 Dec, 2019', 'end_date': '12 Dec, 2019', 'description': 'Lorem ipson'},

];

