import 'package:flutter/material.dart';
import 'package:viva_app/Widgets/ContactUs_widget.dart';
import 'package:viva_app/urllauncher.dart';

UrlLauncher launcher = UrlLauncher();

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;
    double heightfinal = heightscreen - bottomPadding - topPadding;
    return SingleChildScrollView(
      child: SizedBox(
        height: heightfinal + 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 2, child: FittedBox(child: ContactUsWidget(launcher))),
            SizedBox(
              height: heightscreen / 70,
            ),
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
                        icon: const Icon(Icons.mail_outline, size: 35)),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(55),
                        onTap: () {
                          launcher.launchMail();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 20.0, left: 20),
                          child: FittedBox(
                            child: Text("vivacity@lnmiit.ac.in",
                                style: TextStyle(fontSize: 28)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
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
                        icon: const Icon(Icons.web)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(55),
                        onTap: () {
                          launcher.launchweb(
                              Uri(scheme: "https", host: "vivacity.live"));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 20.0, left: 20),
                          child: Text("vivacity.live",
                              style: TextStyle(fontSize: 28)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: heightscreen / 100,
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    padding: const EdgeInsets.all(15),
                    onPressed: () {
                      launcher.launchInstaPage();
                    },
                    icon: SizedBox(
                      height: 43,
                      child: Image.asset(
                        "assets/Logos/instagramlogo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(15),
                    onPressed: () {
                      launcher.launchLinkedInPage();
                    },
                    icon: SizedBox(
                      height: 43,
                      child: Image.asset(
                        "assets/Logos/linkedinlogo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: const EdgeInsets.all(15),
                    onPressed: () {
                      launcher.launchYtPage();
                    },
                    icon: SizedBox(
                      height: 43,
                      child: Image.asset(
                        "assets/Logos/youtubelogo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightscreen / 50,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: InkWell(
                  onTap: () => launcher.launchURL(),
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
          ],
        ),
      ),
    );
  }
}
