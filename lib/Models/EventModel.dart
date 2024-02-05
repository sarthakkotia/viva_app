class EventModel {
  final String Title;
  final String Desc;
  final String Img;
  final String Genre;
  final DateTime DateandTime;
  final String Venue;
  final int Day;
  final String? Poster;

  EventModel(
      {required this.Title,
      required this.DateandTime,
      required this.Day,
      required this.Desc,
      required this.Genre,
      required this.Img,
      required this.Venue,
      this.Poster});
}
