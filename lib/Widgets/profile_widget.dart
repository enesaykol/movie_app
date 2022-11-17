import 'package:flutter/material.dart';

class profile_widget extends StatelessWidget {
  final IconData icon;
  final String title;

  const profile_widget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.black45,
              size: 32,
            ),
            Text(title,
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w400)),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black26,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
