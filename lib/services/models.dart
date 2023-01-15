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
class Glossary {
  final List<Term> terms;

  Glossary({
    this.terms = const [],
  });

  factory Glossary.fromJson(Map<String, dynamic> json) =>
      _$GlossaryFromJson(json);
  Map<String, dynamic> toJson() => _$GlossaryToJson(this);
}

@JsonSerializable()
class EnglishLanguage {
  final List<EnglishResource> resources;

  EnglishLanguage({
    this.resources = const [],
  });

  factory EnglishLanguage.fromJson(Map<String, dynamic> json) =>
      _$EnglishLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$EnglishLanguageToJson(this);
}

@JsonSerializable()
class EnglishResource {
  final String name;
  final String description;
  final String link;
  final String image;

  EnglishResource({
    this.name = '',
    this.description = '',
    this.link = '',
    this.image = '',
  });

  factory EnglishResource.fromJson(Map<String, dynamic> json) =>
      _$EnglishResourceFromJson(json);
  Map<String, dynamic> toJson() => _$EnglishResourceToJson(this);
}

@JsonSerializable()
class Term {
  final String term;
  final String definition;

  Term({
    this.definition = '',
    this.term = '',
  });

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);
  Map<String, dynamic> toJson() => _$TermToJson(this);
}

@JsonSerializable()
class ToDoList {
  final List<ToDo> todos;

  ToDoList({
    this.todos = const [],
  });

  factory ToDoList.fromJson(Map<String, dynamic> json) =>
      _$ToDoListFromJson(json);
  Map<String, dynamic> toJson() => _$ToDoListToJson(this);
}

@JsonSerializable()
class ToDo {
  final String detail;
  bool complete;

  ToDo({
    this.complete = false,
    this.detail = '',
  });

  factory ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);
  Map<String, dynamic> toJson() => _$ToDoToJson(this);
}

@JsonSerializable()
class Report {
  final String uid;
  final int total;
  Map quizes;

  Report({
    this.uid = '',
    this.total = 0,
    this.quizes = const {},
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable()
class Quiz {
  final List<Question> questions;
  final String id;

  const Quiz({this.questions = const [], this.id = ''});

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
  final List<Block> contents;
  final Quiz quiz;
  final Intro intro;

  Topic({
    this.name = '',
    this.contents = const [],
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

@JsonSerializable()
class Block {
  final String body;
  final String headline;
  final String image;

  const Block({
    this.body = '',
    this.headline = '',
    this.image = '',
  });

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
  Map<String, dynamic> toJson() => _$BlockToJson(this);
}
