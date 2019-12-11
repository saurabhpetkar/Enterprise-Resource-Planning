import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import '../../../scoped_models/main.dart';
import '../../../global_widgets/drawer.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import '../../../models/event.dart';

class EventPage extends StatefulWidget {
  final MainModel model;

  EventPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return EventPageState();
  }
}

class EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.model.logout, widget.model),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Hero(
          tag: 'events',
          child: Material(
            color: Colors.transparent,
            child: Text(
              'Upcoming Events',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: widget.model.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PagewiseListViewExample(widget.model.logout, widget.model.setEvent),
    );
  }
}

class PagewiseListViewExample extends StatelessWidget {
  static const int PAGE_SIZE = 15;
  final double rad = 12;
  final Function logout;
  final Function setEvent;


  PagewiseListViewExample(this.logout, this.setEvent);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: PagewiseListView(
        pageSize: PAGE_SIZE,
        itemBuilder: this._itemBuilder,
        pageFuture: (pageIndex) =>
            BackendService.getPosts(pageIndex * PAGE_SIZE, PAGE_SIZE),
      ),
    );
  }

  void SetEvent(Event event){
    setEvent(event);
  }

  Widget _itemBuilder(context, Event entry, _) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5, right: 2, left: 2),
          child: GestureDetector(
            onTap: () {
              SetEvent(entry);
              Navigator.pushNamed(context, '/event-detail');
            },
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
                                  entry.day,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF006978).withOpacity(0.8),
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(2),
                                ),
                              ),
                              width: 40,
                              height: 20,
                              child: Center(
                                child: Text(
                                  entry.month,
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.white),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 10),
                            child: Text(entry.title),
                          ),
                          Container(
                            width: width - 84,
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 10),
                            child: Text(
                              entry.address,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
//                  Divider(
//                    color: Colors.grey,
//                  )
                ],
              ),
              decoration: BoxDecoration(
//                color: Colors.yellow,
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade400),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}



class BackendService {
  static Future<List<Event>> getPosts(offset, limit) async {
    final responseBody = (await http.get(
            'http://jsonplaceholder.typicode.com/posts?_start=$offset&_limit=$limit'))
        .body;

    return data1;
  }
}

class JsonListToEventList {
  String title;
  String body;

  JsonListToEventList.fromJson(obj) {
    this.title = obj['title'];
    this.body = obj['body'];
  }

  static List<Event> fromJsonList(jsonList) {
    return jsonList
        .map<Event>((obj) => JsonListToEventList.fromJson(obj))
        .toList();
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
  //
  Event(
    day: '5',
    month: 'DEC',
    year: 2019.toString(),
    title: 'Intel',
    address: 'Somewhere in NYC',
    picture:
        'https://cdn.pixabay.com/photo/2019/09/30/14/51/squirrel-4515962_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '5',
  ),
  //
  Event(
    day: '6',
    month: 'DEC',
    year: 2019.toString(),
    title: 'IOTA',
    address: 'Somewhere in Sri City',
    picture:
        'https://cdn.pixabay.com/photo/2019/09/28/20/21/trees-4511721_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '6',
  ),
  Event(
    day: '7',
    month: 'DEC',
    year: 2019.toString(),
    title: 'IOT',
    address: 'Somewhere in Pune',
    picture:
        'https://cdn.pixabay.com/photo/2019/10/01/12/24/path-4518094_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '7',
  ),
  Event(
    day: '8',
    month: 'DEC',
    year: 2019.toString(),
    title: 'Olyampiads',
    address: 'Somewhere in Mumbai',
    picture:
        'https://cdn.pixabay.com/photo/2019/10/09/10/46/fog-4537057_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '8',
  ),
  Event(
    day: '9',
    month: 'DEC',
    year: 2019.toString(),
    title: 'Swatch Bharat Abhiyan',
    address: 'Somewhere in Patna',
    picture:
        'https://cdn.pixabay.com/photo/2019/10/10/16/48/window-4540033_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '9',
  ),
  Event(
    day: '10',
    month: 'DEC',
    year: 2019.toString(),
    title: 'Information Retrieval',
    address: 'Somewhere in the world',
    picture:
        'https://cdn.pixabay.com/photo/2019/10/09/13/39/mountain-world-4537456_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '10',
  ),
  Event(
    day: '11',
    month: 'DEC',
    year: 2019.toString(),
    title: 'Tensorflow',
    address: 'Somewhere in Nagpur',
    picture:
        'https://cdn.pixabay.com/photo/2019/10/07/12/57/beach-4532547_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '11',
  ),
  Event(
    day: '12',
    month: 'DEC',
    year: 2019.toString(),
    title: 'Boat Racing',
    address: 'Somewhere in Trichi',
    picture:
        'https://cdn.pixabay.com/photo/2019/09/27/12/39/landscape-4508444_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '12',
  ),
  Event(
    day: '13',
    month: 'DEC',
    year: 2019.toString(),
    title: 'Bull Racing',
    address: 'Somewhere in Panaji',
    picture:
        'https://cdn.pixabay.com/photo/2015/09/09/16/05/forest-931706_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '13',
  ),
  Event(
    day: '14',
    month: 'DEC',
    year: 2019.toString(),
    title: 'Suvrat Skit',
    address: 'Somewhere in Kanpur',
    picture:
        'https://cdn.pixabay.com/photo/2019/10/08/07/22/forest-4534311_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '14',
  ),
  Event(
    day: '15',
    month: 'DEC',
    year: 2019.toString(),
    title: 'Shashwat concert',
    address: 'Somewhere in bareli',
    picture:
        'https://cdn.pixabay.com/photo/2019/10/01/13/06/landscape-4518196_960_720.jpg',
    organizer: 'someone rich',
    description:
        'you will have fun meeting people, get goodies and amazing food, will be able to make connections with awesome people',
    id: '15',
  ),
];
