Future<void> helperf() async {
  var d = await Future.delayed(
    Duration(seconds: 5),
    () {
      print("done");
    },
  );
}

void main() {
  print("test");
  helperf().then((value) => print("testf"));
}
