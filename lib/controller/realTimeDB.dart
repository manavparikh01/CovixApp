import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FirebaseRealTimeController {
  Stream<Event> getPatientsList({String firebaseId}) {
    final firebasedatbase =
        FirebaseDatabase.instance.reference().child("Patient");
    return firebasedatbase.onValue;
  }

  void addPatientToDB({Map patientDetails}) async {
    print("details $patientDetails");
    final firebasedatbase =
        FirebaseDatabase.instance.reference().child("Patient");
    var snapshot = await firebasedatbase.once();
    List temp = snapshot.value;
    var tempOutput = new List.from(temp);
    print("temo $tempOutput");
    tempOutput.add(patientDetails);
    firebasedatbase.set(tempOutput);
    // print("shubh $rm");
  }

  void verifyDoctor() async {
    final firebaseDatabase =
        FirebaseDatabase.instance.reference().child('DoctorID').child('ID');

    print(firebaseDatabase);

    Get.snackbar('Valid', 'Sid lodu');
  }
}
