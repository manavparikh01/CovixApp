import 'package:abcd/controller/excelSheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterChips extends StatefulWidget {
  final String name;
  final String dizKey;

  FilterChips({this.name, this.dizKey});

  @override
  _FilterChipsState createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  bool _isSelected = false;

  ExcelSheetController excelSheetController = Get.put(ExcelSheetController());

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      backgroundColor: Color.fromRGBO(200, 200, 200, 0),
      //materialTapTargetSize: MaterialTapTargetSize.padded,
      label: Text(widget.name),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 10,
      ),
      selected: _isSelected,
      onSelected: (isSelected) {
        if (excelSheetController.userData[widget.dizKey] == 0) {
          excelSheetController.userData[widget.dizKey] = 1;
        } else if (excelSheetController.userData[widget.dizKey] == 1) {
          excelSheetController.userData[widget.dizKey] = 0;
        }
        print(
            ' dizkey ${widget.dizKey} identiufy ${excelSheetController.userData[widget.dizKey]}');
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Color.fromRGBO(70, 0, 220, 0.7),
    );
  }
}
