// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/home.dart';
import 'package:flutter_dbase_mysql/institute_screen.dart';
import 'package:flutter_dbase_mysql/login.dart';
import 'package:flutter_dbase_mysql/savedata.dart';
import 'package:flutter_dbase_mysql/sql_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key}) : super(key : key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: InstituteScreen(),
      home: LoginPage(),
    );
  }
}
