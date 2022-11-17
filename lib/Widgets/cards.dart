import 'package:flutter/material.dart';

class card extends StatelessWidget {
  final image;

  const card({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screen = MediaQuery.of(context).size;

    return Padding(
      padding:
          const EdgeInsets.only(top: 16.0, bottom: 16, right: 16, left: 20),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
              right: 10.0, bottom: 10.0, left: 2.0, top: 1.0),
          child: SizedBox(child: Image.asset(image, width: 190, height: 10)),
        ),
        width: screen.width * 0.35,
        height: screen.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5.0, -5.0),
              spreadRadius: 7.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5.0, -5.0),
              spreadRadius: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
