import 'vaccinatedListPage.dart';

import 'homePage.dart';

import 'waitingListScreen.dart';

import 'secondHomePage.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';

class ThirdHomePage extends StatefulWidget {
  @override
  _ThirdHomePageState createState() => _ThirdHomePageState();
}

class _ThirdHomePageState extends State<ThirdHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                    label: Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      // Navigator.pop(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) =>
                      //             LoginScreen()));
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            //backgroundColor: Colors.white,
                            backgroundColor: Color.fromRGBO(22, 0, 49, 1),
                            title: Center(
                              child: Icon(
                                Icons.done_all,
                                color: Colors.white,
                                //color: Color.fromRGBO(22, 0, 49, 1),
                              ),
                            ),
                            content: Container(
                              height: 130,
                              width: 300,
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      'Are you sure, You want to Log Out?',
                                      //softWrap: true,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Color.fromRGBO(11, 0, 30, 1),
                                            ),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: Text('No'),
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Color.fromRGBO(11, 0, 30, 1),
                                            ),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: Text('yes'),
                                          onPressed: () {
                                            // Navigator.pop(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (BuildContext
                                            //                 context) =>
                                            //             HomePage()));
                                            Navigator.of(ctx).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Center(
                                                  child: Container(
                                                      height: height * 0.17,
                                                      width: width,
                                                      child: Column(
                                                        children: <Widget>[
                                                          SizedBox(
                                                            height:
                                                                height * 0.02,
                                                          ),
                                                          Container(
                                                            height:
                                                                height * 0.15,
                                                            width: width,
                                                            decoration:
                                                                BoxDecoration(
                                                              // gradient: LinearGradient(
                                                              //     tileMode: TileMode.mirror,
                                                              //     begin: Alignment.topCenter,
                                                              //     end: Alignment.bottomCenter,
                                                              //     colors: [
                                                              //       Colors.black,
                                                              //       Color.fromRGBO(11, 0, 48, 1)
                                                              //     ]),
                                                              color: Color
                                                                  .fromRGBO(11,
                                                                      0, 30, 1),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10)),
                                                              //color: Color.fromRGBO(0, 0, 0, 0.8)
                                                            ),
                                                            //color: Color.fromRGBO(0, 0, 0, 0.8),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Center(
                                                              child: Container(
                                                                child: Center(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: <
                                                                        Widget>[
                                                                      Text(
                                                                        'Logged Out!!',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              height * 0.03,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                      // SizedBox(
                                                                      //   width: 20,
                                                                      // ),
                                                                      // Icon(
                                                                      //   Icons.done_all,
                                                                      //   color: Colors.white,
                                                                      //   size: 40,
                                                                      // )
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
                                                duration: const Duration(
                                                    milliseconds: 1500),
                                                backgroundColor: Color.fromRGBO(
                                                    0, 0, 0, 0.6),
                                                //width: double.infinity,
                                                // padding: const EdgeInsets.symmetric(
                                                //   horizontal: 8.0,
                                                // ),
                                                behavior:
                                                    SnackBarBehavior.fixed,
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
                                              const Duration(
                                                  milliseconds: 1100),
                                              () {
                                                Navigator.pop(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            LoginScreen()));
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              width: width,
                              //color: Colors.green,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.elliptical(40, 30),
                                    ),
                                    color: Colors.black,
                                    gradient: LinearGradient(
                                        tileMode: TileMode.mirror,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromRGBO(30, 0, 4, 1),
                                          Color.fromRGBO(60, 0, 11, 1)
                                        ])),
                                child: ElevatedButton(
                                  // child: Text(
                                  //   'Waiting List',
                                  //   style: TextStyle(
                                  //     fontSize: height * 0.04,
                                  //     fontWeight: FontWeight.w300,
                                  //   ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Colors.transparent,
                                    ),
                                    elevation:
                                        MaterialStateProperty.all<double>(0),
                                  ),

                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: height * 0.024,
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: width * 0.007,
                                              ),
                                              Container(
                                                child: Text(
                                                  'Waiting List',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(),
                                              ),
                                              Container(
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 18,
                                                ),
                                              ),
                                              // SizedBox(
                                              //   width: width * 0.001,
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PatientsScreen()));
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: width,
                              //color: Colors.yellow,
                              padding: EdgeInsets.all(15),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.elliptical(40, 30),
                                    ),
                                    color: Colors.black,
                                    gradient: LinearGradient(
                                        tileMode: TileMode.mirror,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromRGBO(8, 30, 8, 1),
                                          Color.fromRGBO(16, 60, 16, 1),
                                        ])),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Colors.transparent,
                                    ),
                                    elevation:
                                        MaterialStateProperty.all<double>(0),
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: height * 0.024,
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                width: width * 0.007,
                                              ),
                                              Container(
                                                child: Text(
                                                  'Add Patient',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(),
                                              ),
                                              Container(
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 18,
                                                ),
                                              ),
                                              // SizedBox(
                                              //   width: width * 0.001,
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SecondHomePage()));
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            width: width,
                            //color: Colors.red,
                            padding: EdgeInsets.all(15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.elliptical(40, 30),
                                  ),
                                  color: Colors.black,
                                  gradient: LinearGradient(
                                      tileMode: TileMode.mirror,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(75, 75, 20, 1),
                                        Color.fromRGBO(140, 140, 40, 1)
                                      ])),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.transparent,
                                  ),
                                  elevation:
                                      MaterialStateProperty.all<double>(0),
                                ),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: height * 0.024,
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: width * 0.007,
                                            ),
                                            Container(
                                              child: Text(
                                                'Vaccinated',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Container(
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 18,
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: width * 0.001,
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              VaccinatedListPage()));
                                },
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
