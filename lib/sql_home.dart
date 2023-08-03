// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/editdata.dart';
import 'package:http/http.dart' as http;

class Sqlhome extends StatefulWidget {
  const Sqlhome({Key? key}) : super(key: key);

  get id => null;

  @override
  State<Sqlhome> createState() => SqlhomeState();
}

class SqlhomeState extends State<Sqlhome> {
  List list = [];
  late String idx;

  // final data = Data(username: "", email: "", password: "", fullname: "");

  Future readData() async {
     var apiEndpoint = "http://localhost:8080/dbase/showdata.php";
    // var res = await http.get(apiEndpoint as Uri, headers: {"Accept:": "appliication/json"});

    final Uri url = Uri.parse(apiEndpoint);
     http.Response response = await http.get(url);
     var data1 = utf8.decode(response.bodyBytes);
     var jsonData = jsonDecode(data1);

    // final response = await http.get(res);
       
    // var data1 = utf8.decode(response.bodyBytes);
    // var jsonData = jsonDecode(data1);
//return json.decode(response.body);

    //return jsonData;
    setState(() {
      list = jsonData;
    });

    // print(list);
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
        appBar: AppBar(
          title: Text("NRC Sys App"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          ],
        ),
        drawer: Drawer(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text("login"),
              Text("logOut"),
            ],
          ),
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
                        Text(list[i]['id']),
                        Text(
                          list[i]['fullname'],
                          style: TextStyle(color: Colors.green[900]),
                        ),
                        Text(
                          list[i]['username'],
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        Text(
                          list[i]['password'],
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
