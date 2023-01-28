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

AcademicResources _$AcademicResourcesFromJson(Map<String, dynamic> json) =>
    AcademicResources(
      resources: (json['resources'] as List<dynamic>?)
              ?.map((e) => AcademicResource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AcademicResourcesToJson(AcademicResources instance) =>
    <String, dynamic>{
      'resources': instance.resources,
    };

AcademicResource _$AcademicResourceFromJson(Map<String, dynamic> json) =>
    AcademicResource(
      title: json['title'] as String? ?? '',
      link: json['link'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? '',
    );

Map<String, dynamic> _$AcademicResourceToJson(AcademicResource instance) =>
    <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
      'description': instance.description,
      'category': instance.category,
    };

Contacts _$ContactsFromJson(Map<String, dynamic> json) => Contacts(
      contacts: (json['contacts'] as List<dynamic>?)
              ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ContactsToJson(Contacts instance) => <String, dynamic>{
      'contacts': instance.contacts,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      name: json['name'] as String? ?? '',
      link: json['link'] as String? ?? '',
      detail: json['detail'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'name': instance.name,
      'link': instance.link,
      'detail': instance.detail,
      'title': instance.title,
    };

Glossary _$GlossaryFromJson(Map<String, dynamic> json) => Glossary(
      terms: (json['terms'] as List<dynamic>?)
              ?.map((e) => Term.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GlossaryToJson(Glossary instance) => <String, dynamic>{
      'terms': instance.terms,
    };

EnglishLanguage _$EnglishLanguageFromJson(Map<String, dynamic> json) =>
    EnglishLanguage(
      resources: (json['resources'] as List<dynamic>?)
              ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EnglishLanguageToJson(EnglishLanguage instance) =>
    <String, dynamic>{
      'resources': instance.resources,
    };

Extracurricular _$ExtracurricularFromJson(Map<String, dynamic> json) =>
    Extracurricular(
      resources: (json['resources'] as List<dynamic>?)
              ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ExtracurricularToJson(Extracurricular instance) =>
    <String, dynamic>{
      'resources': instance.resources,
    };

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      link: json['link'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'link': instance.link,
      'image': instance.image,
    };

Testimonials _$TestimonialsFromJson(Map<String, dynamic> json) => Testimonials(
      testimony: (json['testimony'] as List<dynamic>?)
              ?.map((e) => Testimony.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TestimonialsToJson(Testimonials instance) =>
    <String, dynamic>{
      'testimony': instance.testimony,
    };

Testimony _$TestimonyFromJson(Map<String, dynamic> json) => Testimony(
      interview: json['interview'] == null
          ? const Interview()
          : Interview.fromJson(json['interview'] as Map<String, dynamic>),
      intro: json['intro'] == null
          ? const TestimonyIntro()
          : TestimonyIntro.fromJson(json['intro'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TestimonyToJson(Testimony instance) => <String, dynamic>{
      'interview': instance.interview,
      'intro': instance.intro,
    };

TestimonyIntro _$TestimonyIntroFromJson(Map<String, dynamic> json) =>
    TestimonyIntro(
      course: json['course'] as String? ?? '',
      name: json['name'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$TestimonyIntroToJson(TestimonyIntro instance) =>
    <String, dynamic>{
      'course': instance.course,
      'name': instance.name,
      'icon': instance.icon,
    };

Interview _$InterviewFromJson(Map<String, dynamic> json) => Interview(
      questions: (json['questions'] as List<dynamic>?)
              ?.map(
                  (e) => InterviewQuestion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$InterviewToJson(Interview instance) => <String, dynamic>{
      'questions': instance.questions,
    };

InterviewQuestion _$InterviewQuestionFromJson(Map<String, dynamic> json) =>
    InterviewQuestion(
      question: json['question'] as String? ?? '',
      answer: json['answer'] as String? ?? '',
    );

Map<String, dynamic> _$InterviewQuestionToJson(InterviewQuestion instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };

Term _$TermFromJson(Map<String, dynamic> json) => Term(
      definition: json['definition'] as String? ?? '',
      term: json['term'] as String? ?? '',
    );

Map<String, dynamic> _$TermToJson(Term instance) => <String, dynamic>{
      'term': instance.term,
      'definition': instance.definition,
    };

ToDoList _$ToDoListFromJson(Map<String, dynamic> json) => ToDoList(
      todos: (json['todos'] as List<dynamic>?)
              ?.map((e) => ToDo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ToDoListToJson(ToDoList instance) => <String, dynamic>{
      'todos': instance.todos,
    };

ToDo _$ToDoFromJson(Map<String, dynamic> json) => ToDo(
      complete: json['complete'] as bool? ?? false,
      detail: json['detail'] as String? ?? '',
    );

Map<String, dynamic> _$ToDoToJson(ToDo instance) => <String, dynamic>{
      'detail': instance.detail,
      'complete': instance.complete,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      uid: json['uid'] as String? ?? '',
      total: json['total'] as int? ?? 0,
      quizes: json['quizes'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'uid': instance.uid,
      'total': instance.total,
      'quizes': instance.quizes,
    };

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'questions': instance.questions,
      'id': instance.id,
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
      contents: (json['contents'] as List<dynamic>?)
              ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      image: json['image'] as String? ?? '',
      quiz: json['quiz'] == null
          ? const Quiz()
          : Quiz.fromJson(json['quiz'] as Map<String, dynamic>),
      intro: json['intro'] == null
          ? const Intro()
          : Intro.fromJson(json['intro'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'contents': instance.contents,
      'quiz': instance.quiz,
      'intro': instance.intro,
    };

Intro _$IntroFromJson(Map<String, dynamic> json) => Intro(
      content: json['content'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$IntroToJson(Intro instance) => <String, dynamic>{
      'content': instance.content,
      'image': instance.image,
    };

Block _$BlockFromJson(Map<String, dynamic> json) => Block(
      body: json['body'] as String? ?? '',
      headline: json['headline'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$BlockToJson(Block instance) => <String, dynamic>{
      'body': instance.body,
      'headline': instance.headline,
      'image': instance.image,
    };
