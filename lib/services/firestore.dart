import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uofg_prepare/services/auth.dart';
import 'package:uofg_prepare/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }

  Stream<ToDoList> streamToDoList() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('todo-reports').doc(user.uid);
        return ref.snapshots().map(((doc) => ToDoList.fromJson(doc.data()!)));
      } else {
        return Stream.fromIterable([ToDoList()]);
      }
    });
  }

  Future<AcademicResources> getAcademicResources() async {
    var ref = _db.collection('socs-sections').doc('academic-resources');
    var snapshot = await ref.get();
    return AcademicResources.fromJson(snapshot.data() ?? {});
  }

  Future<Contacts> getContacts() async {
    var ref = _db.collection('socs-sections').doc('contacts');
    var snapshot = await ref.get();
    return Contacts.fromJson(snapshot.data() ?? {});
  }

  Future<Testimonials> getTestimonials() async {
    var ref = _db.collection('socs-sections').doc('testimonials');
    var snapshot = await ref.get();
    return Testimonials.fromJson(snapshot.data() ?? {});
  }

  Future<Extracurricular> getExtracurricular() async {
    var ref = _db.collection('socs-sections').doc('extracurricular');
    var snapshot = await ref.get();
    return Extracurricular.fromJson(snapshot.data() ?? {});
  }

  Future<EnglishLanguage> getEnglishLanguage() async {
    var ref = _db.collection('socs-sections').doc('english-language');
    var snapshot = await ref.get();
    return EnglishLanguage.fromJson(snapshot.data() ?? {});
  }

  Future<Glossary> getGlossary() async {
    var ref = _db.collection('socs-sections').doc('glossary');
    var snapshot = await ref.get();
    return Glossary.fromJson(snapshot.data() ?? {});
  }

  Future<void> updateUserReport(Quiz quiz) {
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);

    var data = {
      'total': FieldValue.increment(1),
      'quizes': {
        quiz.id: FieldValue.arrayUnion([quiz.id])
      }
    };

    return ref.set(data, SetOptions(merge: true));
  }

  Future<void> updateUserToDoList(int index) async {
    var user = AuthService().user!;
    var ref = _db.collection('todo-reports').doc(user.uid);
    var snapshot = await ref.get();

    var newData = snapshot.data();
    newData!['todos'][index]['complete'] = !newData['todos'][index]['complete'];

    await ref.set(newData);
  }

  Future<ToDoList> getToDoList() async {
    var alreadyExists = await _userToDoReportExists();
    if (alreadyExists == true) {
      return _getUserToDoReport();
    } else {
      _createUserToDoList();
      return _getUserToDoReport();
    }
  }

  Future<void> _createUserToDoList() async {
    var ref = _db.collection('todo-reports').doc('1');
    var standard = await ref.get();
    await _db
        .collection('todo-reports')
        .doc(AuthService().user!.uid)
        .set(standard.data() ?? {});
  }

  Future<ToDoList> _getUserToDoReport() async {
    var ref = _db.collection('todo-reports').doc(AuthService().user!.uid);
    var snapshot = await ref.get();
    return ToDoList.fromJson(snapshot.data() ?? {});
  }

  Future<bool> _userToDoReportExists() async {
    var ref = _db.collection('todo-reports').doc(AuthService().user!.uid);
    var snapshot = await ref.get();
    return snapshot.exists;
  }

  Future<List<School>> getSchools() async {
    var ref = _db.collection('schools');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var schools = data.map((d) => School.fromJson(d));
    return schools.toList();
  }

  Future<List<Study>> getAllStudySections() async {
    var ref = _db.collection('study');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var sections = data.map((d) => Study.fromJson(d));
    return sections.toList();
  }

  Future<Study> getStudySection(String section) async {
    var ref = _db.collection('study').doc(section);
    var snapshot = await ref.get();
    return Study.fromJson(snapshot.data() ?? {});
  }

  Future<School> getSchool(school) async {
    var ref = _db.collection('schools').doc(school);
    var snapshot = await ref.get();
    return School.fromJson(snapshot.data() ?? {});
  }

  Future<List<AppUser>> getUsers() async {
    var ref = _db.collection('users');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var users = data.map((d) => AppUser.fromJson(d));
    return users.toList();
  }

  Future<List<Section>> getSections() async {
    var ref = _db.collection('sections');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var sections = data.map((d) => Section.fromJson(d));
    return sections.toList();
  }

  Future<void> addUser(
      String uid, String firstName, String lastName, String email) async {
    final appUser = <String, String>{
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };

    await _db.collection('users').doc(uid).set(appUser);
  }

  Future<void> addUserReport(String uid) async {
    final userReport = {
      'uid': uid,
      'total': 0,
      'quizes': {'quiz-id': '0'}
    };

    await _db.collection('reports').doc(uid).set(userReport);
  }

  Future<AppUser> getCurrentUser() async {
    var ref = _db.collection('users').doc(AuthService().user!.uid.toString());
    var snapshot = await ref.get();
    return AppUser.fromJson(snapshot.data() ?? {});
  }

  Future<bool> userDocExists() async {
    var ref = _db.collection('users');
    var doc = await ref.doc(AuthService().user!.uid).get();
    if (doc.exists) {
      return true;
    } else {
      return false;
    }
  }
}
