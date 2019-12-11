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
  Map<String, dynamic> user = {
    'username': 'username',
    'password': 'blah',
  };
  bool isloading = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  double size = 50;

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
  void authform(Function authenticate) async {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();

    setState(() {
      isloading = true;
    });
    final Map<String, dynamic> successInformation = await authenticate(
      user['username'],
      user['password'],
    );
    setState(() {
      isloading = false;
    });

    if (!successInformation['success']) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error', style: TextStyle(color: Colors.red),),
            content: Text("Sorry, We could not recognize you. Please contact to the HR department for any guidance."),
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


  @override
  Widget build(BuildContext context) {

    double border_top = MediaQuery.of(context).size.height > 680 ? 30 : 15;
    double border_side = MediaQuery.of(context).size.height > 680 ? 15 : 30;

    return new Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: border_top, left: border_side, right: border_side),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              logo(),
              Title(),
              SizedBox(
                height: 15.0,
              ),
              UsernameField(),
              SizedBox(
                height: 15.0,
              ),
              passwordField(),
              loginButton(),
              Register(),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton(){
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            height: 60,
            decoration: new BoxDecoration(
                color: Color(0xFF00bcd4),
                borderRadius: new BorderRadius.circular(9.0)),
            child: isloading
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
            if(isloading == false) {
              setState(() {
                isloading = true;

              });
              authform(widget.model.authenticate);
            }
          }),
    );
  }

  Widget passwordField (){
    return TextFormField(
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
  }

  Widget UsernameField(){
    return TextFormField(
      initialValue: 'akshay',
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) {
        user['username'] = value;
      },
      validator: (String value) {
        if (value.isEmpty)
          return 'Cant leave it empty.';

      },
      decoration: InputDecoration(
        icon: Padding(
          padding: EdgeInsets.all(7.0),
          child: Icon(
            Icons.email,
            //color: Colors.white,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Username",
      ),
    );
  }

  Widget Register(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _launchURL('http://'+ widget.model.ip + "");
          },
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 18.0, top: 18.0),
            child: new Text("Register ",
                style: new TextStyle(
                    fontSize: 17.0,
                    color: Color(0xFF62efff),
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget Title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
          child: Text(
            "BlueTech",
            style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 30.0),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: size,
                        width: size,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(size),
                          ),
                        ),
                      ),
                      Container(
                        height: size,
                        width: size,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(size * 0.1),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: size,
                        width: size,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(size),
                          ),
                        ),
                      ),
                      Container(
                        height: size,
                        width: size,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(size),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Positioned(
                top: size * 0.6,
                left: size * 0.6,
                child: Container(
                  height: size * 0.8,
                  width: size * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(size * 0.4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



//older scaffold


//    return new Scaffold(
//      body: ScopedModelDescendant<MainModel>(
//        builder: (BuildContext context, Widget child, MainModel model) {
//          print('login body');
//          return model.isLoading
//              ? Center(
//                  child: Text('Flash Screen'),
//                )
//              : Padding(
//                  padding: EdgeInsets.only(
//                      top: border_top, left: border_side, right: border_side),
//                  child: Form(
//                    key: _formkey,
//                    child: ListView(
//                      children: <Widget>[
//                        logo(),
//                        Title(),
//                        SizedBox(
//                          height: 15.0,
//                        ),
//                        emailField(),
//                        SizedBox(
//                          height: 15.0,
//                        ),
//                        passwordField(),
//                        loginButton(),
//                        Register(),
//                      ],
//                    ),
//                  ),
//                );
//        },
//      ),
//    );

