import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

class InputPhoneWidget extends StatefulWidget {
  InputPhoneWidget({@required this.label, @required this.onChange});
  final label;
  final Function onChange;
  
  @override
  _InputPhoneWidget createState() => _InputPhoneWidget();
}

class _InputPhoneWidget extends State<InputPhoneWidget> {
  bool isError = false;

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
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
            ),
            border: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
            ),
            labelText: widget.label,
          ),
          onChanged: (text) {
            log('data: $text');
            if (text?.isEmpty ?? true) {
              setState(() {
                isError= true;
              });
            } else {
              setState(() {
                isError= false;
              });
              return widget.onChange(text);
            }
            log('isError: $isError');
          }),
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
