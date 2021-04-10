import 'thirdHomePage.dart';
import 'package:flutter/material.dart';
import 'package:abcd/controller/realTimeDB.dart';

class VaccinatedListPage extends StatefulWidget {
  @override
  _VaccinatedListPageState createState() => _VaccinatedListPageState();
}

class _VaccinatedListPageState extends State<VaccinatedListPage> {
  FirebaseRealTimeController firebaseRealTimeController =
      FirebaseRealTimeController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Size size = MediaQuery.of(context).size;
    double heightRatio = size.height / 720;
    double widthRatio = size.height / 450;

    return Scaffold(
      body: Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  tileMode: TileMode.mirror,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Color.fromRGBO(11, 0, 48, 1)])),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ThirdHomePage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: width * 0.175,
                    ),
                    Container(
                      child: Text(
                        'Vaccinated List',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    // color: Colors.blue.withOpacity(0.1),
                    height: size.height * 0.8,
                    child: StreamBuilder(
                      stream: firebaseRealTimeController.getPatientsList(),
                      builder: (ctx, event) {
                        if (event.hasData) {
                          return Container(
                            // height: 100,
                            width: 300,
                            child: NotificationListener<
                                OverscrollIndicatorNotification>(
                              onNotification: (overscroll) {
                                overscroll.disallowGlow();
                              },
                              child: ListView.separated(
                                separatorBuilder: (ctx, i) {
                                  return SizedBox(
                                    height: 10 * heightRatio,
                                  );
                                },
                                itemCount: event.data.snapshot.value.length,
                                itemBuilder: (ctx, i) {
                                  // print(
                                  //     'chut: ${event.data.snapshot.value[i]}');
                                  if (event.data.snapshot.value[i]
                                          ['Vaccinated'] ==
                                      1) {
                                    return CustomNameBar(
                                      // patientData: event.data.snapshot.value[i]
                                      //     ['Name'],
                                      patientData: event.data.snapshot.value[i],
                                      index: i,
                                      widthRatio: widthRatio,
                                      heightRatio: heightRatio,
                                    );
                                  }
                                  return Container(
                                      // child: Text(
                                      //   'Hey',
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //   ),
                                      // ),
                                      );
                                },
                              ),
                            ),
                          );
                        } else if (event.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomNameBar extends StatefulWidget {
  final int index;
  final double heightRatio;
  final double widthRatio;
  final Map patientData;
  // final FunLogic controller;
  CustomNameBar({
    this.index,
    this.heightRatio,
    this.widthRatio,
    // this.controller,
    Key key,
    this.patientData,
  }) : super(key: key);

  @override
  _CustomNameBarState createState() => _CustomNameBarState();
}

class _CustomNameBarState extends State<CustomNameBar> {
  final TextStyle nameStyle = TextStyle(color: Colors.green, fontSize: 30);
  final TextStyle ageStyle = TextStyle(color: Colors.blue);
  bool isTapped = false;

  String get gender {
    if (widget.patientData['Gender'] == "F") {
      return "Female";
    } else {
      return "Male";
    }
  }

  Widget get vaccineIcon {
    if (widget.patientData['Vaccinated'] == 1) {
      return Icon(Icons.medical_services);
    } else {
      return Container();
    }
  }

  int get age {
    return widget.patientData['Age'];
  }

  String get fullname {
    return widget.patientData['Name'] + " " + widget.patientData['Last'];
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(29),
      child: GestureDetector(
        onTap: () {
          print(widget.index);
          setState(() {
            isTapped = !isTapped;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(color: Color.fromRGBO(21, 0, 58, 0.5)),
          // color: Colors.red,
          height: isTapped ? 200 : 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.3, vertical: 0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: isTapped ? 80 : 100,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Color.fromRGBO(11, 0, 48, 1),
                    // color: Colors.transparent.withOpacity(0.01),
                    child: Center(
                      child: Text(fullname, style: nameStyle),
                    ),
                  ),
                ),
                isTapped
                    ? Container(
                        margin: EdgeInsets.only(left: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              "Gender:  $gender",
                              style: ageStyle,
                            ),
                            SizedBox(height: 5),
                            Text('Age : $age', style: ageStyle),
                            vaccineIcon,
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
