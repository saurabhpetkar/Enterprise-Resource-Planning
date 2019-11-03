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
        title: Text('About WealthSuite'),
        backgroundColor: Color(0xFF18D191),
        elevation: 2.0,
      ),
      drawer: drawer(context, widget.model.logout),
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              Positioned(
                child: CircularProgressIndicator(),
                top: 100,
              ),
              Center(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image:
                      'https://shawglobalnews.files.wordpress.com/2019/02/dragon-aurora.jpg',
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
              "About WealthSuite",
              style: heading_style,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'some random content ' * 10,
              style: content_style,
            ),
          ),
        ],
      ),
    );
  }
}
