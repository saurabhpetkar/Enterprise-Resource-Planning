import '../../scoped_models/main.dart';

import './card.dart';
import './events.dart';
import './deadlines.dart';

import './running_projects.dart';

import '../style.dart';
import '../../global_widgets/drawer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/event.dart';
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
  );
  var currentPageValue = 0.0;

  @override
  void initState() {
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
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Home'),
      ),
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

Widget Page(BuildContext context, MainModel model) {
  return Scrollbar(
    child: ListView(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        card(card_info),
        SizedBox(
          height: 20,
        ),
        Events(data1, model),
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
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Handcrafted with '),
              Icon(Icons.favorite, color: Colors.pink,),
              Text(' in India.'),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}
