import 'package:flutter/material.dart';
import '../../scoped_models/main.dart';
import 'change-password.dart';

class ProfilePage extends StatefulWidget {
  final MainModel model;

  ProfilePage(this.model);

  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Profile'),
        ),
        body: widget.model.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Page(),
        bottomNavigationBar: Container(
          height: 60,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ButtonTheme(
              minWidth: double.infinity,
              child: RaisedButton(
                color: Color(0xFF00acc1),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangePasswordPage(widget.model)),
                  );
                },
                child: Center(
                  child: Text('Change Password', style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Page() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  'Name',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Color(0xFF333333)),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text('Saurabh S Petkar', style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600,
                  fontFamily: 'UbuntuMono', color: Color(0xFF333333),
                ),),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  'Post',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Color(0xFF333333)),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text('Project Manager, Bangalore', style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600,
                  fontFamily: 'UbuntuMono', color: Color(0xFF333333)
                ),),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  'Joined',
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500, color: Color(0xFF333333)),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text('10 Dec, 2018',style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600,
                  fontFamily: 'UbuntuMono', color: Color(0xFF333333)
                ),),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  'Last Post',
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500, color: Color(0xFF333333)),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text('Assistant Project Manager, Bangalore', style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600,
                  fontFamily: 'UbuntuMono', color: Color(0xFF333333)
                ),),
              )
            ],
          ),
        ),

      ],
    );
  }
}
