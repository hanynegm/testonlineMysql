// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, must_be_immutable

import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dbase_mysql/sql_home.dart';
import 'package:http/http.dart' as http;
//import 'package:inputtext/convert.dart';

class Editdata extends StatefulWidget {
  const Editdata({
    Key? key,
    required this.id,
    required this.fullname,
    required this.username,
    required this.password,
    required this.email,
  }) : super(key: key);

  final String id, fullname, username, password, email;

  @override
  State<Editdata> createState() => _EditdataState();
}

class _EditdataState extends State<Editdata> {
  TextEditingController tecid = TextEditingController();
  TextEditingController tecfullname = TextEditingController();
  TextEditingController tecusername = TextEditingController();
  TextEditingController tecpassword = TextEditingController();
  TextEditingController tecemail = TextEditingController();
  late final Int idx;

  editData() {
    var url = "http://localhost:8080/dbase/editdata.php";
    http.post(Uri.parse(url), body: {
      'id': tecid.text,
      'fullname': tecfullname.text,
      'username': tecusername.text,
      'password': tecpassword.text,
      'email': tecemail.text,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tecid.text = widget.id;
    tecfullname.text = widget.fullname;
    tecusername.text = widget.username;
    tecpassword.text = widget.password;
    tecemail.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NRC Sys App"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Text('fullname: ${widget.fullname}'),
            // Text('username: ${widget.username}'),
            // Text('password: ${widget.password}'),
            // Text('email: ${widget.email}'),
            SizedBox(height: 10),

            Container(
              height: 45,
              child: TextFormField(
                  controller: tecid,
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Id',
                  )),
            ),

            SizedBox(height: 10),

            Container(
              height: 45,
              child: TextFormField(
                  controller: tecfullname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  )),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              child: TextFormField(
                  controller: tecusername,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  )),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              child: TextFormField(
                  controller: tecpassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  )),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              child: TextFormField(
                  controller: tecemail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  )),
            ),
            SizedBox(height: 10),
            Container(
              //color: Colors.amber,
              child: Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      // print(id);
                      //print(idx);
                      print(tecfullname.text);
                      print(tecusername.text);
                      print(tecpassword.text);
                      print(tecemail.text);
                      editData();
                    },
                    color: Color.fromARGB(255, 31, 103, 131),
                    textColor: Colors.white,
                    minWidth: 100,
                    child: Text("Edit data"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
