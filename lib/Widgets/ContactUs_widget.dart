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
              //TODO: Rounded Square
              const CircleAvatar(radius: 60),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 4),
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
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Text(
                  "placeholder 1",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              //TODO: Make call icon colored
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
