// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dbase_mysql/main_nrc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  void _signup() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Simulated login process (Replace this with actual login logic)
    if (username == "testuser" && password == "testpass") {
      // Navigate to the home screen or dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainNrc(),
        ),
      );
    } else {
      // Show error message or dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Invalid username or password"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NRC System App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'National Reseaech Center',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 15,),
            Text(
              "Registration",
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
            SizedBox(height: 10,),
            Image.network(
              'http://learnflutter.orgfree.com/images/unlock.jpg',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          
            SizedBox(height: 10),
          
            Container(
              height: 38,
              child: TextFormField(
                controller: _fullnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fullname',
                ),
              ),
            ),
           
            SizedBox(height: 10),
           
            Container(
              height: 38,
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
           
            SizedBox(height: 10),
           
            Container(
              height: 38,
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ),
           
            SizedBox(height: 10),
           
            Container(
              height: 38,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                obscureText: true,
              ),
            ),
           
            SizedBox(height: 10),
            
            Container(
              height: 38,
              child: TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
                obscureText: true,
              ),
            ),
           
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _signup,
                  child: Text("Registration"),
                ),
              
                SizedBox(width: 20),

                 ElevatedButton(
                  onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainNrc(),
                        ),
                      );
                  },
                  child: Text("Exit"),
                  ),
              ],
                ),
                       
            SizedBox(height: 20),
            
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.twitter,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
           
           SizedBox(height: 30),
            Text("Computer & It  Management")
          ]   
        
      ),
    ),
    );
  }
}
