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
class Quiz {
  final List<Question> questions;

  const Quiz({
    this.questions = const [],
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable()
class Question {
  final List<Option> options;
  final String question;

  Question({
    this.options = const [],
    this.question = '',
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Option {
  final String value;
  final bool correct;

  Option({
    this.value = '',
    this.correct = false,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
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
  final String image;
  final String name;
  final List<String> content;
  final Quiz quiz;
  final Intro intro;

  Topic({
    this.name = '',
    this.content = const [],
    this.image = '',
    this.quiz = const Quiz(),
    this.intro = const Intro(),
  });

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}

@JsonSerializable()
class Intro {
  final String content;
  final String image;

  const Intro({
    this.content = '',
    this.image = '',
  });

  factory Intro.fromJson(Map<String, dynamic> json) => _$IntroFromJson(json);
  Map<String, dynamic> toJson() => _$IntroToJson(this);
}
