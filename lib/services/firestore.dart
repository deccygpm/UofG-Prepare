import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:l2_transition/services/auth.dart';
import 'package:l2_transition/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<AppUser>> getUsers() async {
    var ref = _db.collection('users');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var users = data.map((d) => AppUser.fromJson(d));
    return users.toList();
  }
}
