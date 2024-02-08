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
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  "assets/Logos/Ajay-Raj.jpeg",
                ),
                backgroundColor: Colors.transparent,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  "Ajay Raj",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
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
                    child: Text(
                      "8529528101",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Column(
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
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
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
                    child: Text(
                      "7007175380",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
