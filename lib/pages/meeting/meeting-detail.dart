import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'package:http/http.dart' as http;
import '../../global_widgets/drawer.dart';

class MeetingDetailPage extends StatefulWidget {
  final MainModel model;

  MeetingDetailPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return MeetingDetailPageState();
  }
}

class MeetingDetailPageState extends State<MeetingDetailPage> {
  Map<String, dynamic> _meeting;
  bool isloading = true;

  @override
  void initState() {
    GetMeeting(widget.model.selectedMeetingId);
    super.initState();
  }

  TextStyle attr = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  TextStyle content = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: Color(0xff333333),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.model.logout, widget.model),
      appBar: AppBar(
        title: Text('Meeting'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: isloading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Scrollbar(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Topic',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10,),
                        child: Text(
                          _meeting['topic'],
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Date',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _meeting['day'].toString()+ ' '+ _meeting['month'],
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Time',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _meeting['hour'].toString()+ ':'+ _meeting['minute'].toString(),
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Venue',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10,),
                        child: Text(
                          _meeting['venue'],
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    'Description',
                    style: attr,
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  child: Text(
                    _meeting['description'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GetMeeting(int index) async {
    setState(() {
      isloading = true;
    });
    http.Response response = await http
        .get('http://jsonplaceholder.typicode.com/posts?_start=10&_limit=3');

    _meeting = {
      'topic': 'Node js work',
      'description': 'Node js work has to be done today.',
      'day': 1,
      'month': 'JAN',
      'hour': 18,
      'minute': 30,
      'venue': 'Bangalore Headquarters',
      'id': 5
    };

    setState(() {
      isloading = false;
    });
  }
}

//      SafeArea(
//        child: ScopedModel<MainModel>(
//          model: new MainModel(),
//          child: ScopedModelDescendant<MainModel>(
//            builder: (context, child, model) {
//              return model.isLoading
//                  ? Center(
//                      child: CircularProgressIndicator(),
//                    )
//                  : Scrollbar(
//                      child: ListView.builder(
//                        itemBuilder: (BuildContext context, int index) {
//                          return ButtonTheme(
//                            height: 40,
//                            minWidth: double.infinity,
//                            child: Padding(
//                              padding: const EdgeInsets.only(
//                                  left: 8.0, right: 8.0, top: 4, bottom: 2),
//                              child: FlatButton(
//                                onPressed: () {},
//                                child: Text(
//                                  widget.model.products[index]['name'],
//                                ),
//                              ),
//                            ),
//                          );
//                        },
//                        itemCount: widget.model.products.length,
//                      ),
//                    );
//            },
//          ),
//        ),
//      ),
