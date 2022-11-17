import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_uygulamasi/filmler.dart';
import 'package:flutter/material.dart';

class ilk_resim extends StatefulWidget{
  final Result? Film;

  const ilk_resim({Key? key, required this.Film}) : super(key: key);

  @override
  State<ilk_resim> createState() => _ilk_resimState();
}

class _ilk_resimState extends State<ilk_resim> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage (
      imageUrl: "https://image.tmdb.org/t/p/original${widget.Film?.posterPath}",
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
