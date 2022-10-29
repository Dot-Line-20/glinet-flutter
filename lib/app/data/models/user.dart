// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:glint/app/data/models/post.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

// g.dart file generator : flutter pub run build_runner build

@JsonSerializable()
class User {
  int id;
  String email;
  String name;
  DateTime birth;
  String? image;
  DateTime createdAt;
  Media? media;
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.birth,
    required this.image,
    required this.createdAt,
    this.media,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
