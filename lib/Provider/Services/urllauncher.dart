import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future<void> launchweb(Uri url) {
    return launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> launchmail(Uri url) {
    return launchUrl(url, mode: LaunchMode.platformDefault);
  }

  Future<void> launchURL() async {
    String googleUrl =
        'https://www.google.com/maps/place/The+LNM+Institute+of+Information+Technology/@26.9362886,75.9139619,16z/data=!4m10!1m2!2m1!1sThe+LNM+Institute+Of+Information+Technology!3m6!1s0x396dba21e8a1d1c9:0x5ab565cce4d44c2b!8m2!3d26.9362886!4d75.9234891!15sCitUaGUgTE5NIEluc3RpdHV0ZSBPZiBJbmZvcm1hdGlvbiBUZWNobm9sb2d5kgEKdW5pdmVyc2l0eeABAA!16s%2Fm%2F04cql40?entry=ttu';
    Uri googleUri = Uri.parse(googleUrl);
    launchUrl(googleUri);
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

  Future<void> launchInstaPage() async {
    String instaPage = "https://www.instagram.com/vivacity_lnmiit";
    Uri instaUri = Uri.parse(instaPage);
    launchUrl(instaUri, mode: LaunchMode.externalApplication);
  }

  Future<void> launchLinkedInPage() async {
    String linkedinPage = "https://www.linkedin.com/company/vivacity-lnmiit";
    Uri linkedinUri = Uri.parse(linkedinPage);
    launchUrl(linkedinUri, mode: LaunchMode.externalApplication);
  }

  Future<void> launchYtPage() async {
    String ytPage = "https://www.youtube.com/@VivacityLNMIIT";
    Uri ytUri = Uri.parse(ytPage);
    launchUrl(ytUri, mode: LaunchMode.externalApplication);
  }

  Future<void> launchKotia() async {
    String instaPage = "https://www.instagram.com/sarthak.kotia";
    Uri instaUri = Uri.parse(instaPage);
    launchUrl(instaUri, mode: LaunchMode.externalApplication);
  }

  Future<void> launchAyush() async {
    String instaPage = "https://www.instagram.com/aystarc_";
    Uri instaUri = Uri.parse(instaPage);
    launchUrl(instaUri, mode: LaunchMode.externalApplication);
  }
}
