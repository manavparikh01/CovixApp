import 'thirdHomePage.dart';

import 'secondHomePage.dart';

import 'homePage.dart';
import 'signUpPage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignUpClicked = false;

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double widthRatio = size.width / 411;
    final double heightRatio = size.height / 731;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 0,
      width: 400,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              tileMode: TileMode.mirror,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Color.fromRGBO(11, 0, 48, 1)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: heightRatio * 35,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 33,
                      ),
                      onPressed: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => HomePage()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: heightRatio * 120,
                  ),
                  Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 45 * heightRatio,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: heightRatio * 120,
                  ),
                  Container(
                    // color: Colors.grey,
                    width: widthRatio * 326,
                    height: heightRatio * 56,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white30,
                          size: 20,
                        ),
                        hintText: 'Enter your username',
                        hintStyle:
                            TextStyle(color: Colors.white30, fontSize: 16),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        // EdgeInsets.only(top: 5.0, right: 10.0, left: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightRatio * 10,
                  ),
                  Container(
                    // color: Colors.grey,
                    width: widthRatio * 326,
                    height: heightRatio * 56,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white30,
                          size: 20,
                        ),
                        suffixIcon: IconButton(
                          icon: _isVisible
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.white30,
                                  size: 20,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.white30,
                                  size: 20,
                                ),
                          onPressed: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (currentFocus.hasPrimaryFocus) {}
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (_isVisible == false) {
                              _isVisible = true;
                            } else {
                              _isVisible = false;
                            }
                          },
                        ),
                        hintText: 'Enter your password.',
                        hintStyle:
                            TextStyle(color: Colors.white30, fontSize: 16),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                      obscureText: _isVisible ? false : true,
                    ),
                  ),
                  SizedBox(
                    height: heightRatio * 1,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(4, 0, 35, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29),
                        ),
                      ),
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: heightRatio * 11,
                        fontWeight: FontWeight.w300,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: heightRatio * 46.7,
                  ),
                  Container(
                    width: widthRatio * 326,
                    height: heightRatio * 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Container(
                                  height: height * 0.17,
                                  width: width,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      Container(
                                        height: height * 0.15,
                                        width: width,
                                        decoration: BoxDecoration(
                                          // gradient: LinearGradient(
                                          //     tileMode: TileMode.mirror,
                                          //     begin: Alignment.topCenter,
                                          //     end: Alignment.bottomCenter,
                                          //     colors: [
                                          //       Colors.black,
                                          //       Color.fromRGBO(11, 0, 48, 1)
                                          //     ]),
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          //color: Color.fromRGBO(0, 0, 0, 0.8)
                                        ),
                                        //color: Color.fromRGBO(0, 0, 0, 0.8),
                                        alignment: Alignment.center,
                                        child: Center(
                                          child: Container(
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Logged In',
                                                    style: TextStyle(
                                                        fontSize:
                                                            height * 0.03),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Icon(
                                                    Icons.done_all,
                                                    color: Colors.white,
                                                    size: 40,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            //content: const Text('Account Created'),
                            duration: const Duration(milliseconds: 1500),
                            backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
                            //width: double.infinity,
                            // padding: const EdgeInsets.symmetric(
                            //   horizontal: 8.0,
                            // ),
                            behavior: SnackBarBehavior.fixed,
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(10.0),
                            // ),
                            // action: SnackBarAction(
                            //   label: 'Action',
                            //   onPressed: () {},
                            // ),
                          ),
                        );
                        Future.delayed(const Duration(milliseconds: 1100), () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ThirdHomePage()));
                        });
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontSize: 22 * heightRatio,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightRatio * 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ? ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: heightRatio * 12,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        width: 10 * widthRatio,
                      ),
                      Container(
                        height: 31 * heightRatio,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(29),
                              ),
                            ),
                          ),
                          child: Text(
                            "Sign Up ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: heightRatio * 12),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUpPage()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
