import 'package:flutter/material.dart';
import '../style.dart';

class card extends StatelessWidget {
  final List<Map<String, dynamic>> info;

  card(this.info);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: 8, bottom: 4, left: 8, right: 4),
                height: 150,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/finance');
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(1, 1),
                            blurRadius: 5),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: Icon(
                                  Icons.attach_money,
                                  size: 80,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Stack(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.notifications,
                                          size: 25,
                                        ),
                                        onPressed: () {},
                                      ),
                                      Positioned(
                                        top: 7,
                                        right: 7,
                                        child: Container(
                                          width: 13,
                                          height: 13,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.pink),
                                          child: Center(
                                            child: Text(
                                              '9+',
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                bottom: 4.0, left: 5, right: 2),
                            child: Center(
                              child: Text('Finance'),
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: 8, bottom: 4, left: 4, right: 8),
                height: 150,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/sales');
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(1, 1),
                            blurRadius: 5),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: Icon(
                                  Icons.supervisor_account,
                                  size: 80,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Stack(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.notifications,
                                          size: 25,
                                        ),
                                        onPressed: () {},
                                      ),
                                      Positioned(
                                        top: 7,
                                        right: 7,
                                        child: Container(
                                          width: 13,
                                          height: 13,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.pink),
                                          child: Center(
                                            child: Text(
                                              '9+',
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                bottom: 4.0, left: 5, right: 2),
                            child: Center(
                              child: Text('Sales'),
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: 4, bottom: 8, left: 8, right: 4),
                height: 150,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/hr');
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(1, 1),
                            blurRadius: 5),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: Icon(
                                  Icons.thumbs_up_down,
                                  size: 70,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Stack(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.notifications,
                                          size: 25,
                                        ),
                                        onPressed: () {},
                                      ),
                                      Positioned(
                                        top: 7,
                                        right: 7,
                                        child: Container(
                                          width: 13,
                                          height: 13,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.pink),
                                          child: Center(
                                            child: Text(
                                              '9+',
                                              style: TextStyle(
                                                  color: Colors.white, fontSize: 8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                bottom: 4.0, left: 5, right: 2),
                            child: Center(
                              child: Text('HR'),
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    top: 4, bottom: 8, left: 4, right: 8),
                height: 150,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/product-list');
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(1, 1),
                            blurRadius: 5),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: Icon(
                                  Icons.palette,
                                  size: 80,
                                ),
                              ),
//                              Positioned(
//                                top: 0,
//                                right: 0,
//                                child: Container(
//                                  width: 40,
//                                  height: 40,
//                                  child: Stack(
//                                    children: <Widget>[
//                                      IconButton(
//                                        icon: Icon(
//                                          Icons.notifications,
//                                          size: 25,
//                                        ),
//                                        onPressed: () {},
//                                      ),
//                                      Positioned(
//                                        top: 7,
//                                        right: 7,
//                                        child: Container(
//                                          width: 13,
//                                          height: 13,
//                                          decoration: BoxDecoration(
//                                              shape: BoxShape.circle,
//                                              color: Colors.pink),
//                                          child: Center(
//                                            child: Text(
//                                              '9+',
//                                              style: TextStyle(
//                                                  color: Colors.white, fontSize: 8),
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
                            ],
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                bottom: 4.0, left: 5, right: 2),
                            child: Center(
                              child: Text('Products'),
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }
}
