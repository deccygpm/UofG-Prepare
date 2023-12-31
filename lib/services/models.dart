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
class AcademicResources {
  final List<AcademicResource> resources;

  AcademicResources({
    this.resources = const [],
  });

  factory AcademicResources.fromJson(Map<String, dynamic> json) =>
      _$AcademicResourcesFromJson(json);
  Map<String, dynamic> toJson() => _$AcademicResourcesToJson(this);
}

@JsonSerializable()
class AcademicResource {
  final String title;
  final String link;
  final String description;
  final String category;

  AcademicResource({
    this.title = '',
    this.link = '',
    this.description = '',
    this.category = '',
  });

  factory AcademicResource.fromJson(Map<String, dynamic> json) =>
      _$AcademicResourceFromJson(json);
  Map<String, dynamic> toJson() => _$AcademicResourceToJson(this);
}

@JsonSerializable()
class Contacts {
  final List<Contact> contacts;

  Contacts({
    this.contacts = const [],
  });

  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);
  Map<String, dynamic> toJson() => _$ContactsToJson(this);
}

@JsonSerializable()
class Contact {
  final String name;
  final String link;
  final String detail;
  final String title;

  Contact({
    this.name = '',
    this.link = '',
    this.detail = '',
    this.title = '',
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
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
  final List<Resource> resources;

  EnglishLanguage({
    this.resources = const [],
  });

  factory EnglishLanguage.fromJson(Map<String, dynamic> json) =>
      _$EnglishLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$EnglishLanguageToJson(this);
}

@JsonSerializable()
class Extracurricular {
  final List<Resource> resources;

  Extracurricular({
    this.resources = const [],
  });

  factory Extracurricular.fromJson(Map<String, dynamic> json) =>
      _$ExtracurricularFromJson(json);
  Map<String, dynamic> toJson() => _$ExtracurricularToJson(this);
}

@JsonSerializable()
class Resource {
  final String name;
  final String description;
  final String link;
  final String image;

  Resource({
    this.name = '',
    this.description = '',
    this.link = '',
    this.image = '',
  });

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}

@JsonSerializable()
class Testimonials {
  final List<Testimony> testimony;

  Testimonials({
    this.testimony = const [],
  });

  factory Testimonials.fromJson(Map<String, dynamic> json) =>
      _$TestimonialsFromJson(json);
  Map<String, dynamic> toJson() => _$TestimonialsToJson(this);
}

@JsonSerializable()
class Testimony {
  final Interview interview;
  final TestimonyIntro intro;

  Testimony({
    this.interview = const Interview(),
    this.intro = const TestimonyIntro(),
  });

  factory Testimony.fromJson(Map<String, dynamic> json) =>
      _$TestimonyFromJson(json);
  Map<String, dynamic> toJson() => _$TestimonyToJson(this);
}

@JsonSerializable()
class TestimonyIntro {
  final String course;
  final String name;
  final String icon;

  const TestimonyIntro({
    this.course = '',
    this.name = '',
    this.icon = '',
  });

  factory TestimonyIntro.fromJson(Map<String, dynamic> json) =>
      _$TestimonyIntroFromJson(json);
  Map<String, dynamic> toJson() => _$TestimonyIntroToJson(this);
}

@JsonSerializable()
class Interview {
  final List<InterviewQuestion> questions;

  const Interview({
    this.questions = const [],
  });

  factory Interview.fromJson(Map<String, dynamic> json) =>
      _$InterviewFromJson(json);
  Map<String, dynamic> toJson() => _$InterviewToJson(this);
}

@JsonSerializable()
class InterviewQuestion {
  final String question;
  final String answer;

  InterviewQuestion({
    this.question = '',
    this.answer = '',
  });

  factory InterviewQuestion.fromJson(Map<String, dynamic> json) =>
      _$InterviewQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$InterviewQuestionToJson(this);
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
  final String link;

  Topic(
      {this.name = '',
      this.contents = const [],
      this.image = '',
      this.quiz = const Quiz(),
      this.intro = const Intro(),
      this.link = ''});

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
