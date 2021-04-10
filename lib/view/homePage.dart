import 'signUpPage.dart';

import 'loginPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  tileMode: TileMode.mirror,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Color.fromRGBO(11, 0, 48, 1)])),
          child: Center(
            child: Container(
              height: height,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.29,
                  ),
                  Text(
                    'COVIX',
                    style:
                        TextStyle(fontSize: height * 0.07, color: Colors.white),
                    //style: TextStyle(fontSize: height * 0.01),
                  ),
                  SizedBox(
                    height: height * 0.23,
                  ),
                  Container(
                    // color: Colors.grey,
                    height: height * 0.07,
                    width: width * 0.75,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        // backgroundColor:
                        //     MaterialStateProperty.all<Color>(Colors.transparent),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(10, 10, 10, 0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29),
                              side: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(42, 0, 130, 1),
                              )),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: height * 0.025),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SignUpPage()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    // color: Colors.grey,
                    height: height * 0.07,
                    width: width * 0.75,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        // backgroundColor:
                        //     MaterialStateProperty.all<Color>(Colors.transparent),cls
                        
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(10, 10, 10, 0)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29),
                              side: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(52, 0, 140, 1),
                              )),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: height * 0.025),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginScreen()));
                      },
                    ),
                  ),

                  // TextField(
                  //   style: TextStyle(color: Colors.white),
                  //   decoration: InputDecoration(
                  //     // hintText: 'Enter your name',
                  //     // hintStyle: TextStyle(color: Colors.white30),
                  //     contentPadding: EdgeInsets.symmetric(
                  //         vertical: 10.0, horizontal: 20.0),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           color: Colors.lightBlueAccent, width: 1.0),
                  //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           color: Colors.lightBlueAccent, width: 2.0),
                  //       borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
