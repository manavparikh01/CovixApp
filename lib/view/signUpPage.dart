import 'package:abcd/controller/loginController.dart';
import 'package:abcd/controller/realTimeDB.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

import 'loginPage.dart';
import 'homePage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final loginController = Get.put(LoginController());

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController docIDController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  List docList = ['H001', 'H002', 'H003', 'H004', 'H005', 'H006', 'H007'];

  bool _isVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    docIDController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Map<String, String> userData = {
    'email': '',
    'password': '',
    'name': '',
    'docID': ''
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final Size size = MediaQuery.of(context).size;
    final double widthRatio = size.width / 411;
    final double heightRatio = size.height / 731;
    return Container(
      height: height,
      // color: Colors.black,
      decoration: BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(
              tileMode: TileMode.mirror,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Color.fromRGBO(11, 0, 48, 1)])),
      child: Scaffold(
        //resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Container(
                height: height,
                child: Center(
                  child: Form(
                    key: _formKey,
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
                                      builder: (BuildContext context) =>
                                          HomePage()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: heightRatio * 100,
                        ),
                        Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontSize: 45 * heightRatio,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: heightRatio * 65,
                        ),
                        Container(
                          // color: Colors.grey,
                          width: widthRatio * 326,
                          height: heightRatio * 56,
                          child: TextFormField(
                            onChanged: (value) {
                              print(value);
                              userData['name'] = value;
                            },
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name can not be empty";
                              }
                              return null;
                            },
                            // onChanged: (text) {
                            //   userData['name'] = text;
                            // },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white30,
                                size: 20,
                              ),
                              hintText: 'Enter your name',
                              hintStyle: TextStyle(
                                  color: Colors.white30, fontSize: 16),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(70, 0, 220, 1),
                                    width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(70, 0, 220, 1),
                                    width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10 * heightRatio,
                        ),
                        Container(
                          // color: Colors.grey,
                          width: widthRatio * 326,
                          height: heightRatio * 56,
                          child: TextFormField(
                            onChanged: (text) {
                              print(text);
                              userData['email'] = text;
                            },
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email ID can not be empty";
                              }
                              if (!value.contains("@") ||
                                  !value.contains(".")) {
                                return "Please enter a valid email ID";
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: Colors.white30,
                                size: 20,
                              ),
                              hintText: 'Enter your username',
                              hintStyle: TextStyle(
                                  color: Colors.white30, fontSize: 16),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(70, 0, 220, 1),
                                    width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(70, 0, 220, 1),
                                    width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
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
                          child: TextFormField(
                            onChanged: (text) {
                              print(text);
                              userData['password'] = text;
                            },
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password can not be empty";
                              }
                              if (value.length < 9) {
                                return "Password should be atleast 8 characters";
                              }
                              return null;
                            },
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
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                  color: Colors.white30, fontSize: 16),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(70, 0, 220, 1),
                                    width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(70, 0, 220, 1),
                                    width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                            obscureText: _isVisible ? false : true,
                          ),
                        ),
                        SizedBox(height: heightRatio * 10),
                        Container(
                          // color: Colors.grey,
                          width: widthRatio * 326,
                          height: heightRatio * 56,
                          child: TextFormField(
                            onChanged: (text) {
                              userData['docID'] = text;
                            },
                            controller: docIDController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Doc ID can not be empty";
                              }
                              if (value.length != 4) {
                                return "Doc ID should be only 4 characters long";
                              }
                              if (!value.startsWith('H')) {
                                return "Please enter proper Doc ID";
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white30,
                                size: 20,
                              ),
                              hintText: 'Enter your Doctor ID',
                              hintStyle: TextStyle(
                                  color: Colors.white30, fontSize: 16),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(70, 0, 220, 1),
                                    width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(70, 0, 220, 1),
                                    width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: heightRatio * 30,
                        ),
                        Container(
                          width: widthRatio * 326,
                          height: heightRatio * 45,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(70, 0, 220, 1),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(29),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                if (!docList.contains(docIDController.text)) {
                                  ///dekh liyo  [ATTENTION MANAV]
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Center(
                                        child: Container(
                                            height: height * 0.27,
                                            width: width,
                                            child: Column(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: height * 0.02,
                                                ),
                                                Container(
                                                  height: height * 0.25,
                                                  width: width,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    // gradient: LinearGradient(
                                                    //     tileMode: TileMode.mirror,
                                                    //     begin: Alignment.topCenter,
                                                    //     end: Alignment.bottomCenter,
                                                    //     colors: [
                                                    //       Colors.black,
                                                    //       Color.fromRGBO(11, 0, 48, 1)
                                                    //     ]),
                                                    color: Color.fromRGBO(
                                                        70, 0, 220, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    //color: Color.fromRGBO(0, 0, 0, 0.8)
                                                  ),
                                                  //color: Color.fromRGBO(0, 0, 0, 0.8),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'Please provide the Doc ID given by the Government',
                                                    style: TextStyle(
                                                        fontSize:
                                                            height * 0.03),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                      //content: const Text('Account Created'),
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      backgroundColor:
                                          Color.fromRGBO(0, 0, 0, 0.6),
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
                                } else {
                                  loginController.userRegister(
                                      userData: userData);

                                  setState(() {
                                    nameController.clear();
                                    emailController.clear();
                                    passwordController.clear();
                                    docIDController.clear();
                                  });

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
                                                    color: Color.fromRGBO(
                                                        70, 0, 220, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    //color: Color.fromRGBO(0, 0, 0, 0.8)
                                                  ),
                                                  //color: Color.fromRGBO(0, 0, 0, 0.8),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'Account Created',
                                                    style: TextStyle(
                                                        fontSize:
                                                            height * 0.03),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                      //content: const Text('Account Created'),
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      backgroundColor:
                                          Color.fromRGBO(0, 0, 0, 0.6),
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
                                  Future.delayed(
                                      const Duration(milliseconds: 1100), () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                LoginScreen()));
                                  });
                                }
                              } else {}
                            },
                            child: Text(
                              'CREATE ACCOUNT',
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
                          children: <Widget>[
                            Text(
                              "Already have an account ? ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: heightRatio * 12,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(width: 10 * widthRatio),
                            Container(
                              height: 31 * heightRatio,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromRGBO(70, 0, 220, 1),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(29),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: heightRatio * 12,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginScreen()));
                                },
                              ),
                            )
                          ],
                        ),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       print(userData);
                        //       if (_formKey.currentState.validate()) {
                        //         print("false");
                        //       } else {
                        //         print("true");
                        //       }
                        //     },
                        //     child: Text("Test"))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
