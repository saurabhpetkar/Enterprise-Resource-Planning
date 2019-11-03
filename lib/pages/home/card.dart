import 'package:flutter/material.dart';
import '../style.dart';

class card extends StatelessWidget {
  final Map<String, dynamic> info;

  card(this.info);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 120,
          padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Colors.blue,
                Colors.blue[400],
                Colors.blue[300],
                Colors.blue[200],
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.lightBlueAccent,
            boxShadow: [
              BoxShadow(
                  offset: Offset(1, 1), blurRadius: 10, color: Colors.black26),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 110,
                child: Column(
                  children: <Widget>[
                    Icon(
                      info['icon'],
                      color: Colors.white,
                      size: 80,
                    ),
                    Text(
                      info['heading'],
                      style: home_heading,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Stack(
                  children: <Widget>[
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                    Positioned(
                      left: 14,
                      child: Container(
                        height: 16,
                        width: 16,
                        child: Center(
                          child: Text(info['notifications'] < 10 ?  info['notifications'].toString():
                            '9+',
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
