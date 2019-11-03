import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../scoped_models/main.dart';

class LoginPage extends StatefulWidget {
  final MainModel model;

  LoginPage(this.model);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  Future _launchURL(String url) async {
    await launch(url, forceSafariVC: true, forceWebView: true);
    if (await canLaunch(url)) {
      launch(
        url,
        forceWebView: false,
      );
    } else {
      print('cant launch ${url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> user = {
      'email': 'email',
      'password': 'blah',
    };
    double border_top = MediaQuery.of(context).size.height > 680 ? 30 : 15;
    double border_side = MediaQuery.of(context).size.height > 680 ? 15 : 30;

    void authform(Function authenticate) async {
      if (!_formkey.currentState.validate()) {
        return;
      }
      _formkey.currentState.save();

      final Map<String, dynamic> successInformation = await authenticate(
        user['email'],
        user['password'],
      );

      if (!successInformation['success']) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(successInformation['message']),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      }
    }

    final emailField = TextFormField(
      initialValue: 'sss@s.com',
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) {
        user['email'] = value;
      },
      validator: (String value) {
        if (value.isEmpty)
          return 'Cant leave it empty.';
        else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          //its an email
        } else
          return 'It has to be a valid email id';
      },
      decoration: InputDecoration(
        //focusedBorder:
        //UnderlineInputBorder(borderSide: BorderSide(color: Colors.white),

        icon: Padding(
          padding: EdgeInsets.all(7.0),
          child: Icon(
            Icons.email,
            //color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
//        border:
//        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
//        border:
//        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    );

    final passwordField = TextFormField(
      obscureText: true,
      initialValue: 'sss',
      keyboardType: TextInputType.text,
      autofocus: false,
      onSaved: (String value) {
        user['password'] = value;
      },
      validator: (String value) {
        if (value.isEmpty) return 'Cant leave it empty.';
      },
      decoration: InputDecoration(
        icon: Padding(
          padding: EdgeInsets.all(7.0),
          child: Icon(
            Icons.lock,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
      ),
    );

    final loginButton = ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                height: 60,
                decoration: new BoxDecoration(
                    color: Color(0xFF18D191),
                    borderRadius: new BorderRadius.circular(9.0)),
                child: model.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
              ),
              onTap: () {
                authform(model.authenticate);
              }),
        );
      },
    );

    return new Scaffold(

      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return model.isLoading
              ? Center(
                  child: Text(''),
                )
              : Padding(
                  padding: EdgeInsets.only(
                      top: border_top, left: border_side, right: border_side),
                  child: Form(
                    key: _formkey,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 130.0,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 80.0),
                              child: new Text(
                                "BlueTech",
                                style: new TextStyle(fontSize: 30.0),
                              ),
                            )
                          ],
                        ),
                        new SizedBox(
                          height: 15.0,
                        ),
                        emailField,
                        new SizedBox(
                          height: 15.0,
                        ),
                        passwordField,
                        loginButton,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _launchURL('https://www.google.com/');
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 18.0, top: 18.0),
                                child: new Text("Register ",
                                    style: new TextStyle(
                                        fontSize: 17.0,
                                        color: Color(0xFF18D191),
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
