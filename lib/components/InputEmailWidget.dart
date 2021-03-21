import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';
import 'package:email_validator/email_validator.dart';

class InputEmailWidget extends StatefulWidget {
  InputEmailWidget({@required this.label, @required this.onChange});
  final label;
  final Function onChange;

  @override
  _InputEmailWidget createState() => _InputEmailWidget();
}

class _InputEmailWidget extends State<InputEmailWidget> {
  bool isError = false;
  bool isAlreadyChanged = false;

  void checkEmail(email) {
    if (EmailValidator.validate(email)) {
      setState(() {
        isError = false;
      });
      return widget.onChange(email);
    } else {
      setState(() {
        isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(top: 15.0, bottom: 7.0),
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
            // var asd = (text != "");
            // log('data: $asd');
            if (text?.isEmpty ?? true) {
              setState(() {
                isError = true;
              });
            } else {
              checkEmail(text);
            }
          }),
      Visibility(
        visible: isError,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 7.0),
            child: Text("harap cek kembali email yang di masukkan.",
                style: GoogleFonts.openSans(color: Colors.red, fontSize: 12)),
          ),
        ),
      )
    ]);
  }
}
