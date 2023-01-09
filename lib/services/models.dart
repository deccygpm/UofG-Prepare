import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class AppUser {
  final String uid;
  final String firstName;
  final String lastName;
  final String email;

  AppUser({
    this.uid = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
  });

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}

@JsonSerializable()
class Section {
  final String icon;
  final String name;

  Section({
    this.icon = '',
    this.name = '',
  });

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}

@JsonSerializable()
class School {
  final List<Section> sections;
  final String fullName;
  final String id;

  School({
    this.sections = const [],
    this.fullName = '',
    this.id = '',
  });

  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}

@JsonSerializable()
class Study {
  final String name;
  final List<Topic> topics;

  Study({
    this.name = '',
    this.topics = const [],
  });

  factory Study.fromJson(Map<String, dynamic> json) => _$StudyFromJson(json);
  Map<String, dynamic> toJson() => _$StudyToJson(this);
}

@JsonSerializable()
class Topic {
  final String name;
  final List<String> content;

  Topic({
    this.name = '',
    this.content = const [],
  });

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}
