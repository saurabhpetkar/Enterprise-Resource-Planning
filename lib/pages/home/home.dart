import '../../scoped_models/main.dart';

import './card.dart';
import './events.dart';
import './deadlines.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './running_projects.dart';
import './barchart.dart';
import './madeinindia.dart';

import '../style.dart';
import '../../global_widgets/drawer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/event.dart';
import '../../models/sales_stats.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatefulWidget {
  final MainModel model;

  HomePage(this.model);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Sales> week = [];
  List<Sales> year = [];
  Timer timer;
  bool isloading = false;
  bool first = true;

  String month(int i){
    if(i == 1) return "January";
    if(i == 2) return "February";
    if(i == 3) return "March";
    if(i == 4) return "April";
    if(i == 5) return "May";
    if(i == 6) return "June";
    if(i == 7) return "July";
    if(i == 8) return "August";
    if(i == 9) return "September";
    if(i == 10) return "October";
    if(i == 11) return "November";
    if(i == 12) return "December";

  }

  @override
  void initState() {
    super.initState();
    print('home page initstate');
    doit();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t){
      print('timer function');
      print(widget.model.authenticatedUser);
      if(widget.model.authenticatedUser != null) doit();
    });
  }


  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    print('dispose called');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    String route = ModalRoute.of(context).settings.name;

    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(context, widget.model.logout, widget.model),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Home'),
      ),
      body: SafeArea(
        child: widget.model.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scrollbar(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              card(card_info),
              SizedBox(
                height: 20,
              ),
              Events(data1, widget.model),
              SizedBox(
                height: 20,
              ),
              RunningProjects(projects),
              SizedBox(
                height: 20,
              ),
              Deadlines(deadlines),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0.1, 0.1))
                      ]),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Sales in the past 7 days",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontFamily: "UbuntuMono"),
                        ),
                      ),
                      Expanded(
                        child: stats_week == null ? Center(child: CircularProgressIndicator(),) : BarChart(stats_week),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0.1, 0.1))
                      ]),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Sales in the past 12 months",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontFamily: "UbuntuMono"),
                        ),
                      ),
                      Expanded(
                        child: stats_year == null ? Center(child: CircularProgressIndicator(),) : BarChart(stats_year),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Handcrafted(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }



  void doit() async {
    String url1 = "http://"+widget.model.ip+"/sales/weekgraph/";
    http.Response response1 = await http.get(url1);

    String url2 = "http://"+widget.model.ip+"/sales/yeargraph/";
    http.Response response2 = await http.get(url1);

    List<dynamic> list1 = json.decode(response1.body);
    List<dynamic> list2 = json.decode(response2.body);

    week = [
      Sales(
        name: list1[0][0].toString(),
        sales: list1[1][0].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.blueGrey),
      ),
      Sales(
        name: list1[0][1].toString(),
        sales: list1[1][1].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent),
      ),
      Sales(
        name: list1[0][2].toString(),
        sales: list1[1][2].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
      ),
      Sales(
        name: list1[0][3].toString(),
        sales: list1[1][3].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.orange),
      ),
      Sales(
        name: list1[0][4].toString(),
        sales: list1[1][4].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
      ),
      Sales(
        name: list1[0][5].toString(),
        sales: list1[1][5].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
      ),
      Sales(
        name: list1[0][6].toString(),
        sales: list1[1][6].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
      ),
    ];

    year = [
      Sales(
        name: month(list2[0][0].toInt()),
        sales: list2[1][0].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.blueGrey),
      ),
      Sales(
        name: month(list2[0][1].toInt()),
        sales: list2[1][1].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent),
      ),
      Sales(
        name: month(list2[0][2].toInt()),
        sales: list2[1][2].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
      ),
      Sales(
        name: month(list2[0][3].toInt()),
        sales: list2[1][3].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.orange),
      ),
      Sales(
        name: month(list2[0][4].toInt()),
        sales: list2[1][4].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
      ),
      Sales(
        name: month(list2[0][5].toInt()),
        sales: list2[1][5].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
      ),
      Sales(
        name: month(list2[0][6].toInt()),
        sales: list2[1][6].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
      ),
      Sales(
        name: month(list2[0][7].toInt()),
        sales: list2[1][7].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
      ),
      Sales(
        name: month(list2[0][8].toInt()),
        sales: list2[1][8].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
      ),
      Sales(
        name: month(list2[0][9].toInt()),
        sales: list2[1][9].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
      ),
      Sales(
        name: month(list2[0][10].toInt()),
        sales: list2[1][10].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
      ),
      Sales(
        name: month(list2[0][11].toInt()),
        sales: list2[1][11].toInt(),
        barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
      ),
    ];
    print(list1);
    print(list2);

    setState(() {});

  }


}




