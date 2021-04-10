import 'dart:io';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class ExcelSheetController extends GetxController {
  List names = [].obs;
  Rx<bool> formSubmitting = false.obs;

  @override
  void onInit() {
    super.onInit();
    downloadFileExample().then((value) => readExcelfile());
  }

  Map<String, dynamic> userData = {
    'P_id': '',
    'Name': '',
    'Last': '',
    'Age': 69,
    'Gender': 'M',
    'Cancer': 0,
    'Dibeties': 0,
    'HighBP': 0,
    'Hypertension': 0,
    'Asthma': 0,
    'Thyroid': 0,
    'Kidneydisease': 0,
    'Liverdisease': 0,
    'Aczema': 0,
    'Alzhiemer': 0,
    'Total': 0,
    'Vaccinated': 0

    // 'diz4': '0',
    // 'diz5': '0',
  }.obs;

  String _excelFileName = "Batman";

  void readExcelfile() async {
    Directory getLocalDirectory = await getExternalStorageDirectory();
    String dir = getLocalDirectory.path;
    String file = "$dir/$_excelFileName.xlsx";
    // var bytes = File(file).readAsBytesSync();
    Uint8List bytes = File(file).readAsBytesSync();
    Excel excel = Excel.decodeBytes(bytes);
    for (var table in excel.tables.keys) {
      print('sheet name $table'); //sheet Name
      print('cols : ${excel.tables[table].maxCols}');
      print('rows : ${excel.tables[table].maxRows}');
      for (var row in excel.tables[table].rows) {
        print("$row");
      }
    }

    //for saving changes
    excel.encode().then((onValue) {
      File(file)
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    });
  }

  Future<void> addPatientRow({Map<String, dynamic> data}) async {
    formSubmitting.value = true;

    print(data);
    print("batman begins");
    Directory getLocalDirectory = await getExternalStorageDirectory();
    String dir = getLocalDirectory.path;
    String filePath = "$dir/$_excelFileName.xlsx";
    Uint8List bytes = File(filePath).readAsBytesSync();
    Excel excel = Excel.decodeBytes(bytes);

    /// we can use this [sheetObject] to perform various operations
    Sheet sheetObject = excel['Sheet1'];
    sheetObject.appendRow([
      data['P_id'],
      data['Name'],
      data['Last'],
      int.parse(data['Age']),
      data['Gender'],
      data['Cancer'],
      data['Dibeties'],
      data['HighBP'],
      data['Hypertension'],
      data['Asthma'],
      data['Thyroid'],
      data['Kidneydisease'],
      data['Liverdisease'],
      data['Aczema'],
      data['Alzhiemer'],
      0,
      0
      // data['diz4'],
      // data['diz5']
    ]);
    var test = sheetObject.sheetName;
    print(test);
    excel.encode().then((onValue) {
      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    });

    uploadFile();
    await Future.delayed(Duration(seconds: 2));
    formSubmitting.value = false;

    // readExcelfile();
  }

  void deleteSheetOfExcelSheet() async {
    Directory getLocalDirectory = await getExternalStorageDirectory();
    String dir = getLocalDirectory.path;

    var file = "$dir/$_excelFileName.xlsx";
    // print(file);
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    File maiHun = File(file);
    // Sheet sheetObject = excel['batman.xlsx'];
    excel.delete('Sheet1');

    excel.encode().then((onValue) {
      File(file)
        ..createSync(recursive: true)
        ..writeAsBytesSync(onValue);
    });

    readExcelfile();
  }

  Future<void> downloadFileExample() async {
    Directory appDocDir = await getExternalStorageDirectory();
    print("called : ${appDocDir.path}");
    File downloadToFile = File('${appDocDir.path}/$_excelFileName.xlsx');

    // File downloadToFile =
    //     File('/storage/emulated/0/Android/com.example.abcd/files/beta.xlsx');

    firebase_storage.DownloadTask task = firebase_storage
        .FirebaseStorage.instance
        .ref('/Patient_Data.xlsx')
        .writeToFile(downloadToFile);
    try {
      firebase_storage.TaskSnapshot snapshot = await task;
      print("Downloaded ${snapshot.bytesTransferred} bytes");
    } catch (e) {
      // e.g, e.code == 'canceled'
      print(e.toString());
    }
  }

  Future<void> uploadFile() async {
    Directory getLocalDirectory = await getExternalStorageDirectory();
    String dir = getLocalDirectory.path;
    String filepath = '$dir/$_excelFileName.xlsx';
    // var file = "$dir/bexy.xlsx";
    File file = File(filepath);
    print(file);

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('/Patient_Data.xlsx')
          .putFile(file);
    } catch (e) {
      // e.g, e.code == 'canceled'
    }
  }
}
