import 'package:flutter/material.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/models.dart';

class ToDoState with ChangeNotifier {
  ToDoList? _list;
  bool? _updated;

  ToDoState() {
    _list = ToDoList();
    _updated = false;
  }

  ToDoList? get toDoList => _list;
  bool? get updated => _updated;

  set toDoList(ToDoList? newList) {
    _list = newList;
    notifyListeners();
  }

  set updated(bool? value) {
    _updated = value;
    notifyListeners();
  }

  void updateToDoComplete(bool? value, int index) {
    _list!.todos[index].complete = !_list!.todos[index].complete;
    FirestoreService().updateUserToDoList(index);
    notifyListeners();
  }
}
