// ignore_for_file: deprecated_member_use, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
// import 'package:loginpage/validation.dart';
// import 'validation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
            colors: [Color(0xff3B91E5), Color(0xff6DCDF5)])),
        // ignore: prefer_const_constructors
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: const LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  // late String email,password;
  String email = '';
  String password = '';
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
   
   getInput(){
     setState(() {
       email=emailcontroller.text;
       password=passwordcontroller.text;
     });
   }
  // void dispose(){
  //   email.dispose();
  //   password.dispose();
  //   super.dispose();
  // }

  var mailformat = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  var passformat = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

  @override
  Widget build(context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 30,
          right: 30,
          bottom: 25,
        ),
        child: Form(
          key: _formKey,
          child: Container(
            padding:
                const EdgeInsets.only(top: 25, left: 15, bottom: 15, right: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            height: 360,
            alignment: Alignment.bottomLeft,
            child: Column(children: [
              signIn(),
              getInputFields("Email address*", 'Enter email', 'email',
                  mailformat,emailcontroller),
              getInputFields("Password*", 'Enter password', 'password',
                  passformat,passwordcontroller),
              button()

              // Passwordfield(),
            ]),
          ),
        ));
  }

  // Widgets

  Widget signIn() {
    return const Text(
      "Sign In",
      style: TextStyle(fontSize: 25, fontFamily: 'Roboto'),
    );
  }

  Widget getInputFields(
      String title, String placeholder, String name, var format,var mycontroller) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 17, fontFamily: 'Roboto'),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextFormField(
                  controller: mycontroller,
                  // controller:name.controller;
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill the require fields';
                    }
                    if (!format.hasMatch(value)) {
                      return 'Please enter a valid $name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value!;
                  },
                  //

                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      hintText: placeholder,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15))))
        ],
      ),
    );
  }

  Widget button() {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        width: 400,
        height: 45,
        child: RaisedButton(
          padding: const EdgeInsets.all(10.0),
          onPressed: () {
            getInput();
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              // ignore: avoid_print

              _formKey.currentState!.save();
              // ignore: avoid_print
              print('Login successful ${email} and ${password}');
              // ignore: avoid_print
              // print('Time to post $email and $password to my API');
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          textColor: Colors.white,
          color: Colors.blueAccent,
          child: const Text("SIGN IN",
              style: TextStyle(
                  fontSize: 13,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto')),
        ));
  }
}
