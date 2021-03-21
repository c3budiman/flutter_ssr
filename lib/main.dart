import 'package:flutter/material.dart';
import 'package:smaslabtes/components/InputDateWidget.dart';
import 'package:smaslabtes/components/InputEmailWidget.dart';
import 'package:smaslabtes/components/InputPhoneWidget.dart';
import 'custom_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/InputTextWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SSR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Testing bikin ui'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fullName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SSR', style: GoogleFonts.openSans(color: Colors.black)),
          actions: <Widget>[
            Row(
              children: [
                Text('1', style: TextStyle(color: Colors.black)),
                Text(' of ', style: TextStyle(color: Colors.black)),
                Text('19', style: TextStyle(color: Colors.black))
              ],
            )
          ],
          backgroundColor: Colors.white60,
          elevation: 60.0,
          leading: Row(
            children: [
              Icon(Icons.chevron_left, color: Colors.black),
              Text('Back', style: TextStyle(color: Colors.black))
            ],
          ),
          centerTitle: true,
          brightness: Brightness.dark,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                color: Theme.of(context).colorScheme.blueDark,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Text('Title',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                  )
                ]),
              ),
              Container(
                  padding: const EdgeInsets.only(
                      top: 18.0, bottom: 50.0, left: 20, right: 20),
                  color: Theme.of(context).colorScheme.blueLight,
                  child: Column(
                    children: <Widget>[
                      InputTextWidget(
                          label: "Disiapkan Oleh",
                          onChange: (text) {
                            setState(() {
                              fullName = text;
                            });
                          }),
                      InputEmailWidget(label: "Email", onChange: () {}),
                      InputDateWidget(label: "Tanggal Kunjungan", onChange: () {}),
                      InputPhoneWidget(label: "Nomor Telepon", onChange: () {})
                    ],
                  )),
            ],
          ),
        ));
  }
}
