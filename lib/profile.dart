import 'package:film_uygulamasi/Widgets/profile_widget.dart';
import 'package:flutter/material.dart';


class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screen.height * 0.2,
                    width: screen .width * 0.3,
                    child: Stack(
                      fit: StackFit.expand,
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage("resimler/mario.png"),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      "Enes AYKOL",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: double.infinity,
                  height: 3,
                  color: Colors.blueAccent,
                ),
              ),
              const profile_widget(icon: Icons.person, title: "Profil",),
              profile_widget(icon: Icons.settings, title: "Ayarlar",),
              profile_widget(icon: Icons.notifications, title: "Bildirimler",),
              profile_widget(icon: Icons.share, title: "Paylaş",),
              profile_widget(icon: Icons.login_outlined, title: "Çıkış Yap",),
              profile_widget(icon: Icons.info_outline_rounded, title: "Hakkımızda",),
            ],
          ),
        ),
      ),
    );
  }
}





