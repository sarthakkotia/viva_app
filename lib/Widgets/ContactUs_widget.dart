import 'package:flutter/material.dart';
import 'package:viva_app/urllauncher.dart';

class ContactUsWidget extends StatelessWidget {
  final UrlLauncher launcher;

  const ContactUsWidget(
    this.launcher, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  "assets/Logos/Ajay-Raj.jpeg",
                ),
                backgroundColor: Colors.transparent,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Text(
                  "Ajay Raj",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        await launcher.callNumber("8529528101");
                      },
                      icon: const Icon(
                        Icons.call,
                        color: Colors.green,
                      )),
                  InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () async {
                      await launcher.callNumber("8529528101");
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 4),
                      child: Text(
                        "8529528101",
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
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  "assets/Logos/Prathmesh.jpeg",
                ),
                backgroundColor: Colors.transparent,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: FittedBox(
                  child: Text(
                    maxLines: 3,
                    "Prathmesh Ranjan",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        launcher.callNumber("7007175380");
                      },
                      icon: const Icon(
                        Icons.call,
                        color: Colors.green,
                      )),
                  InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () {
                      launcher.callNumber("7007175380");
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 4),
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
    );
  }
}
