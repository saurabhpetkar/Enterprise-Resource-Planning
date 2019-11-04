import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import '../../scoped_models/main.dart';
import '../../global_widgets/drawer.dart';
import 'package:http/http.dart' as http;
import '../../models/cv.dart';


class CVPage extends StatefulWidget {
  final MainModel model;

  CVPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return CVPageState();
  }
}

class CVPageState extends State<CVPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.model.logout),
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Hero(
          tag: 'CVs',
          child: Material(
            color: Colors.transparent,
            child: Text(
              'CVs',
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
          : PagewiseListViewExample(widget.model.logout, widget.model.setCV),
    );
  }
}

class PagewiseListViewExample extends StatelessWidget {
  static const int PAGE_SIZE = 10;
  final double rad = 12;
  final Function logout;
  final Function setCV;


  PagewiseListViewExample(this.logout, this.setCV);

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

  void SetPurchase(CV cv){
    setCV(cv);
  }

  Widget _itemBuilder(context, CV entry, _) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 5, right: 2, left: 2),
          child: GestureDetector(
            onTap: () {
              SetPurchase(entry);
              Navigator.pushNamed(context, '/cv-detail');
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
                                  entry.day.toString(),
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
                            child: Text(entry.name),
                          ),
                          Container(
                            width: width - 84,
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 10),
                            child: Text(
                              entry.state,
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
  static Future<List<CV>> getPosts(offset, limit) async {
    final responseBody = (await http.get(
        'http://jsonplaceholder.typicode.com/posts?_start=$offset&_limit=$limit'))
        .body;

    return data;
  }
}

class JsonListToCVList {
  String title;
  String body;

  JsonListToCVList.fromJson(obj) {
    this.title = obj['title'];
    this.body = obj['body'];
  }

  static List<CV> fromJsonList(jsonList) {
    return jsonList
        .map<CV>((obj) => JsonListToCVList.fromJson(obj))
        .toList();
  }
}

List<CV> data = [
  CV(name: 'deepesh', email: 'xyz@gmail.com', cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf', state: 'Bihar', day: 1, month: 'Jan', year: 2019, hour: 18, min: 38),
  CV(name: 'saurabh', email: 'xyz@gmail.com', cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf', state: 'Maharashtra', day: 2, month: 'Jan', year: 2019, hour: 18, min: 38),
  CV(name: 'atul', email: 'xyz@gmail.com', cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf', state: 'Bihar', day: 3, month: 'Jan', year: 2019, hour: 18, min: 38),
  CV(name: 'kolpo', email: 'xyz@gmail.com', cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf', state: 'Assam', day: 4, month: 'Jan', year: 2019, hour: 18, min: 38),
  CV(name: 'sid G', email: 'xyz@gmail.com', cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf', state: 'Bihar', day: 5, month: 'Jan', year: 2019, hour: 18, min: 38),
  CV(name: 'akshay', email: 'xyz@gmail.com', cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf', state: 'UP', day: 6, month: 'Jan', year: 2019, hour: 18, min: 38),
  CV(name: 'sukirti', email: 'xyz@gmail.com', cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf', state: 'AP', day: 7, month: 'Jan', year: 2019, hour: 18, min: 38),
  CV(name: 'sri babu', email: 'xyz@gmail.com', cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf', state: 'AP', day: 8, month: 'Jan', year: 2019, hour: 18, min: 38),
  CV(name: 'sai krishna', email: 'xyz@gmail.com', cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf', state: 'AP', day: 9, month: 'Jan', year: 2019, hour: 18, min: 38),
  CV(name: 'ankur', email: 'xyz@gmail.com', cv_link: 'https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf', state: 'UP', day: 10, month: 'Jan', year: 2019, hour: 18, min: 38),

];



