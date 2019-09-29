import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class Story extends Equatable {
  final String body;
  final String title;
  final String subtitle;
  final String author;
  final String location;
  final String image;

  Story({
    this.body,
    this.title,
    this.subtitle,
    this.author,
    this.location,
    this.image,
  }) : super([body, title, subtitle, author, location, image]);

  Story copy({
    String body,
    String title,
    String subtitle,
    String author,
    String location,
    String image,
  }) =>
      Story(
          body: body ?? this.body,
          title: title ?? this.title,
          subtitle: subtitle ?? this.subtitle,
          author: author ?? this.author,
          location: location ?? this.location,
          image: image ?? this.image);
}
