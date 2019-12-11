import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../scoped_models/main.dart';

Widget drawer(BuildContext context, Function logout, MainModel model) {
  final name = ModalRoute.of(context).settings.name;
  return Drawer(
    child: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 5, left: 10),
          child: Text(
              model.authenticatedUser.username == null ? "" : model.authenticatedUser.username,
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 10, left: 10),
          child: Text(
            model.authenticatedUser.email == null ? "" : model.authenticatedUser.email,
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
        ),
        Divider(),

        ListTile(
          selected: name == '/' ? true : false,
          title: Text(
            'Home',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.home),
          onTap: () {
            Navigator.pop(context);
//            if (name != "/") Navigator.pushNamed(context, '/');
              if(name != '/') Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),

        ListTile(
          selected: name == '/sales' ? true : false,
          title: Text(
            'Sales',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.supervisor_account),
          onTap: () {
            Navigator.pop(context);
            if (name != "/sales") Navigator.pushNamed(context, '/sales');
          },
        ),


        ListTile(
          selected: name == '/meeting-list' ? true : false,
          title: Text(
            'Meeting List',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.view_list),
          onTap: () {
            Navigator.pop(context);
            if (name != '/meeting-list')
              Navigator.pushNamed(context, '/meeting-list');
          },
        ),
        ListTile(
          selected: name == '/company-list' ? true : false,
          title: Text(
            'Customer Companies',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.view_list),
          onTap: () {
            Navigator.pop(context);
            if (name != '/company-list')
              Navigator.pushNamed(context, '/company-list');
          },
        ),
        //down: iff the person is HR
        ListTile(
          selected: name == '/hr' ? true : false,
          title: Text(
            'HR',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.thumbs_up_down),
          onTap: () {
            Navigator.pop(context);
            if (name != "/hr") Navigator.pushNamed(context, '/hr');
          },
        ),
        ListTile(
          selected: name == '/finance' ? true : false,
          title: Text(
            'Finance',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.attach_money),
          onTap: () {
            Navigator.pop(context);
            if (name != "/finance") Navigator.pushNamed(context, '/finance');
          },
        ),
        ListTile(
          selected: name == '/training' ? true : false,
          title: Text(
            'Training',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.work),
          onTap: () {
            Navigator.pop(context);
            if (name != "/training") Navigator.pushNamed(context, '/training');
          },
        ),
        ListTile(
          selected: name == '/complain-list' ? true : false,
          title: Text(
            'Complains',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.work),
          onTap: () {
            Navigator.pop(context);
            if (name != "/complain-list") Navigator.pushNamed(context, '/complain-list');
          },
        ),






        Divider(),

        ListTile(
          selected: name == '/add-product' ? true : false,
          title: Text(
            'Add Product',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.add_shopping_cart),
          onTap: () {
            Navigator.pop(context);
            if (name != "/add-product")
              Navigator.pushNamed(context, '/add-product');
          },
        ),
        ListTile(
          selected: name == '/add-meeting' ? true : false,
          title: Text(
            'Add Meeting',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.group_add),
          onTap: () {
            Navigator.pop(context);
            if (name != "/add-meeting")
              Navigator.pushNamed(context, '/add-meeting');
          },
        ),
        ListTile(
          selected: name == '/complain-box' ? true : false,
          title: Text(
            'Complain Box',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.work),
          onTap: () {
            Navigator.pop(context);
            if (name != "/complain-box") Navigator.pushNamed(context, '/complain-box');
          },
        ),











        Divider(),

        ListTile(
          title: Text(
            'Privacy and Policy',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.fingerprint),
          onTap: () {
            Navigator.pop(context);
            if (name != "/privacy-policy")
              Navigator.pushNamed(context, '/privacy-policy');
          },
        ),
        ListTile(
          selected: name == '/about' ? true : false,
          title: Text(
            'About',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.account_balance),
          onTap: () {
            Navigator.pop(context);
            if (name != "/about") Navigator.pushNamed(context, '/about');
          },
        ),
        Divider(),
        ListTile(
          selected: name == '/profile' ? true : false,
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.person),
          onTap: () {
            Navigator.pop(context);
            if (name != "/profile") Navigator.pushNamed(context, '/profile');
          },
        ),

        ListTile(
          title: Text(
            'Logout',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.arrow_downward),
          onTap: () {
            Navigator.pop(context);
            logout();
          },
        ),
        Divider(
          color: Colors.black38,
        ),
      ],
    ),
  );
}
