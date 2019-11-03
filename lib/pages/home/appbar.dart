import 'package:flutter/material.dart';

class appbar extends StatelessWidget with PreferredSizeWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  appbar(this._scaffoldKey);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Dash Board'),
      backgroundColor: Color(0xFF18D191),
      elevation: 2.0,

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
