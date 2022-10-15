
import '../../domain/entities/event.dart';
import '../../domain/entities/tag.dart';
import '../../domain/entities/user.dart';

class EventModel extends Event {
  EventModel({
    required int id,
    required String title,
    required int spots,
    required double price,
    required String placeName,
    required String featuredImage,
    required DateTime date,
    required DateTime finishDate,
    required String paymentMethod,
    required List<User> users,
    required Tag tag,
  }) : super(
    id: id,
    title:title,
    spots:spots,
    price:price,
    placeName:placeName,
    featuredImage:featuredImage,
    date:date,
    finishDate:finishDate,
    paymentMethod:paymentMethod,
    users:users,
    tag:tag,);
  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        title: json["title"],
        spots: json["spots"],
        price: double.parse(json["price"].toString()) ,
        placeName: json["placeName"],
        featuredImage: json["featuredImage"],
        date: DateTime.parse(json["date"]),
        finishDate: DateTime.parse(json["finish_date"]),
        paymentMethod: json["paymentMethod"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        tag: Tag.fromJson(json["tag"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "spots": spots,
        "price": price,
        "placeName": placeName,
        "featuredImage": featuredImage,
        "date": date.toIso8601String(),
        "finish_date": finishDate.toIso8601String(),
        "paymentMethod": paymentMethod,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "tag": tag.toJson(),
      };
}
