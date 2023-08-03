// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/dept_screen.dart';
import 'package:flutter_dbase_mysql/email_screen.dart';
import 'package:flutter_dbase_mysql/sidebar.dart';
import 'package:http/http.dart' as http;

class InstituteScreen extends StatefulWidget {
  const InstituteScreen({super.key});

  @override
  State<InstituteScreen> createState() => _InstituteScreenState();
}

class _InstituteScreenState extends State<InstituteScreen> {
  String? selectedName;
  List list = [];
  List listDept = [];
  Future getInstitute() async {
    var apiEndpoint = "http://learnflutter.orgfree.com/get_institute.php";
    // var res = await http.get(theUrl as Uri, headers: {"Accept:": "appliication/json"});
    final Uri url = Uri.parse(apiEndpoint);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data1 = utf8.decode(response.bodyBytes);
      var jsonData = jsonDecode(data1);
      //return jsonData;
      setState(() {
        list = jsonData;
      });
    } else {
      print('No Data Found');
    }
  }

  //  show dept for institute

  Future getDepts() async {
    try {
      var apiEndpoint = "http://learnflutter.orgfree.com/get_depts.php";
      //var res = await http.get(apiEndpoint as Uri, headers: {"Accept:": "appliication/json"});
      final Uri url = Uri.parse(apiEndpoint);
      http.Response response = await http.post(url, body: {'id': selectedName});
      //print(selectedName);
      if (response.statusCode == 200) {
        // var data1 = utf8.decode(response.bodyBytes);
        var jsonData = json.decode(response.body);
        //return jsonData;

        return jsonData;
      } else {
        print('No Data Found');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInstitute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        title: Text("NRC Sys App"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),

          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
        
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Choose The Institute",
              style: TextStyle(color: Colors.blue[800], fontSize: 16),
            ),
            SizedBox(
              height: 4,
            ),
            Center(
              child: SizedBox(
                // width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[100],
                        contentPadding: EdgeInsets.only(left: 5),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2,
                          color: Colors.blue,
                        ))),
                    isExpanded: true,
                    hint: Text("Select The Institute"),
                    dropdownColor: Colors.blue[100],
                    value: selectedName,
                    items: list.map((list) {
                      return DropdownMenuItem(
                          value: list['institute_id'],
                          child: Text(
                            list['institute_name'],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedName = value as String?;
                      });
                    },
                  ),
                ),
              ),
            ),
            // Text("$selectedName"),
            // SizedBox(
            //   height: 30,
            // ),

            // show depts
            SizedBox(
              height: 5,
            ),
            selectedName != null
                ? Container(
                    height: 500,
                    child: FutureBuilder(
                        future: getDepts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.length == 0) {
                              return Text('No data For this Institute');
                            }
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  var list = snapshot.data[index];
                                  return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        height: 45,
                                        color: Colors.blue[100],
                                        child: ListTile(
                                          title: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  list['dept_name'],
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 160, 22, 153)),
                                                ),
                                                // Text(list['dept_code']),
                                              ],
                                            ),
                                          ),
                                          trailing: IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                (context),
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EmailScreen(
                                                            instcode:
                                                                selectedName
                                                                    .toString(),
                                                            deptcode: list[
                                                                'dept_code'])),
                                              );
                                            },
                                            icon: Icon(Icons.email_sharp),
                                            color: Colors.blue,
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              (context),
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EmailScreen(
                                                          instcode:
                                                              selectedName
                                                                  .toString(),
                                                          deptcode: list[
                                                              'dept_code'])),
                                            );
                                          },
                                        ),
                                      ));
                                });
                          }
                          return Text('No Data Found');
                        }),
                  )
                : Text('Select Institute First'),

            // MaterialButton(
            //   onPressed: () {
            //     Navigator.push(
            //       (context),
            //       MaterialPageRoute(
            //           builder: (context) => DeptScreen(
            //                 id: selectedName.toString(),
            //               )),
            //     );
            //   },
            //   minWidth: 200,
            //   color: Colors.blue,
            //   child: Text(
            //     "Show data",
            //     style: TextStyle(color: Colors.white, fontSize: 15),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
