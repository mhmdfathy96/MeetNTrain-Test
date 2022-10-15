

import 'tag.dart';
import 'user.dart';

class Event {
  Event({
    required this.id,
    required this.title,
    required this.spots,
    required this.price,
    required this.placeName,
    required this.featuredImage,
    required this.date,
    required this.finishDate,
    required this.paymentMethod,
    required this.users,
    required this.tag,
  });

  int id;
  String title;
  int spots;
  double price;
  String placeName;
  String featuredImage;
  DateTime date;
  DateTime finishDate;
  String paymentMethod;
  List<User> users;
  Tag tag;
}



