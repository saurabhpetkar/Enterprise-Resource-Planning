import 'package:flutter/material.dart';
import 'package:path/path.dart';

Widget drawer(BuildContext context, Function logout) {
  final name = ModalRoute.of(context).settings.name;
  return Drawer(
    child: ListView(
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
          selected: name == '/' ? true: false,
          title: Text(
            'Home',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.list),
          onTap: () {
            Navigator.pop(context);
            if(name != "/")
              Navigator.pushNamed(context, '/');
          },
        ),
        ListTile(
          selected: name == '/about' ? true: false,

          title: Text(
            'About',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.list),
          onTap: () {
            Navigator.pop(context);
            if(name != "/about")
              Navigator.pushNamed(context, '/about');
          },
        ),
        ListTile(
          selected: name == '/sales' ? true: false,
          title: Text(
            'Sales',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.list),
          onTap: () {
            Navigator.pop(context);
            if(name != "/sales")
              Navigator.pushNamed(context, '/sales');
          },
        ),

        //down: iff the person is HR
        ListTile(
          selected: name == '/hr' ? true: false,
          title: Text(
            'HR',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.list),
          onTap: () {
            Navigator.pop(context);
            if(name != "/hr")
              Navigator.pushNamed(context, '/hr');
          },
        ),
        ListTile(
          selected: name == '/finance' ? true: false,
          title: Text(
            'Finance',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.list),
          onTap: () {
            Navigator.pop(context);
            if(name != "/finance")
              Navigator.pushNamed(context, '/finance');
          },
        ),
        ListTile(
          title: Text(
            'Privacy and Policy',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.list),
          onTap: () {
            Navigator.pop(context);
            if(name != "/privacy-policy")
              Navigator.pushNamed(context, '/privacy-policy');
          },
        ),
        Divider(),
        ListTile(
          selected: name == '/profile' ? true: false,
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          leading: Icon(Icons.info),
          onTap: () {
            Navigator.pop(context);
            if(name != "/profile")
              Navigator.pushNamed(context, '/profile');
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
