import 'dart:convert';
import 'dart:ui';
import 'package:animated_background/animated_background.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_uygulamasi/detay_class.dart';
import 'package:film_uygulamasi/detay_credits.dart';
import 'package:film_uygulamasi/filmler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class detay_sayfa extends StatefulWidget {
  final Result film;

  const detay_sayfa({Key? key, required this.film}) : super(key: key);

  @override
  _detay_sayfaState createState() => _detay_sayfaState();
}

class _detay_sayfaState extends State<detay_sayfa>
    with TickerProviderStateMixin {
  Film? a;
  Credits? c;

  Future<Film?> filmDetayGetir() async {
    print("filmdetay çekiliyor!");
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/${widget.film.id}?api_key=b7bb7cff7b29a1d4fa2b05ea18b25b00");
    var cevap = await http.get(url);
    // final filmDetay = Film.fromJson(json.decode(cevap.body));
    // return filmDetay;
    if (cevap.body.isNotEmpty) {
      final cevapJson = json.decode(cevap.body);
      Film films = Film.fromJson(cevapJson);
      print("https://image.tmdb.org/t/p/original${films.backdrop_path}");

      return films;
    }
    return null;
  }

  Future<Credits?> credits() async {
    print("detaylar  çekiliyor!");
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/${widget.film.id}/credits?api_key=b7bb7cff7b29a1d4fa2b05ea18b25b00");
    var cevap = await http.get(url);
    final credits = creditsFromJson(cevap.body);
    Credits? credit = credits;

    return credit;
  }

  @override
  void initState() {
    super.initState();
    filmDetayGetir().then((value) {
      setState(() {
        a = value;
      });
    });

    credits().then((value) {
      c = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Deneme"), //${a?.title}
          centerTitle: true,
        ),
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(56),
                child: Image.asset("resimler/lucy.jpg", fit: BoxFit.cover),
              ),
            ),
          ],
        ),


      ),
    );
  }
}
