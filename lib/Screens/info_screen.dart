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
    AppBar ab = AppBar();
    double heightfinal = heightscreen - bottomPadding - topPadding;
    //TODO: Make it adaptable to screens
    return SingleChildScrollView(
      child: SizedBox(
        height: heightfinal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: ab.preferredSize.height - 25,
            ),
            const Flexible(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: heightscreen / 70,
            ),
            SizedBox(
                height: heightfinal * 0.3, child: ContactUsWidget(launcher)),
            Row(
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
                      child: Text("vivacity@lnmiit.ac.in",
                          style: TextStyle(fontSize: 25)),
                    ),
                  ),
                )
              ],
            ),
            Row(
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
                      child:
                          Text("vivacity.live", style: TextStyle(fontSize: 25)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: heightscreen / 60,
            ),
            SizedBox(
              height: heightfinal * .15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      padding: const EdgeInsets.all(15),
                      onPressed: () {
                        launcher.launchInstaPage();
                      },
                      icon: SizedBox(
                        height: 35,
                        child: Image.asset(
                          "assets/instagramlogo.png",
                          fit: BoxFit.cover,
                        ),
                      )),
                  IconButton(
                      padding: const EdgeInsets.all(15),
                      onPressed: () {
                        launcher.launchLinkedInPage();
                      },
                      icon: SizedBox(
                        height: 35,
                        child: Image.asset(
                          "assets/linkedinlogo.png",
                          fit: BoxFit.cover,
                        ),
                      )),
                  IconButton(
                      padding: const EdgeInsets.all(15),
                      onPressed: () {
                        launcher.launchYtPage();
                      },
                      icon: SizedBox(
                        height: 35,
                        child: Image.asset(
                          "assets/youtubelogo.png",
                          fit: BoxFit.cover,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: heightscreen / 60,
            ),
            //TODO: Add GMAPS Snippet
            Expanded(
              child: ListTile(
                textColor: Colors.white,
                enableFeedback: false,
                leading: const Text(
                  "Address:",
                  style: TextStyle(fontSize: 22),
                ),
                subtitle: const Text(
                  "Rupa ki Nangal, Post-Sumel,Via Jamdoli, Jaipur, Rajasthan 302031",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: IconButton(
                  padding: const EdgeInsets.all(5),
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
            ),
          ],
        ),
      ),
    );
  }
}
