import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../scoped_models/main.dart';
import '../../models/cv.dart';
import './cvpdf.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import '../../global_widgets/drawer.dart';


class CVDetail extends StatefulWidget {
  final MainModel model;

  CVDetail(this.model);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CVDetailState();
  }
}

class CVDetailState extends State<CVDetail> {
  TextStyle attr = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  TextStyle content = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w500,
    color: Color(0xff333333),
  );



  @override
  Widget build(BuildContext context) {
    CV cv = widget.model.selectedCV;


    return SafeArea(
      child: Scaffold(
        drawer: drawer(context, widget.model.logout, widget.model),
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            'Details',
          ),
        ),
        body: widget.model.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scrollbar(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                              'Name',
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
                              cv.name,
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
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              'Place',
                              style: attr,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              cv.state,
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
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              'Email',
                              style: attr,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              cv.email,
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
                          flex: 1,
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
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              cv.hour.toString() + ': ' + cv.min.toString(),
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
                          flex: 1,
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
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              cv.day.toString() +
                                  ' ' +
                                  cv.month +
                                  ', ' +
                                  cv.year.toString(),
                              style: content,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CVPDF(cv.cv_link),
                            ),
                          );
                        },
                        child: Text(
                          'View CV',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: RaisedButton(
                        onPressed: () {
                          sendMail();
                        },
                        child: Text(
                          'Select',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void sendMail() async {
    final Email email = Email(
      body: 'you are selected',
      subject: 'Congratulations, ,you are selected',
      recipients: [widget.model.selectedCV.email],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }
}
