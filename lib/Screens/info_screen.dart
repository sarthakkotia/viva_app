import 'package:flutter/material.dart';

//TODO: Reasearch https://api.flutter.dev/flutter/widgets/precacheImage.html

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar ab = AppBar();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: ab.preferredSize.height - 20,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20),
          child: Text(
            "Contact Us",
            style: TextStyle(fontSize: 25),
          ),
        ),
        //TODO: Make contact number clickable
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  //TODO: Rounded Square
                  CircleAvatar(radius: 55),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5.0),
                    child: const Text(
                      "placeholder 1",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const Text(
                      "Contact number",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(radius: 55),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5.0),
                    child: const Text(
                      "placeholder 1",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const Text(
                      "Contact number",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 55,
        ),
        const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Icon(Icons.mail_outline, size: 35),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20),
                    child: Text("vivacity@lnmiit.ac.in",
                        style: TextStyle(fontSize: 25)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.web, size: 35),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0, left: 20),
                    child: Text("vivacity.lnmiit.ac.in",
                        style: TextStyle(fontSize: 25)),
                  )
                ],
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //insta
              //TODO: Make this icon clickable to Insta page
              Icon(
                Icons.install_desktop,
                size: 30,
              ),
              //linkedin
              Icon(
                //TODO: Make this icon clickable to linkedin page
                Icons.linked_camera,
                size: 30,
              ),
              //youtube
              Icon(
                //TODO: Make this icon clickable to Youtube page
                Icons.video_call,
                size: 30,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 55,
        ),
        const ListTile(
          textColor: Colors.white,
          enableFeedback: false,
          leading: Text(
            "Adderess",
            style: TextStyle(fontSize: 25),
          ),
          subtitle: Text(
            "Rupa ki Nangal, Post-Sumel,Via Jamdoli, Jaipur, Rajasthan 302031",
            style: TextStyle(fontSize: 18),
          ),
          trailing: Icon(
            color: Colors.white,
            Icons.location_on_outlined,
            //TODO: Make this icon clickable to maps location
            size: 50,
          ),
        )
      ],
    );
  }
}
