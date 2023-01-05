import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<School>> getSchools() async {
    var ref = _db.collection('schools');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var schools = data.map((d) => School.fromJson(d));
    return schools.toList();
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
