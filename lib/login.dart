import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'forgotPass.dart';
import 'register.dart';
import 'ShelterMain.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => RegisterPage(),
        '/shelterMain': (BuildContext context) => ShelterMain(),
        '/recoverPass': (BuildContext context) => PassRecover()
      },
      title: "Log in",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;

  bool errorVisible = false;
  String loginError = "";
  void showError(error, show) {
    setState(() {
      loginError = error;
      errorVisible = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 20.0,
          color: Colors.black38,
        ),
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Log in"),
        backgroundColor: Colors.black38,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                    child: Image(
                      image: AssetImage('assets/PB.jpg'),
                      width: 190.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username or Email',
                      labelStyle: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    onChanged: (value) {
                      this.setState(() {
                        _email = value;
                        if (_email == "") {
                          showError("Email can't be empty", true);
                        } else {
                          showError("", false);
                        }
                      });
                    },
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    onChanged: (value) {
                      this.setState(() {
                        _password = value;
                        if (_password == "") {
                          showError("Password can't be empty", true);
                        } else {
                          showError("", false);
                        }
                      });
                    },
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0),
                    child: InkWell(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PassRecover()),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    child: FlatButton(
                      color: Colors.black38,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      //splashColor: Colors.blueAccent,
                      onPressed: () {
                        if (_email == null) {
                          //bool Error = true;
                          showError("Email can't be empty", true);
                        } else if (_password == null) {
                          showError("Password can't be empty", true);
                        } else {
                          showError("", false);
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _email, password: _password)
                              .then((value) {
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShelterMain()),);
                            //Navigator.of(context).pushReplacementNamed('/shelterMain');
                            Navigator.of(context).pop();
                          }).catchError((error) {
                            showError(error.message, true);
                            print("Error: " + error.message);
                          });
                          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShelterMain()),);
                          //Navigator.of(context).pushReplacementNamed('shelterMain');
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: errorVisible,
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                      alignment: Alignment(-1.0, 0.0),
                      child: Text(loginError),
                    ),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
