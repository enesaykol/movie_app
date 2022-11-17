import 'dart:ui';
import 'package:flutter/material.dart';
import 'Widgets/welcome_widget.dart';

void main() {
  runApp(const MaterialApp(
    home: welcome(),
    debugShowCheckedModeBanner: false,
  ));
}

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Kim İzliyor ?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  user(kullanici: 'Kullanıcı 1'),
                  user(kullanici: "Kullanıcı 2"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                user(kullanici: "Kullanıcı 3"),
                user(kullanici: "Kullanıcı 4"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
