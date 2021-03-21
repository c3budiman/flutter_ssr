import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'package:intl/intl.dart';

class InputDateWidget extends StatefulWidget {
  InputDateWidget({@required this.label, @required this.onChange});
  final label;
  final Function onChange;

  @override
  _InputDateWidget createState() => _InputDateWidget();
}

class _InputDateWidget extends State<InputDateWidget> {
  bool isError = false;
  // final f = DateFormat("dd-MM-yyyy");
  DateTime selectedDate = DateTime.now();
  String selectedDateString = DateFormat("dd-MMM-yyyy").format(DateTime.now());

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
    {
      setState(() {
        selectedDate = picked;
        selectedDateString = DateFormat("dd-MMM-yyyy").format(picked);
      });
      log('data: $selectedDateString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(top: 20.0, bottom: 7.0),
          child: Text(widget.label,
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ),
      ),
      TextField(
        style: TextStyle(height: 0.8, fontSize: 14.0),
        onTap: () {
          // Below line stops keyboard from appearing
          FocusScope.of(context).requestFocus(new FocusNode());

          // Show Date Picker Here
          _selectDate(context);
        },
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.calendar_today),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
          border: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
          ),
          labelText: selectedDateString,
        ),
      ),
      Visibility(
        visible: isError,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 7.0),
            child: Text("harap cek kembali data yang di masukkan.",
                style: GoogleFonts.openSans(color: Colors.red, fontSize: 12)),
          ),
        ),
      )
    ]);
  }
}
