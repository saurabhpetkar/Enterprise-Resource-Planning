import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../global_widgets/drawer.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../scoped_models/main.dart';
import 'dart:convert';

class ComplainBoxPage extends StatefulWidget {
  final MainModel model;

  ComplainBoxPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return ComplainBoxPageState();
  }
}

class ComplainBoxPageState extends State<ComplainBoxPage> {
  bool isloading = false;
  TextEditingController _against = TextEditingController();
  TextEditingController _description = TextEditingController();
  int limit = 50;
  var message = Text('50 characters needed');

  @override
  void initState() {
    super.initState();

    _description.addListener(() {
      if (_description.text.length < 10) {
        message = Text(
          (10 - _description.text.length).toString() +
              " characters still needed",
          style: TextStyle(color: Colors.red),
        );
      } else {
        message = Text(
          "Good to go",
          style: TextStyle(color: Colors.green),
        );
      }
      setState(() {});
    });
  }

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Complain Box'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 100,
                  child: Image.asset("assets/images/complain.png"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              against(),
              SizedBox(
                height: 10,
              ),
              DescriptionField(),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                child: message,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ButtonTheme(
                  minWidth: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.cyan,
                    onPressed: isloading == false ? AreYouSure : null,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: isloading ? Colors.black : Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void AreYouSure() {
    if (this._formKey.currentState.validate()) {
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
          content: new Text("A new complain will be added to the database."),
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
                submit();
              },
            ),
          ],
        );
      },
    );
  }

  void submit() async {
    Map<String, dynamic> complain = {
      'against': _against.text,
      'description': _description.text,
      'complainer': widget.model.authenticatedUser.username,
    };
    print(widget.model.authenticatedUser.username);
    print(widget.model.ip);

    String link = 'http://' + widget.model.ip + '/sales/restproduct/';
    setState(() {
      isloading = true;
    });
    http.Response response = await http.post(
      link,
      body: json.encode(complain),
      headers: {'Content-Type': 'application/json'},
    );
    print('status \n\n');
//    var data = json.decode(response.body);
    print(response.body);
    setState(() {
      isloading = false;
    });
    if (response.body.toString() == "true")
      _showSuccessBox();
    else
      _showtrylaterbox();
  }

  void _showSuccessBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Complin Added"),
          content: new Text("Complain added successfully"),
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
          content: new Text("Couldn't add the complain, please try later."),
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

  Widget against() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        controller: _against,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: 'Against'),
        validator: (value) {
          if (value.length == 0) return "Can't leave it empty";
          return null;
        },
      ),
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
          focusColor: Colors.lightGreenAccent,
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
}
