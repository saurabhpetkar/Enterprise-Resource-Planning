import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import './Events/eventList.dart';


const Color font_color = Color(0xFF333333);
class Events extends StatelessWidget {
  final MainModel model;
  final List<Map<String, dynamic>> info;

  //only 5 events at max
  Events(this.info, this.model);

  @override
  Widget build(BuildContext context) {
    final int l = info.length;
    int limit = 3;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.green[800],
                  Colors.green[700],
                  Colors.green[600],
                  Colors.green[400],
                ],
              ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5), topLeft: Radius.circular(5),),
              boxShadow: [
                BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 10,
                    color: Colors.black26),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Upcoming Events',
                  style: TextStyle(
                    fontSize: 16,
                    color: font_color,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    print('do something');
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: info.length > limit
                  ? BorderRadius.vertical(bottom: Radius.circular(0))
                  : BorderRadius.vertical(bottom: Radius.circular(5)),

              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 10,
                    color: Colors.black26),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: getWidgets(info, limit, width),
              ),
            ),
          ),
          info.length > limit
              ? GestureDetector(
                  onTap: () {
                    print('go to the full events list');
//                    Navigator.push(
//                context,
//                PageRouteBuilder(
//                  transitionDuration: Duration(milliseconds: 5000),
//                  pageBuilder: (_, __, ___) =>
//                      EventPage(model),
//                ),
//              );
                  Navigator.pushNamed(context, '/event-list');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 10,
                            color: Colors.black26),
                      ],
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      'Load more',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                )
              : SizedBox(
                  height: 0,
                ),
        ],
      ),
    );
  }
}

//  {'day': 21, 'month': 12, 'year': 2019, 'name': 'PyCon', 'address': 'Somewhere in Chennai', 'nav': 'some link'},

List<Widget> getWidgets(
    List<Map<String, dynamic>> info, int limit, double width) {
  List<Widget> list = [];
  limit = limit < info.length ? limit : info.length;
  for (int i = 0; i < limit; i++) {
    if (i > limit) break;
    Widget w = Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(3),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(2),
                        ),
                      ),
                      width: 40,
                      height: 20,
                      child: Center(
                        child: Text(
                          info[i]['day'].toString(),
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(2),
                        ),
                      ),
                      width: 40,
                      height: 20,
                      child: Center(
                        child: Text(
                          info[i]['month'].toString(),
                          style: TextStyle(fontSize: 9, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: width - 84,
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Text(info[i]['name'], style: TextStyle(color: font_color),),
                  ),
                  Container(
                    width: width - 84,
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Text(
                      info[i]['address'],
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
    list.add(w);
  }

  return list;
}

//Border(
//bottom: BorderSide(width: 5.0, color: Colors.black),
//right: BorderSide(width: 5.0, color: Colors.black),
//left: BorderSide(width: 5.0, color: Colors.black),
//),
