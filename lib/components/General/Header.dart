import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../custom_color_scheme.dart';

class Header extends StatelessWidget {
  Header({@required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Theme.of(context).colorScheme.blueDark,
      child: Row(children: <Widget>[
        Expanded(
          child: Text(this.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22)),
        )
      ]),
    );
  }
}
