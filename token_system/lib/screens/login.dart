import 'package:flutter/material.dart';
import 'package:token_system/components/title.dart';
import 'package:token_system/screens/register.dart';
import 'package:token_system/screens/user_profile/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String validateMobile(String value) {
    // Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digits';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                TitleWidget(),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Mobile',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: validateMobile,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blueGrey,
                    child: Text('Login'),
                    onPressed: () {
                      // TODO: add validation function
                      // TODO: call login API
                      // TODO: don't handle passwords in raw text
                      print(mobileController.text);
                      print(passwordController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UserHome(name: mobileController.text)),
                      );
                    },
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Do not have an account?'),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          //signup screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )
              ],
            )));
  }
}
