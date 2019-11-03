import 'package:flutter/material.dart';

Widget pagedrawer(BuildContext context, Function logout,
    PageController controller) {
  final name = ModalRoute
      .of(context)
      .settings
      .name;
  return Drawer(
      child: PageView(

        controller: controller,
        children: <Widget>[
          Page0(context, logout, controller),
          Page1(context, controller),
        ],
      )
  );
}

Widget Page1(BuildContext context, PageController controller) {
  return Container(
    color: Colors.greenAccent,
    child: Center(
      child: RaisedButton(
        color: Colors.grey,
        onPressed: () {
          controller.jumpToPage(0);
        },
        child: Text('go to page 0'),
      ),
    ),
  );
}

Widget Page2(BuildContext context, PageController controller) {
  return Container(
    color: Colors.yellow,
    child: Center(
      child: RaisedButton(
        color: Colors.blue,
        onPressed: () {
          controller.jumpToPage(0);
        },
        child: Text('go to page 0'),
      ),
    ),
  );
}

Widget Page0(BuildContext context, Function logout, PageController controller) {
  return Column(
    children: <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text(
          'logged in username',
          style: TextStyle(color: Colors.white),
        ),
        accountEmail:
        Text('logged in email', style: TextStyle(color: Colors.white)),
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://cdn.pixabay.com/photo/2016/08/17/21/12/people-1601516_960_720.jpg"),
          ),
        ),
      ),

      ListTile(
        title: Text(
          'go to page 1',
          style: TextStyle(fontSize: 16, color: Colors.blueGrey),
        ),
        leading: Icon(Icons.arrow_downward),
        onTap: () {
          controller.jumpToPage(1);
        },
      ),
      ListTile(
        title: Text(
          'go to page 2',
          style: TextStyle(fontSize: 16, color: Colors.blueGrey),
        ),
        leading: Icon(Icons.arrow_downward),
        onTap: () {
          controller.jumpToPage(2);
        },
      ),
      Divider(
        color: Colors.black38,
      ),
    ],
  );

}