List<Sales> stats_year = [
  Sales(
    name: "2012",
    sales: 1000,
    barColor: charts.ColorUtil.fromDartColor(Colors.blueGrey),
  ),
  Sales(
    name: "2013",
    sales: 10,
    barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent),
  ),
  Sales(
    name: "2014",
    sales: 50,
    barColor: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
  ),
  Sales(
    name: "2015",
    sales: 55,
    barColor: charts.ColorUtil.fromDartColor(Colors.orange),
  ),
  Sales(
    name: "2016",
    sales: 33,
    barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
  ),
  Sales(
    name: "2017",
    sales: 27,
    barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
  ),
  Sales(
    name: "2018",
    sales: 66,
    barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
  ),
];






List<Sales> stats_week = [
  Sales(
    name: "2012",
    sales: 10,
    barColor: charts.ColorUtil.fromDartColor(Colors.blueGrey),
  ),
  Sales(
    name: "2013",
    sales: 10,
    barColor: charts.ColorUtil.fromDartColor(Colors.greenAccent),
  ),
  Sales(
    name: "2014",
    sales: 50,
    barColor: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
  ),
  Sales(
    name: "2015",
    sales: 55,
    barColor: charts.ColorUtil.fromDartColor(Colors.orange),
  ),
  Sales(
    name: "2016",
    sales: 33,
    barColor: charts.ColorUtil.fromDartColor(Colors.redAccent),
  ),
  Sales(
    name: "2017",
    sales: 27,
    barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
  ),
  Sales(
    name: "2018",
    sales: 66,
    barColor: charts.ColorUtil.fromDartColor(Colors.lightGreen),
  ),
];

List<Event> data1 = [
  Event(
    day: 1.toString(),
    month: 'DEC',
    year: 2019.toString(),
    title: 'PyCon',
    address: 'Somewhere in Chennai',
    picture:
        'https://cdn.pixabay.com/photo/2019/09/28/20/21/trees-4511721_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '1',
  ),
  Event(
    day: 2.toString(),
    month: 'DEC',
    year: 2019.toString(),
    title: 'Flutter',
    address: 'Somewhere in Bangalore',
    picture:
        'https://cdn.pixabay.com/photo/2019/09/25/09/36/team-4503157_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '2',
  ),
  Event(
    day: '3',
    month: 'DEC',
    year: 2019.toString(),
    title: 'Javascript',
    address: 'Somewhere in hyd',
    picture:
        'https://cdn.pixabay.com/photo/2019/09/10/15/10/dolomites-4466357_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '3',
  ),
//
  Event(
    day: '4',
    month: 'DEC',
    year: 2019.toString(),
    title: 'PyCharm',
    address: 'Somewhere in Delhi',
    picture:
        'https://cdn.pixabay.com/photo/2019/10/02/16/56/landscape-4521413_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '4',
  ),
];

List<Map<String, dynamic>> events = [
  {
    'day': 21,
    'month': 'DEC',
    'year': 2019,
    'name': 'PyCon',
    'address': 'Somewhere in Chennai',
    'nav': 'some link'
  },
  {
    'day': 2,
    'month': 'JAN',
    'year': 2019,
    'name': 'Flutter',
    'address': 'Somewhere in Bangalore',
    'nav': 'some link'
  },
  {
    'day': 1,
    'month': 'FEB',
    'year': 2019,
    'name': 'JavaScript',
    'address': 'Somewhere in New York',
    'nav': 'some link'
  },
  {
    'day': 31,
    'month': 'MAY',
    'year': 2019,
    'name': 'C++',
    'address': 'Somewhere in Mumbai',
    'nav': 'some link'
  },
];

List<Map<String, dynamic>> projects = [
  {
    'name': 'database',
    'status': 'failed',
    'completion': 0.9,
    'link': '/projects/12'
  },
  {
    'name': 'Deep Learning',
    'status': 'progressing',
    'completion': 0.85,
    'link': '/projects/123'
  },
  {
    'name': 'Quantum Computing',
    'status': 'started',
    'completion': 0.1,
    'link': '/projects/1'
  },
  {
    'name': 'Computer Vision',
    'status': 'Success',
    'completion': 1.0,
    'link': '/projects/122'
  },
];

List<Map<String, dynamic>> deadlines = [
  {'name': 'database', 'date': '12 Feb, 2019', 'link': '/deadline/12'},
  {'name': 'Deep Learning', 'date': '31 Jan, 2019', 'link': '/deadline/123'},
  {'name': 'Quantum Computing', 'date': '23 May, 2019', 'link': '/deadline/1'},
  {'name': 'Computer Vision', 'date': '13 Nov, 2019', 'link': '/deadline/122'},
];

List<Map<String, dynamic>> card_info = [
  {'heading': 'Active Clients', 'icon': Icons.people, 'notifications': 31},
  {'heading': 'Active Admins', 'icon': Icons.spa, 'notifications': 6},
  {'heading': 'Total Expenses', 'icon': Icons.attach_money, 'notifications': 0},
  {'heading': 'Running Projects', 'icon': Icons.palette, 'notifications': 2},
];
