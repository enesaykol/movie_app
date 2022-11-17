import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';import 'filmler.dart';

class details extends StatefulWidget {
  final Result? Film;

  const details({Key? key, this.Film}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    var rating = 3.0;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://image.tmdb.org/t/p/original${widget.Film?.posterPath}",
              placeholder: (context, url) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                );
              },
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 320, bottom: 15),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                      child: Text("${widget.Film?.title}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            shadows: <Shadow>[
                              Shadow(
                                offset: const Offset(1.0, 1.0),
                                blurRadius: 7.0,
                                color: Colors.black.withOpacity(0.9),
                              ),
                              Shadow(
                                offset: const Offset(1.0, 1.0),
                                blurRadius: 7.0,
                                color: Colors.black.withOpacity(0.9),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Text("2008 | Action | 2h 32m",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        shadows: <Shadow>[
                          Shadow(
                            offset: const Offset(1.0, 1.0),
                            blurRadius: 20.0,
                            color: Colors.black.withOpacity(0.9),
                          ),
                          Shadow(
                            offset: const Offset(1.0, 1.0),
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SmoothStarRating(
                      rating: rating,
                      isReadOnly: false,
                      size: 40,
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star_half,
                      defaultIconData: Icons.star_border,
                      borderColor: Colors.white30,
                      color: Colors.amber.shade300,
                      starCount: 5,
                      allowHalfRating: true,
                      /*onRated: (value) {
              print("rating value -> $value");

            },*/
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: 80,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.blue,
                          elevation: 15,
                          shape: const CircleBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Text("deasdasd",style:TextStyle(color: Colors.cyanAccent,fontSize: 25)),
