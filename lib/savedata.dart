// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Savedata extends StatefulWidget {
  const Savedata({super.key});

  @override
  State<Savedata> createState() => _SavedataState();
}

class _SavedataState extends State<Savedata> {
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  addData() {
    var url = "http://localhost:8080/dbase/insertdata.php";
    http.post(Uri.parse(url), body: {
      'fullname': fullname.text,
      'username': username.text,
      'password': password.text,
      'email': email.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 45,
              child: TextFormField(
                  controller: fullname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                  )),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  )),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  )),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              child: TextFormField(
                  controller: email,
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
                      //print(fullname.text);
                      // print(username.text);
                      // print(password.text);
                      // print(email.text);
                      addData();
                    },
                    color: Color.fromARGB(255, 31, 103, 131),
                    textColor: Colors.white,
                    minWidth: 100,
                    child: Text("Save user"),
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
