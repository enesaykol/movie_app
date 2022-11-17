import 'package:flutter/material.dart';
import '../main.dart';

class user extends StatelessWidget {
  String kullanici;

  user({Key? key, required this.kullanici}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const MyApp()));
        },
        child: Container(
          height: screen.height * 0.22,
          width: screen.width * 0.32,
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
                    child: Image.asset("resimler/gifff.gif", fit: BoxFit.cover),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(kullanici,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic)),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
