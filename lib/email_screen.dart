// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/editdata.dart';
import 'package:flutter_dbase_mysql/sidebar.dart';
import 'package:http/http.dart' as http;

class EmailScreen extends StatefulWidget {
  const EmailScreen({
    Key? key,
    required this.instcode,
    required this.deptcode,
  }) : super(key: key);

  final String instcode, deptcode;

  @override
  State<EmailScreen> createState() => EmailScreenState();
}

class EmailScreenState extends State<EmailScreen> {
  List list = [];
  late int idx;

  // final data = Data(username: "", email: "", password: "", fullname: "");

  Future readData() async {
    try {
      var apiEndpoint = "http://localhost:8080/dbase/get_emails.php";
      // var res = await http.get(apiEndpoint as Uri, headers: {"Accept:": "appliication/json"});

      final Uri url = Uri.parse(apiEndpoint);
      http.Response response = await http.post(url, body: {
        'inst_code': widget.instcode.toString(),
        'dept_code': widget.deptcode.toString(),
      });

      if (response.statusCode == 200) {
        var data1 = utf8.decode(response.bodyBytes);
        var jsonData = jsonDecode(data1);
        setState(() {
          list = jsonData;
        });
      } else {
        print("No Data Found!");
      }
    } catch (e) {
      print(e);
    }
  }

  // deleteData() {
  //   var url = "http://localhost:8080/dbase/deletedata.php";
  //   http.post(Uri.parse(url), body: {'id': idx});
  //   print(idx);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          title: Text("NRC Sys App"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ],
        ),
       
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (ctx, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 120,
                  alignment: Alignment.centerLeft,
                  color: Colors.blue[100],
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(list[i]['inst_code']),
                        // Text(
                        //   list[i]['dept_code'],
                        //   style: TextStyle(color: Colors.green[900]),
                        // ),
                        Text(
                          list[i]['dept_name'],
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        Text(
                          list[i]['emp_name'],
                          style: TextStyle(color: Colors.yellow[900]),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      list[i]['email'],
                      style: TextStyle(color: Colors.green[900]),
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      child: Text(list[i]['email']
                          .toString()
                          .substring(0, 2)
                          .toUpperCase()),
                    ),
                    trailing: Container(
                      //color: Colors.amber,
                      width: 80,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) => Editdata(
                                        id: list[i]['id'],
                                        username: list[i]['username'],
                                        password: list[i]['password'],
                                        email: list[i]['email'],
                                        fullname: list[i]['fullname'])),
                              );
                            },
                            icon: Icon(Icons.edit),
                            color: Colors.green,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                var url =
                                    "http://localhost:8080/dbase/deletedata.php";
                                http.post(Uri.parse(url), body: {
                                  'id': list[i]['id'],
                                });

                                readData();
                              });
                            },
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
