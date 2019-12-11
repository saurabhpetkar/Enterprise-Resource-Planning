import 'package:flutter/material.dart';

class Handcrafted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Handcrafted with '),
          Icon(
            Icons.favorite,
            color: Colors.pink,
          ),
          Text(' in India.'),
        ],
      ),
    );
  }
}