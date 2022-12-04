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
  final String name;
  final String icon;

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
  final String fullName;
  final List<Section> sections;

  School({
    this.fullName = '',
    this.sections = const [],
  });

  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}
