class Event {
  final String imageName;
  final String title;
  final String date;

  Event({required this.imageName, required this.title, required this.date});
}

final List<Event> events = [
  Event(
      imageName: "assets/steve-johnson.jpeg",
      title: "Shenzhen Global Design Award 2018",
      date: "4..20-30"),
  Event(
      imageName: "assets/rodion-kutsaev.jpeg",
      title: "Dawn District,Guandong Honkong and Macao",
      date: "4.28-31"),
  Event(
      imageName: "assets/efe-kurnaz.jpg",
      title: "Shenzhen Global Design Award 2018",
      date: "4.20-30")
];
