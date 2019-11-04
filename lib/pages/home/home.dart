import '../../scoped_models/main.dart';

import './card.dart';
import './events.dart';
import './deadlines.dart';

import './running_projects.dart';

import '../style.dart';
import '../../global_widgets/drawer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import '../../experiment/page_drawer.dart';

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
  bool show = true;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController controller = new PageController(
    initialPage: 0,
    viewportFraction: 1.0,
  );  var currentPageValue = 0.0;

  @override
  void initState() {
//    widget.model.fetchHomeData();


    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    String route = ModalRoute.of(context).settings.name;

    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(context, widget.model.logout),
      body: SafeArea(
        child: widget.model.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Page(context, widget.model),
      ),
    );
  }
}

List<Map<String, dynamic>> card_info = [
  {'heading': 'Active Clients', 'icon': Icons.people, 'notifications': 31},
  {'heading': 'Active Admins', 'icon': Icons.spa, 'notifications': 6},
  {'heading': 'Total Expenses', 'icon': Icons.attach_money, 'notifications': 0},
  {'heading': 'Running Projects', 'icon': Icons.palette, 'notifications': 2},
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

Widget Page(BuildContext context, MainModel model) {
  var focusNode = new FocusNode();
  return Stack(
    children: <Widget>[
      Scrollbar(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 55,
            ),
            card(card_info[0]),
            card(card_info[1]),
            card(card_info[2]),
            card(card_info[3]),
            SizedBox(
              height: 20,
            ),
            Events(events, model),
            SizedBox(
              height: 20,
            ),
            RunningProjects(projects),
            SizedBox(
              height: 20,
            ),
            Deadlines(deadlines),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
//      Positioned(
//        left: MediaQuery.of(context).size.width * 0.025,
//        top: 5,
//        child: Container(
//          height: 50,
//          width: MediaQuery.of(context).size.width * 0.95,
//          decoration: BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.horizontal(
//              left: Radius.circular(25),
//              right: Radius.circular(25),
//            ),
//            boxShadow: [
//              BoxShadow(
//                color: Colors.black26,
//                blurRadius: 10,
//                offset: Offset(1, 3),
//              ),
//            ],
//          ),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Container(
//                padding: EdgeInsets.only(left: 20, bottom: 0),
//                width: MediaQuery.of(context).size.width * 0.95 - 60,
//                child: TextField(
////
//                    ),
//              ),
//              MaterialButton(
//                onPressed: () {},
//                minWidth: 60,
//                height: 55,
//                color: Colors.lightBlueAccent,
//                child: Icon(
//                  Icons.search,
//                  color: Colors.white,
//                  size: 25,
//                ),
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.horizontal(
//                    right: Radius.circular(25),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
    ],
  );
}

//
//  Widget page_drawer() {
//    return Drawer(
//      child: PageView(
//
//        controller: controller,
//        children: <Widget>[
//          Column(
//            children: <Widget>[
//              ListTile(
//                title: Text(
//                  'go to page 1',
//                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
//                ),
//                leading: Icon(Icons.arrow_downward),
//                onTap: () {
//                  gotopg1();
//                },
//              ),
//              ListTile(
//                title: Text(
//                  'go to page 2',
//                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
//                ),
//                leading: Icon(Icons.arrow_downward),
//                onTap: () {
//                  gotopg2();
//                },
//              ),
//            ],
//          ),
//          Container(
//            color: Colors.greenAccent,
//            child: Center(
//              child: RaisedButton(
//                color: Colors.grey,
//                onPressed: () {
//                  controller.animateToPage(
//                    0,
//                    duration: const Duration(milliseconds: 400),
//                    curve: Curves.easeInOut,
//                  );
//                },
//                child: Text('go to page 0'),
//              ),
//            ),
//          ),
//          Container(
//            color: Colors.yellow,
//            child: Center(
//              child: RaisedButton(
//                color: Colors.blue,
//                onPressed: () {
//                  gotopg0();
//                },
//                child: Text('go to page 0'),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  gotopg0(){
//    controller.animateToPage(
//      0,
//      duration: const Duration(milliseconds: 400),
//      curve: Curves.easeInOut,
//    );
//  }
//  gotopg1(){
//    controller.animateToPage(
//      1,
//      duration: const Duration(milliseconds: 400),
//      curve: Curves.easeInOut,
//    );
//  }
//  gotopg2(){
//    controller.animateToPage(
//      2,
//      duration: const Duration(milliseconds: 400),
//      curve: Curves.easeInOut,
//    );
//  }
//

