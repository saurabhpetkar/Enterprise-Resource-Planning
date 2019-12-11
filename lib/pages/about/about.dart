import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import './style.dart';
import '../../scoped_models/main.dart';
import '../../global_widgets/drawer.dart';

class AboutPage extends StatefulWidget {
  final MainModel model;

  AboutPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _AboutPageState();
  }
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About BlueTech'),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 2.0,
      ),
      drawer: drawer(context, widget.model.logout, widget.model),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
              "About BlueTech",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: content_style,
            ),
          ),
        ],
      ),
    );
  }
}
