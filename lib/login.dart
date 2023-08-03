// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dbase_mysql/main_nrc.dart';
import 'package:flutter_dbase_mysql/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Simulated login process (Replace this with actual login logic)
    if (username == "admin" && password == "1234") {
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('National Reseaech Center',
            style: TextStyle(fontSize: 20,color: Colors.blue),),
          SizedBox(height: 15,),
            Text('Login',
            style: TextStyle(fontSize: 18,color: Colors.blue),),
          SizedBox(height: 15,),
            Image.network(
              'http://learnflutter.orgfree.com/images/login.jpg',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
              SizedBox(height: 15),
      
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
      
            ElevatedButton(
              onPressed: _login,
              child: Text("Login"),
            ),
            SizedBox(height: 20),
            
            Center(
              child: Row(
                children: [
                  Text('Do not have an Acount  ',style: TextStyle(fontSize: 12),),
                  TextButton(onPressed: (){
                       Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                  },
                  
                   child: Text("Sign up"),
                   ),
                ],
              ),
            ),
             SizedBox(height: 50),
            Text("Computer & It  Management")
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text("Welcome to the Home Screen!"),
      ),
    );
  }
}
