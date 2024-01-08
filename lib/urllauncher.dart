import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future<void> launchweb(Uri url) {
    return launchUrl(url, mode: LaunchMode.externalApplication).then((value) {
      print("hgkjagojdogjdjgjdp;dg");
    });
  }

  Future<void> launchmail(Uri url) {
    return launchUrl(url, mode: LaunchMode.platformDefault);
  }

  Future<void> launchURL() async {
    print("maps starting");
    String googleUrl =
        'https://www.google.com/maps/place/The+LNM+Institute+of+Information+Technology/@26.9362886,75.9139619,16z/data=!4m10!1m2!2m1!1sThe+LNM+Institute+Of+Information+Technology!3m6!1s0x396dba21e8a1d1c9:0x5ab565cce4d44c2b!8m2!3d26.9362886!4d75.9234891!15sCitUaGUgTE5NIEluc3RpdHV0ZSBPZiBJbmZvcm1hdGlvbiBUZWNobm9sb2d5kgEKdW5pdmVyc2l0eeABAA!16s%2Fm%2F04cql40?entry=ttu';
    String mapsUrl =
        'https://www.google.com/maps/search/?api=1&query=The+LNM+Institute+of+Information+Technology&query_place_id=ChIJydGh6CG6bTkRK0zU5MxltVo';
    Uri mapsUri = Uri.parse(mapsUrl);
    Uri googleUri = Uri.parse(googleUrl);
    launchUrl(googleUri);

    // if (await canLaunchUrlString(mapsUrl)) {
    //   return launchUrlString(mapsUrl,
    //       mode: LaunchMode.externalNonBrowserApplication);
    // } else {
    //   throw 'Could not launch $mapsUrl';
    // }
  }

  Future<void> launchMail() async {
    String mailUrl = "mailto:vivacity@lnmiit.ac.in?subject=&body=";
    Uri mapsUri = Uri.parse(mailUrl);
    launchmail(mapsUri);
  }

  Future<void> callNumber(String num) async {
    Uri number = Uri.parse("tel:+91$num");
    launchUrl(number);
  }
}
