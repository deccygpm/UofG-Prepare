// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      uid: json['uid'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'questions': instance.questions,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      question: json['question'] as String? ?? '',
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'options': instance.options,
      'question': instance.question,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      value: json['value'] as String? ?? '',
      correct: json['correct'] as bool? ?? false,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'value': instance.value,
      'correct': instance.correct,
    };

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
      icon: json['icon'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
    };

School _$SchoolFromJson(Map<String, dynamic> json) => School(
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      fullName: json['fullName'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
      'sections': instance.sections,
      'fullName': instance.fullName,
      'id': instance.id,
    };

Study _$StudyFromJson(Map<String, dynamic> json) => Study(
      name: json['name'] as String? ?? '',
      topics: (json['topics'] as List<dynamic>?)
              ?.map((e) => Topic.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$StudyToJson(Study instance) => <String, dynamic>{
      'name': instance.name,
      'topics': instance.topics,
    };

Topic _$TopicFromJson(Map<String, dynamic> json) => Topic(
      name: json['name'] as String? ?? '',
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      image: json['image'] as String? ?? '',
      quiz: json['quiz'] == null
          ? const Quiz()
          : Quiz.fromJson(json['quiz'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'content': instance.content,
      'quiz': instance.quiz,
    };
