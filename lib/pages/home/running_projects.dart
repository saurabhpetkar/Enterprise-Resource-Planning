import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class RunningProjects extends StatelessWidget {
  final List<Map<String, dynamic>> info;

  //only 5 events at max
  RunningProjects(this.info);

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
                  'Projects Status',
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
              print('go to the full projects list');
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

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: width - 36,
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(info[i]['name']),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          child: Text(info[i]['status']),
                          color: StatusColor(info[i]['status']),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                    child: LinearPercentIndicator(
                      width: width - 44,
                      lineHeight: 8.0,
                      percent: info[i]['completion'],
                      progressColor: KonsaColor(info[i]['status'], info[i]['completion'])
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

Color StatusColor(String status){
  status = status.toLowerCase();
  if(status == 'failed')
    return Colors.grey;
  if(status == 'progressing')
    return Colors.lightGreen;
  if(status == 'started')
    return Colors.yellow;
  if(status == 'success')
    return Colors.green;
}

Color KonsaColor(String status, double completion){
  if(status.toLowerCase() == 'failed')
    return Colors.grey;
  if(completion < 0.2)
    return Colors.red;
  if(completion < 0.5)
    return Colors.orange;
  if(completion < 0.7)
    return Colors.yellow;
  if(completion < 0.9)
    return Colors.lightGreenAccent;
  if(completion < 1.0)
    return Colors.lightGreen;
  if(completion == 1.0)
    return Colors.green;
}

//Border(
//bottom: BorderSide(width: 5.0, color: Colors.black),
//right: BorderSide(width: 5.0, color: Colors.black),
//left: BorderSide(width: 5.0, color: Colors.black),
//),
