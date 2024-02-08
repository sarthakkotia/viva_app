import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:viva_app/Provider/Services/urllauncher.dart';
import 'package:viva_app/Widgets/ContactUs_widget.dart';

import '../Widgets/Parallax__widget.dart';

UrlLauncher launcher = UrlLauncher();

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;
    double heightfinal = heightscreen - bottomPadding - topPadding;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Logos/about us png(1).png"))),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Fest Heads",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: heightscreen / 70),
                  child: FittedBox(
                    child: ContactUsWidget(launcher),
                  ),
                )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 1000)),
                Expanded(
                  flex: 0,
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () async {
                              await launcher.launchMail();
                            },
                            icon: const Icon(
                              Icons.mail_outline,
                              size: 38,
                              color: Colors.black,
                            )).animate().flipV(),
                        InkWell(
                          borderRadius: BorderRadius.circular(55),
                          onTap: () {
                            launcher.launchMail();
                          },
                          child: const FittedBox(
                            child: Text("vivacity@lnmiit.ac.in",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ).animate().fadeIn(),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: heightscreen / 50),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            iconSize: 38,
                            onPressed: () async {
                              await launcher.launchweb(
                                  Uri(scheme: "https", host: "vivacity.live"));
                            },
                            icon: const Icon(
                              Icons.web,
                              color: Colors.black,
                            )).animate().flipV(),
                        InkWell(
                          borderRadius: BorderRadius.circular(55),
                          onTap: () {
                            launcher.launchweb(
                                Uri(scheme: "https", host: "vivacity.live"));
                          },
                          child: const Text("vivacity.live",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ).animate().fadeIn()
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        launcher.launchInstaPage();
                      },
                      icon: SizedBox(
                        height: 40,
                        child: Image.asset(
                          'assets/Logos/instagram.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ).animate().slideX(),
                    IconButton(
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        launcher.launchLinkedInPage();
                      },
                      icon: SizedBox(
                        height: 40,
                        child: Image.asset(
                          "assets/Logos/linkedin.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ).animate().slideX(),
                    IconButton(
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        launcher.launchYtPage();
                      },
                      icon: SizedBox(
                        height: 40,
                        child: Image.asset(
                          "assets/Logos/youtube.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ).animate().slideX(),
                    IconButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ParallaxWidget();
                          }));
                        },
                        icon: SizedBox(
                          height: 40,
                          child: Image.asset(
                            "assets/Logos/hat.png",
                            fit: BoxFit.contain,
                          ),
                        )).animate().slideX()
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                    onTap: () => launcher.launchURL(),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: const Color.fromRGBO(143, 37, 114, 1),
                          width: 10.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          "assets/Logos/MapsImage.png",
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                          alignment: Alignment.center,
                          isAntiAlias: true,
                        ),
                      ),
                    ),
                  ),
                ).animate().flipH(),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Developed By",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/Logos/Ayush_Singh.webp'),
                        ),
                        Row(children: [
                          const Text(
                            "Ayush Singh",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              launcher.launchAyush();
                            },
                            icon: SizedBox(
                              height: 20,
                              child: Image.asset(
                                "assets/Logos/instagram.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ).animate().slideX()
                        ])
                      ],
                    ),
                    Column(
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/Logos/Sarthak_Kotia.webp'),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Sarthak Kotia",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {
                                launcher.launchKotia();
                              },
                              icon: SizedBox(
                                height: 20,
                                child: Image.asset(
                                  "assets/Logos/instagram.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ).animate().slideX()
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
