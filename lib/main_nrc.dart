// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/sidebar.dart';

class MainNrc extends StatelessWidget {
  const MainNrc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text("NRC System App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text("National Research Center"),
            SizedBox(
              height: 15,
            ),
            Image.network(
              'http://learnflutter.orgfree.com/images/NRC_11.jpg',
              width: 350,
              height: 350,
              // fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
