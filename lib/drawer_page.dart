
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
            child: Text('カップルゲーム') ,
        ),
        ListTile(
          title: Text('Item 1'),
        ),
        ListTile(
          title: Text('Item 2'),
        ),
        ListTile(
          title: Text('Item 3'),
        ),
        ListTile(
          title: Text('Item 4'),
        ),
        ListTile(
          title: Text('Item 5'),
        ),
      ],
    );
  }
}