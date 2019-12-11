import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'package:string_validator/string_validator.dart';
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';

class ChangePasswordPage extends StatefulWidget {
  final MainModel model;

  ChangePasswordPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return ChangePasswordPageState();
  }
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  Widget Notebook() {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(3, 1))
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        padding: EdgeInsets.only(right: 10),
        width: width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: width * 0.8,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 15, left: 10),
                    child: Text(
                      '1.    1 Capital Letter',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'UbuntuMono',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 33,
                  child: Container(
                    width: 1,
                    height: 48,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  top: 24,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: cap ? width * 0.8 : 0,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(2),
                        right: Radius.circular(2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              color: Colors.blue.withOpacity(0.5),
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: width * 0.8,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10, left: 10),
                    child: Text(
                      '2.    1 Symbol',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'UbuntuMono',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 33,
                  child: Container(
                    width: 1,
                    height: 48,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  top: 20,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: sym ? width * 0.8 : 0,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(2),
                        right: Radius.circular(2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              color: Colors.blue.withOpacity(0.5),
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: width * 0.8,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10, left: 10),
                    child: Text(
                      '3.    1 Number',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'UbuntuMono',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 33,
                  child: Container(
                    width: 1,
                    height: 48,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  top: 20,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: num ? width * 0.8 : 0,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(2),
                        right: Radius.circular(2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              color: Colors.blue.withOpacity(0.5),
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: width * 0.8,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15, top: 10, left: 10),
                    child: Text(
                      '4.    8 characters',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'UbuntuMono',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 33,
                  child: Container(
                    width: 1,
                    height: 48,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  top: 20,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: len ? width * 0.8 : 0,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(2),
                        right: Radius.circular(2),
                      ),
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

  Map<String, dynamic> message;

  void submit() async {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.
      print('previous password: ' + prev_password.text);
      print('new password: ' + _controller1.text);

      message = await widget.model
          .PasswordChange(prev_password.text, _controller1.text);
      if (message['success'] == false) {
        _showfailDialog();
      } else {
        _showsuccessDialog();
      }
    }
  }

  TextEditingController _controller1 = TextEditingController();
  TextEditingController prev_password = TextEditingController();

  @override
  bool cap = false, sym = false, num = false, len = false;

  void initState() {
    _controller1.addListener(() {
      setState(() {
        len = _controller1.text.length >= 8;
        num = _controller1.text.contains(RegExp(r'\d'), 0);
        cap = _controller1.text.contains(new RegExp(r'[A-Z]'), 0);
        sym = _controller1.text.isNotEmpty &&
            !_controller1.text
                .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'), 0);
      });
    });
    super.initState();
  }

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Change Password'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  //new password
                  controller: prev_password,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(hintText: 'Old Password'),
                  validator: (value) {
                    if (value.length == 0) return "Can't leave it empty";
                    return null;
                  },
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Notebook(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  //new password
                  controller: _controller1,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(hintText: 'New Password'),
                  validator: (value) {
                    if (value.length == 0)
                      return 'Cant leave it empty';
                    else if (!(num & len & sym & cap))
                      return 'Password couldn\'t satisfy all the conditions mentioned above';
                    return null;
                  },
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  //new password
                  keyboardType: TextInputType.text,
                  controller: _controller1,
                  decoration: InputDecoration(hintText: 'Retype Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value.length == 0)
                      return 'Cant leave it empty';
                    else if (value != _controller1.text)
                      return 'Passwords dont match';
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: FlatButton(
                  onPressed: () {
                    widget.model.isLoading ? null : showPasswordSentDialog();
                  },
                  child: Text(
                    'Forget Password',
                    style: TextStyle(
                      color: widget.model.isLoading
                          ? Colors.lightGreen
                          : Color(0xFF006978),
                      fontSize: 18,
                      fontFamily: 'UbuntuMono',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ScopedModel<MainModel>(
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
                      color: Color(0xFF00acc1),
                      onPressed: () {
                        model.isLoading ? null : submit();
                      },
                      child: Center(
                        child: model.isLoading
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
        ),
      ),
    );
  }

  void showPasswordSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Password Sent"),
          content: new Text("Your new password has been sent to your email."),
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

  void _showfailDialog() {
    // flutter defined function
    // send a new password to the user's email.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Incorrect Previous Password"),
          content: new Text(
              "The typed Password did not matched with the password in our database. \n Please click on to the forget password button incase you have forgotten."),
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

  void _showsuccessDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Password Updated"),
          content: new Text("Password updated successfully."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
