// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, unused_local_variable, non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/editdata.dart';
import 'package:flutter_dbase_mysql/sidebar.dart';
import 'package:http/http.dart' as http;

class DeptScreen extends StatefulWidget {
  const DeptScreen({
    Key? key,
    required this.id,
    required this.dept_code,
  }) : super(key: key);

  final String id, dept_code;

  @override
  State<DeptScreen> createState() => DeptScreenState();
}

class DeptScreenState extends State<DeptScreen> {
  List list = [];
  late String idx;
//Dio dio = Dio();
  // final data = Data(username: "", email: "", password: "", fullname: "");

  Future getDepts() async {
    try {
      var apiEndpoint = "http://10.101.1.10/dbase/get_depts.php";
      final Uri url = Uri.parse(apiEndpoint);
      http.Response response = await http.post(url, body: {
        'id': idx.toString(),
        'dept_code': widget.dept_code.toString(),
      });

      // http.Response response =
      //  await dio.get(url, data: {'id': idx.toString()});

      print(idx);
      if (response.statusCode == 200) {
        var data1 = utf8.decode(response.bodyBytes);
        var jsonData = jsonDecode(data1);

        setState(() {
          list = jsonData;
        });
      } else {
        print('no data');
      }

      //return jsonData;

      // ignore: avoid_print
      print(list);
    } catch (e) {
      print(e);
    }
  }

  // try {

  //   print(idx);

  //   //return jsonData;
  // } catch (e) {
  //   print(e);
  // }

  // deleteData() {
  //   var url = "http://localhost:8080/dbase/deletedata.php";
  //   http.post(Uri.parse(url), body: {'id': idx});
  //   print(idx);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idx = widget.id;
    // print(idx);
    getDepts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text("NRC System App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
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
                      Text(list[i]['institute_code']),
                      Text(
                        list[i]['dept_code'],
                        style: TextStyle(color: Colors.green[900]),
                      ),
                      Text(
                        list[i]['dept_name'],
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    radius: 20,
                    child: Text(list[i]['dept_name']
                        .toString()
                        .substring(0, 2)
                        .toUpperCase()),
                  ),
                  trailing: Container(
                    //color: Colors.amber,
                    width: 70,
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
                          icon: Icon(Icons.email),
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
