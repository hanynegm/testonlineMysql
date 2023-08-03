// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/institute_screen.dart';
import 'package:flutter_dbase_mysql/news_screen.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Hany Negm'),
            accountEmail: Text('hany@jamil.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'http://learnflutter.orgfree.com/images/hany.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
           
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            iconColor: Colors.blue[600],
            title: Text(
              'Home',
              style: TextStyle(color: Colors.blue[600]),
            ),
            onTap: () {
              Null;
            },
          ),
          ListTile(
            leading: Icon(Icons.newspaper),
            iconColor: Colors.blue[600],
            title: Text('News', style: TextStyle(color: Colors.blue[600])),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsScreen()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.email,
            ),
            iconColor: Colors.blue[600],
            title: Text(
              'Email',
              style: TextStyle(color: Colors.blue[600]),
            ),
            onTap: () {
               
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InstituteScreen()));
            },
            
          ),
          ListTile(
            leading: Icon(Icons.chat),
            iconColor: Colors.blue[600],
            title: Text('Chat', style: TextStyle(color: Colors.blue[600])),
            onTap: () {
              Null;
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            iconColor: Colors.blue[600],
            title: Text('Logout', style: TextStyle(color: Colors.blue[600])),
            onTap: () {
              Null;
            },
          ),
        ],
      ),
    );
  }
}
