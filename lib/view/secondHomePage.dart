import 'package:abcd/controller/realTimeDB.dart';

import '../widget/filterChips.dart';
import 'thirdHomePage.dart';
import 'package:abcd/controller/excelSheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondHomePage extends StatefulWidget {
  @override
  _SecondHomePageState createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ExcelSheetController excelSheetController =
      Get.put(ExcelSheetController());
  final FirebaseRealTimeController realTimeController =
      FirebaseRealTimeController();

  String genDer = 'Male';

  String male = 'M';
  String female = 'F';
  // Map<String, dynamic> userData = {
  //   'PID': '',
  //   'first_name': '',
  //   'last_name': '',
  //   'gender': '',
  //   'age': '',
  //   'diz1': '1',
  //   'diz2': '1',
  //   'diz3': '1',
  //   'diz4': '1',
  //   'diz5': '1',
  // };

  Widget makeCustomFormfield({String hint, String keyToEdit}) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      height: 50,
      width: 280,
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "This Field can't be empty";
          }
        },
        onChanged: (value) {
          if (keyToEdit == "Age") {
            print("ys ");
            excelSheetController.userData[keyToEdit] = int.parse(value);
          }
          excelSheetController.userData[keyToEdit] = value;
        },
        style: TextStyle(color: Colors.white),
        keyboardType: hint == 'Age' ? TextInputType.number : TextInputType.name,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.white30,
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white30),
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(70, 0, 220, 1), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromRGBO(70, 0, 220, 1), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }

  // Widget buildchips(String name) {
  //   return FilterChip(
  //     //backgroundColor: Colors.black,
  //     avatar: CircleAvatar(
  //       backgroundColor: Colors.red,
  //       child: Text(
  //         name[0].toUpperCase(),
  //         style: TextStyle(
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //     label: Text(
  //       name,
  //       style: TextStyle(
  //         color: Colors.black,
  //       ),
  //     ),
  //     //selected: ,
  //     onSelected: (bool selected) {
  //       setState(() {
  //         if (selected) {
  //           print('trye');
  //         } else {
  //           print('no');
  //         }
  //       });
  //     },
  //   );
  // }

  Widget dropGender({String hint, String keyToEdit}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: genDer,
        //icon: const Icon(Icons.downwa),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        // underline: Container(
        //   height: 2,
        //   color: Colors.deepPurpleAccent,
        // ),
        onChanged: (String newValue) {
          setState(() {
            genDer = newValue;
            // print(newValue);
            if (newValue == "Male") {
              // print("m");
              excelSheetController.userData[keyToEdit] = "M";
              print(excelSheetController.userData);
            } else if (newValue == "Female") {
              print("f");
              excelSheetController.userData[keyToEdit] = "F";
              print(excelSheetController.userData);
            }
          });
        },
        items: ['Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text(
          "Gender",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        focusColor: Colors.white,
      ),
    );
  }

  Widget dialogUp() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: showUpDialog(),
    );
  }

  Widget showUpDialog() {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: Text('Add Patients'),
    );
  }

  @override
  void initState() {
    super.initState();
    // readExcelfile();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;

    final Size size = MediaQuery.of(context).size;

    // final double widthRatio = size.width / 411;
    final double heightRatio = size.height / 731;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                gradient: LinearGradient(
                    tileMode: TileMode.mirror,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Color.fromRGBO(11, 0, 48, 1)])),

            width: width,
            height: height,
            // color: Colors.green,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.045,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ThirdHomePage(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: width * 0.145,
                        ),
                        Container(
                          child: Text(
                            'Add Patients',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.05,
                        ),
                        makeCustomFormfield(
                          hint: 'First Name',
                          keyToEdit: 'Name',
                        ),
                        makeCustomFormfield(
                          hint: 'Last Name',
                          keyToEdit: 'Last',
                        ),
                        makeCustomFormfield(
                          hint: 'Age',
                          keyToEdit: 'Age',
                        ),
                        // makeCustomFormfield(
                        //   hint: 'PID',
                        //   keyToEdit: 'PID',
                        // ),
                        Container(
                            height: 70,
                            width: 280,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(70, 0, 220, 1),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(29),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 46.5,
                                    right: 20,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Gender',
                                    style: TextStyle(
                                      color: Colors.white30,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(70, 0, 220, 1),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(17.8),
                                    ),
                                  ),
                                  child: dropGender(
                                    hint: 'Gender',
                                    keyToEdit: 'Gender',
                                  ),
                                ),
                              ],
                            )),
                        // makeCustomFormfield(
                        //   hint: 'Gender',
                        //   keyToEdit: 'gender',
                        // ),

                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          //height: 120,
                          width: 280,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color.fromRGBO(70, 0, 220, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                  top: 10,
                                  left: 46.5,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Disease',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  spacing: 6.0,
                                  children: <Widget>[
                                    FilterChips(
                                        name: 'Cancer', dizKey: 'Cancer'),
                                    FilterChips(
                                        name: 'Diabeties', dizKey: 'Dibeties'),
                                    FilterChips(
                                        name: 'High BP', dizKey: 'HighBP'),
                                    FilterChips(
                                        name: 'Hypertension',
                                        dizKey: 'Hypertension'),
                                    FilterChips(
                                        name: 'Asthma', dizKey: 'Asthma'),
                                    FilterChips(
                                        name: 'Thyroid', dizKey: 'Thyroid'),
                                    FilterChips(
                                        name: 'Kidney Disease',
                                        dizKey: 'Kidneydisease'),
                                    FilterChips(
                                        name: 'Liver Disease',
                                        dizKey: 'Liverdisease'),
                                    FilterChips(
                                        name: 'Aczema', dizKey: 'Aczema'),
                                    FilterChips(
                                        name: 'Alzhiemer', dizKey: 'Alzhiemer'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.075,
                        ),
                        Container(
                          width: 280,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                          child: GetX<ExcelSheetController>(
                            builder: (controller) {
                              if (!excelSheetController.formSubmitting.value) {
                                return ElevatedButton(
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
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      return showDialog<void>(
                                        context: context,
                                        barrierDismissible:
                                            false, // user must tap button!
                                        builder: (BuildContext ctx) {
                                          return AlertDialog(
                                            backgroundColor:
                                                Color.fromRGBO(70, 0, 220, 1),
                                            title: Center(
                                              child: Icon(
                                                Icons.done_all,
                                                color: Colors.white,
                                              ),
                                            ),
                                            content: Container(
                                              height: 130,
                                              width: 300,
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      'Do you want to edit patient data?',
                                                      //softWrap: true,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 40,
                                                  ),
                                                  Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: <Widget>[
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                              Color.fromRGBO(40,
                                                                  0, 130, 1),
                                                            ),
                                                            shape: MaterialStateProperty
                                                                .all<
                                                                    RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          child: Text('No'),
                                                          onPressed: () async {
                                                            Navigator.pop(
                                                                ctx,
                                                                MaterialPageRoute(
                                                                    builder: (BuildContext
                                                                            ctx) =>
                                                                        ThirdHomePage()));
                                                            await excelSheetController
                                                                .addPatientRow(
                                                                    data: excelSheetController
                                                                        .userData);

                                                            realTimeController
                                                                .addPatientToDB(
                                                                    patientDetails:
                                                                        excelSheetController
                                                                            .userData);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Center(
                                                                  child:
                                                                      Container(
                                                                          height: height *
                                                                              0.17,
                                                                          width:
                                                                              width,
                                                                          child:
                                                                              Column(
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
                                                                                  color: Color.fromRGBO(70, 0, 220, 0.5),
                                                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                  //color: Color.fromRGBO(0, 0, 0, 0.8)
                                                                                ),
                                                                                //color: Color.fromRGBO(0, 0, 0, 0.8),
                                                                                alignment: Alignment.center,
                                                                                child: Center(
                                                                                  child: Container(
                                                                                    child: Center(
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: <Widget>[
                                                                                          Text(
                                                                                            'Data Added',
                                                                                            style: TextStyle(fontSize: height * 0.03),
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
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        1500),
                                                                backgroundColor:
                                                                    Color.fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.6),
                                                                //width: double.infinity,
                                                                // padding: const EdgeInsets.symmetric(
                                                                //   horizontal: 8.0,
                                                                // ),
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .fixed,
                                                                // shape: RoundedRectangleBorder(
                                                                //   borderRadius: BorderRadius.circular(10.0),
                                                                // ),
                                                                // action: SnackBarAction(
                                                                //   label: 'Action',
                                                                //   onPressed: () {},
                                                                // ),
                                                              ),
                                                            );
                                                            Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        SecondHomePage()));
                                                          },
                                                        ),
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                              Color.fromRGBO(40,
                                                                  0, 130, 1),
                                                            ),
                                                            shape: MaterialStateProperty
                                                                .all<
                                                                    RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          child: Text('Yes'),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
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
                                    } else {}
                                  },
                                  // onPressed: () async {
                                  //   if (_formKey.currentState.validate()) {
                                  //     excelSheetController.addPatientRow(
                                  //         data: excelSheetController.userData);

                                  //     print("done");
                                  //   } else {
                                  //     print("not");
                                  //   }
                                  // },
                                  child: Text(
                                    'ADD PATIENT',
                                    style: TextStyle(
                                      fontSize: 22 * heightRatio,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
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

class CustomText extends StatelessWidget {
  final String text;
  CustomText({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.white),
    );
  }
}
