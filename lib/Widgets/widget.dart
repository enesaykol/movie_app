import 'package:film_uygulamasi/detay_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../filmler.dart';

class list_widget extends StatefulWidget {
  final List<Result>? Topratefilm;

  const list_widget({Key? key, required this.Topratefilm}) : super(key: key);

  @override
  State<list_widget> createState() => _list_widgetState();
}

class _list_widgetState extends State<list_widget> {
  @override
  Widget build(BuildContext context) {
    print(widget.Topratefilm?.first.title);

    return Text("data");
  }
}