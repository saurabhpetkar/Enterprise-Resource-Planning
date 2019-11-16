import 'package:flutter/material.dart';

class Deadlines extends StatelessWidget {
  final List<Map<String, dynamic>> info;

  //only 5 events at max
  Deadlines(this.info);

  @override
  Widget build(BuildContext context) {
    final int l = info.length;
    int limit = 4;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue,

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
                  'Deadlines',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 7, bottom: 7),
                  child: Text(info[i]['name'], style: TextStyle(fontWeight: FontWeight.w700),),
                )
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 7, bottom: 7),
                  child: Text(info[i]['date']),
                )
              ),
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
