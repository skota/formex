import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Form Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Text(
                "Register",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              emailField(),
              SizedBox(
                height: 10,
              ),
              passwordField(),
              SizedBox(
                height: 10,
              ),
              confirmPasswordField(),
              SizedBox(
                height: 10,
              ),
              submitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter Email',
      ),
      validator: (String value) {
        if (!value.contains('@')) {
          return "Invalid email address";
        }
      },
      onSaved: (String value) {
        print(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '*****',
      ),
      obscureText: true,
      validator: (String value) {
        if (value.length < 5) {
          return "Password is weak";
        }
      },
      onSaved: (String value) {
        print(value);
      },
    );
  }

  Widget confirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Confirm Password',
      ),
      obscureText: true,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Register'),
      onPressed: () {
        //formKey.currentState.reset();
        if (formKey.currentState.validate()) {
          print("form is valid");
          formKey.currentState.save();
        } else {
          print("form is invalid");
        }
      },
    );
  }
}
