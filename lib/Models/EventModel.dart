class EventModel {
  String Title;
  String Desc;
  String Img;
  String Genre;
  DateTime DateandTime;
  String Venue;
  int Day;

  EventModel(
      {required this.Title,
      required this.DateandTime,
      required this.Day,
      required this.Desc,
      required this.Genre,
      required this.Img,
      required this.Venue});
}
