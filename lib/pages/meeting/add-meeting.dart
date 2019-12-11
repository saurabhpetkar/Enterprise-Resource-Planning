import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../../global_widgets/drawer.dart';

class AddMeetingPage extends StatefulWidget {
  final MainModel model;

  AddMeetingPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return AddMeetingPageState();
  }
}

class AddMeetingPageState extends State<AddMeetingPage> {
  bool isLoading = false;
  Map<String, dynamic> message;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _organiser = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _venue = TextEditingController();
  List<String> departments = [];

  DateTime from_date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  bool dev = false, d = false, m = false, t = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.model.logout, widget.model),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Add Meeting'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TopicField(),
              DescriptionField(),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: PickDate(),
                    ),
                    Expanded(
                      flex: 1,
                      child: PickTime(),
                    ),
                  ],
                ),
              ),
              VenueField(),
//              SizedBox(
//                height: 5,
//              ),
              Checkboxes(),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5), child: (m | d | dev | t)? Text("") : Text('You have to select atleast one', style: TextStyle(color: Colors.red),),)
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget Checkboxes(){
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Checkbox(
                        value: dev,
                        onChanged: (val) {
                          dev = val;
                          if (val == true)
                            departments.add('Developers');
                          else
                            departments.remove('Developers');
                          setState(() {
                          });
                        },
                      ),
                      flex: 1,
                    ),
                    Expanded(child: Text('Developers'), flex: 2),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Checkbox(
                        value: d,
                        onChanged: (val) {
                          d = val;
                          if (val == true)
                            departments.add('Design');
                          else
                            departments.remove('Design');
                          setState(() {});
                        },
                      ),
                      flex: 1,
                    ),
                    Expanded(child: Text('Design'), flex: 2),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Checkbox(
                        value: m,
                        onChanged: (val) {
                          m = val;
                          if (val == true)
                            departments.add('Marketing');
                          else
                            departments.remove('Marketing');
                          setState(() {

                          });
                        },
                      ),
                      flex: 1,
                    ),
                    Expanded(child: Text('Marketing'), flex: 2),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Checkbox(
                        value: t,
                        onChanged: (val) {
                          t = val;
                          if (val == true)
                            departments.add('Testing');
                          else
                            departments.remove('Testing');
                          setState(() {

                          });
                        },
                      ),
                      flex: 1,
                    ),
                    Expanded(child: Text('Testing'), flex: 2),
                  ],
                ),
              ),
            ],
          )
        ],
      ),

    );
  }

  void _showSuccessBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Meeting Added"),
          content: new Text("Meeting added successfully."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showtrylaterbox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Couldn't add the meeting, please try later."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget DescriptionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        controller: _description,
        minLines: 5,
        maxLines: 10,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Description',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        validator: (value) {
          if (value.length == 0)
            return 'Cant leave it empty';
          else if (value.length < 10) return "Need more information";
          return null;
        },
      ),
    );
  }

  Widget PickDate() {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Color(0xFF4bacb8),
      ),
      child: new Builder(
        builder: (context) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: RaisedButton(
                color: Color(0xFF56c8d8),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                elevation: 5.0,
                textColor: Colors.white,
                onPressed: () {
                  _selectDate(context);
                },
                child: Text('Date'),
              ),
            ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: from_date,
      firstDate: DateTime.now().subtract(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (picked != null && picked != from_date) {
      setState(() {
        from_date = picked;
      });
    }
  }

  Widget PickTime() {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Color(0xFF4bacb8),
      ),
      child: new Builder(
        builder: (context) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: RaisedButton(
                color: Color(0xFF56c8d8),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                elevation: 5.0,
                textColor: Colors.white,
                onPressed: () {
                  _selectTime(context);
                },
                child: Text(_time.format(context)),
              ),
            ),
      ),
    );
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      double pick = toDouble(picked);
      double now = toDouble(TimeOfDay.now());
      if (from_date != DateTime.now()) {
        setState(() {
          _time = picked;
        });
      } else if (pick - now >= 1) {
        setState(() {
          _time = picked;
        });
      }
    }
  }

  Widget TopicField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: TextFormField(
        controller: _organiser,
        //new password
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: 'Topic'),
        validator: (value) {
          if (value.length == 0) return 'Cant leave it empty';
          return null;
        },
      ),
    );
  }

  Widget VenueField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: TextFormField(
        controller: _venue,
        //new password
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: 'Venue'),
        validator: (value) {
          if (value.length == 0) return 'Cant leave it empty';
          return null;
        },
      ),
    );
  }

  void AreYouSure() {
    if (this._formKey.currentState.validate() && departments.length > 0) {
      _formKey.currentState.save(); // Save our form now.
      _showComfirmDialog();
    }
  }

  void _showComfirmDialog() {
    // flutter defined function
    // send a new password to the user's email.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Are you sure?"),
          content: new Text(
              "A new meeting will be added, it will notify all the members."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "No",
                style: TextStyle(
                  color: Color(0xFF333333),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text(
                "Yes",
                style: TextStyle(
                  color: Color(0xFF333333),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                AddMeeting();
              },
            ),
          ],
        );
      },
    );
  }

  Widget bottomNavBar() {
    return ScopedModel<MainModel>(
      model: new MainModel(),
      child: ScopedModelDescendant<MainModel>(
        builder: (context, child, model) {
          return Container(
            height: 60,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  color: isLoading ? Colors.grey : Color(0xFF00acc1),
                  onPressed: () {
                    isLoading ? null : AreYouSure();
                  },
                  child: Center(
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AddMeeting() async {
    setState(() {
      isLoading = true;
    });
    String date = from_date.day.toString() +
        '-' +
        from_date.month.toString() +
        '-' +
        from_date.year.toString();
    Map<String, dynamic> meeting = {
      'organiser': _organiser.text,
      'description': _description.text,
      'date': date,
      'time': _time.format(context),
      'location': _venue.text,
      'departments': departments
    };

//    http.Response response = await http.post(
//      link,
//      body: json.encode(meeting),
//      headers: {'Content-Type': 'application/json'},
//    );
    http.Response response = await http
        .get('http://jsonplaceholder.typicode.com/posts?_start=10&_limit=3');

    message = {
      'success': true,
      'message': 'Meeting added successfully',
    };

    setState(() {
      isLoading = false;
    });

    if (message['success'] == true)
      _showSuccessBox();
    else
      _showtrylaterbox();
  }

  double toDouble(TimeOfDay picked) => picked.hour + picked.minute / 60.0;
}
