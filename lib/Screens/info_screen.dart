import 'package:flutter/material.dart';
import 'package:viva_app/urllauncher.dart';

UrlLauncher launcher = UrlLauncher();

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
                  const CircleAvatar(radius: 60),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Text(
                      "placeholder 1",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            await launcher.callNumber("");
                          },
                          icon: const Icon(Icons.call)),
                      InkWell(
                        borderRadius: BorderRadius.circular(60),
                        onTap: () async {
                          await launcher.callNumber("num");
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 4),
                          child: Text(
                            "Contact number",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const CircleAvatar(radius: 60),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Text(
                      "placeholder 1",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            launcher.callNumber("9461544075");
                          },
                          icon: const Icon(Icons.call)),
                      InkWell(
                        borderRadius: BorderRadius.circular(60),
                        onTap: () {
                          launcher.callNumber("9461544075");
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 4),
                          child: Text(
                            "9461544075",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: IconButton(
                        onPressed: () async {
                          await launcher.launchMail();
                        },
                        icon: const Icon(Icons.mail_outline, size: 35)),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(55),
                    onTap: () {
                      launcher.launchMail();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 20.0, left: 20),
                      child: Text("vivacity@lnmiit.ac.in",
                          style: TextStyle(fontSize: 25)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      iconSize: 38,
                      onPressed: () async {
                        await launcher.launchweb(
                            Uri(scheme: "https", host: "vivacity.live"));
                      },
                      icon: const Icon(Icons.web)),
                  InkWell(
                    borderRadius: BorderRadius.circular(55),
                    onTap: () {
                      launcher.launchweb(
                          Uri(scheme: "https", host: "vivacity.live"));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 20.0, left: 20),
                      child:
                          Text("vivacity.live", style: TextStyle(fontSize: 25)),
                    ),
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
        ListTile(
          textColor: Colors.white,
          enableFeedback: false,
          leading: const Text(
            "Adderess:",
            style: TextStyle(fontSize: 23),
          ),
          subtitle: const Text(
            "Rupa ki Nangal, Post-Sumel,Via Jamdoli, Jaipur, Rajasthan 302031",
            style: TextStyle(fontSize: 18),
          ),
          trailing: IconButton(
            padding: const EdgeInsets.all(2),
            onPressed: () {
              launcher.launchURL();
            },
            color: Colors.white,
            icon: const Icon(
              Icons.location_on_outlined,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
