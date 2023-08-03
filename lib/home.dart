// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List list = [];
  Future readData() async {
    
    var apiEndpoint = "http://learnflutter.orgfree.com/conemail.php";
    // var res = await http.get(theUrl as Uri, headers: {"Accept:": "appliication/json"});

    final Uri url = Uri.parse(apiEndpoint);
    http.Response response = await http.get(url);
    var data1 = utf8.decode(response.bodyBytes);
    var jsonData = jsonDecode(data1);
    //return jsonData;
    setState(() {
      list = jsonData;
    });

    // print(list);
  }

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
                          list[i]['name'],
                          style: TextStyle(color: Colors.green[900]),
                        ),
                        Text(
                          list[i]['institute'],
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                        Text(
                          list[i]['department'],
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
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                            color: Colors.green,
                          ),
                          IconButton(
                            onPressed: () {},
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
