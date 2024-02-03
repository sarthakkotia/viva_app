import '../urllauncher.dart';

class logic2 {
  String link = "https://d3lhw1p67h4h5r.cloudfront.net/AAVEG+Rule+Book.pdf";
  void run() {
    UrlLauncher launcher = UrlLauncher();
    Uri url = Uri.parse(link);
    launcher.launchweb(url);
  }
}
