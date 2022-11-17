import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_uygulamasi/Widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:film_uygulamasi/filmler.dart';
import 'package:film_uygulamasi/film.dart';
import 'package:film_uygulamasi/detay_deneme.dart';
import 'package:http/http.dart' as http;


class cards extends StatefulWidget {
  final Result? Film;


  const cards({Key? key, required this.Film}) : super(key: key);

  @override
  State<cards> createState() => _cardsState();
}

class _cardsState extends State<cards> {
  @override
  Widget build(BuildContext context) {

    final screen = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.white70.withOpacity(0.4),
              blurRadius: 5.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(56),
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 400 / 451,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: FractionalOffset.topCenter,
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original${widget.Film?.posterPath}"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //"https://image.tmdb.org/t/p/original${widget.Film?.posterPath}"
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${widget.Film?.title}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic)),

              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left:3.0),
                  child: Text(
                    "1h 45m",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: screen.width * 0.18,
                  height: screen.height * 0.04,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => details(Film: widget.Film)));
                    },
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      elevation: 5,
                      shape: const CircleBorder(),
                    ),
                  ),
                ),
                const Text("9.5"),
                const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Icon(Icons.star,color: Colors.amber,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
