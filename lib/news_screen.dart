// ignore_for_file: unnecessary_new, deprecated_member_use, prefer_const_constructors, prefer_const_declarations

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/sidebar.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
//import 'package:url_launcher/url_launcher_string.dart';

final Uri _url = Uri.parse('www.google.com');

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // Future<void> launchUrlStart({required String url}) async {
  //   if (!await launchUrl(Uri.parse(url))) {
  //     throw 'could not launch $url';
  //   }
  // }

  List list = [];
  List listDept = [];
  Future getNews() async {
    var apiEndpoint = "http://learnflutter.orgfree.com/get_news.php";
    // var res = await http.get(theUrl as Uri, headers: {"Accept:": "appliication/json"});
    final Uri url = Uri.parse(apiEndpoint);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data1 = utf8.decode(response.bodyBytes);
      var jsonData = jsonDecode(data1);
      //return jsonData;
      setState(() {
        list = jsonData;
        print(list);
      });
    } else {
      print('No Data Found');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          title: Text("NRC System App"),
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
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (ctx, i) {
              return Card(
                child: Container(
                 
                  width: 120,
                  alignment: Alignment.centerRight,
                  color: Colors.blue[100],
                  child: ListTile(
                title: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Title(
                      color: Colors.green,
                      child: Container(
                        margin: EdgeInsets.all(5),
                       // width: 300,
                       // height: 250,
                        child: Image.network(
                            "http://learnflutter.orgfree.com/images_news/${list[i]['image_name']}"),
                             
                      ),
                    ),
                    
                    SizedBox(height: 2,),
                    Text(
                      list[i]['title'],
                      style: TextStyle(color: Colors.deepPurple),
                      textAlign: TextAlign.center,
                    ),
              
                    // ElevatedButton(
                    //     onPressed: () {
                    //       launchUrlStart(url: 'www.google.com');
                    //     },
                    //     child: const Text('More')),
                   SizedBox(height: 5,),
                    ElevatedButton(
                      child: Text('Open More'),
                      onPressed: () async {
                        final url = '${list[i]['link']}';
                        final Uri url1 = Uri.parse(url);
                        launchUrl(url1 , mode: LaunchMode.inAppWebView);
                      //   if (await canLaunch(url)) {
                      //     await launch(
                      //       url,
                      //         forceSafariVC: true,   
                      //         forceWebView: true,
                      //         enableJavaScript: true,                        
                      //     );
                      //  }
                      },
                    ),
                   SizedBox(height: 5,),
                    // Text(
                    //   list[i]['link'],
                    //   style: TextStyle(color: Colors.yellow[900]),
                    // ),
                  ],
                ),
                //subtitle: InkWell(),
                // list[i]['link'],
                // style: TextStyle(color: Colors.green[900]),
                  ),
                ),
              );
            }));
  }
}
