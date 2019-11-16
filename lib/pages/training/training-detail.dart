import 'package:flutter/material.dart';

class TrainingDetailPage extends StatelessWidget {
  final Map<String, dynamic> _training;
  TrainingDetailPage(this._training);


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
    // TODO: implement build
    return Scrollbar(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Training Detail'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: ListView(
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
                          'Trainer',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _training['trainer'],
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
                          'Trainee',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _training['trainee'],
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
                          'Start Date',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _training['start_date'],
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
                          'End date',
                          style: attr,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          _training['end_date'],
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
                    _training['description'],
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
}