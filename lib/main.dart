import 'package:film_uygulamasi/Widgets/cards.dart';
import 'package:film_uygulamasi/Widgets/ilk_resim.dart';
import 'package:film_uygulamasi/filmler.dart';
import 'package:film_uygulamasi/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:film_uygulamasi/Widgets/card.dart';
import 'package:film_uygulamasi/detay_deneme.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {


  Future<List<Result>?> tumFilmler() async {
    print("tumFilmler çekiliyor!");
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=b7bb7cff7b29a1d4fa2b05ea18b25b00");
    var cevap = await http.get(url);
    final topratefilm = topratefilmFromJson(cevap.body);
    List<Result>? filmler = topratefilm.results;
    deneme = await filmler?[7];
    return filmler;
  }

  Result? deneme;



  @override
  void initState() {
    super.initState();
    tumFilmler();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(218, 235, 251, 1),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10.0, bottom: 10.0, left: 2.0, top: 2.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const profile()));
                        },
                        child: SizedBox(
                          child: Image.asset(
                            "resimler/animationn.gif",
                          ),
                        ),
                      ),
                    ),
                    width: screen.width * 0.15,
                    height: screen.height * 0.1,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(218, 235, 251, 1),
                          offset: Offset(-5.0, -5.0),
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(218, 235, 251, 1),
                          offset: Offset(-5.0, -5.0),
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: screen.width * 0.3,
                  height: screen.height * 0.1,
                  child: Image.asset("resimler/disneppp.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    child: const Padding(
                      padding: EdgeInsets.only(
                          right: 10.0, bottom: 10.0, left: 2.0, top: 1.0),
                      child: SizedBox(
                        child: Icon(
                          Icons.download,
                          size: 40,
                        ),
                      ),
                    ),
                    width: screen.width * 0.2,
                    height: screen.height * 0.08,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(-5.0, -5.0),
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Color.fromRGBO(218, 235, 251, 1),
                          offset: Offset(-5.0, -5.0),
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: screen.height * 0.27,
              width: screen.width * 1,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white70.withOpacity(0.4),
                    blurRadius: 5.0,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => details(Film: deneme)));
                        },
                        child: FutureBuilder<List<Result>?>(
                            future: tumFilmler(),
                            builder: (context, snapshot) {
                              return SizedBox(
                                width: double.infinity,
                                height: screen.height * 0.25,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 1,
                                    itemBuilder: (BuildContext, int index) {
                                      return ilk_resim(Film: deneme);
                                    }),
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: screen.width * 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Kanallar",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          child: const Text(
                            "Hepsini Gör",
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  card(
                    image: "resimler/marvel.png",
                  ),
                  card(
                    image: "resimler/disneppp.png",
                  ),
                  card(
                    image: "resimler/pixarr.png",
                  ),
                  card(
                    image: "resimler/deneme.png",
                  ),
                  card(
                    image: "resimler/deneme.png",
                  ),
                  card(
                    image: "resimler/deneme.png",
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: screen.width * 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "En Yeniler",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          child: const Text(
                            "Hepsini Gör",
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("Deneme"),
                                  ],
                                ),
                                content: const Text(
                                  "En yeni filmler sizin için eklenmeye devam ediyor...",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                actions: [
                                  TextButton(
                                    child: Text("CANCEL"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FutureBuilder<List<Result>?>(
                      future: tumFilmler(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var filmlerListesi = snapshot.data;

                          return SizedBox(
                            height: screen.height * 0.26,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: filmlerListesi?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return cards(
                                  Film: filmlerListesi?[index],
                                );
                              },
                            ),
                          );
                        } else {
                          return Center();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
