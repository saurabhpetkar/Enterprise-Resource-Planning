import 'package:flutter/material.dart';

class ComplainDetailPage extends StatelessWidget {
  final Map<String, dynamic> _complain;
  ComplainDetailPage(this._complain);


  TextStyle attr = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  TextStyle content = TextStyle(
    fontSize: 18,
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
                          'From',
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
                          _complain['complainer'],
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
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
                          'Against',
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
                          _complain['against'],
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),

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
                          'Complain Date',
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
                          _complain['date'],
                          style: content,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),



                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    'Reason',
                    style: attr,
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  child: Text(
                    _complain['reason'],
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