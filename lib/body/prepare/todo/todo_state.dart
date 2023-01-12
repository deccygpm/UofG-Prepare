import 'package:flutter/material.dart';
import 'package:l2_transition/login/auth_wrapper.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/models.dart';

class ToDoState with ChangeNotifier {
  ToDoList? _list;

  ToDoState() {
    _list = ToDoList();
    listInit();
  }

  ToDoList? get toDoList => _list;

  set toDoList(ToDoList? newList) {
    _list = newList;
    notifyListeners();
  }

  void listInit() async {
    var dbList = await FirestoreService().getToDoList();
    toDoList = dbList;
  }

  void updateToDoComplete(bool? value, int index) {
    _list!.todos[index].complete = !_list!.todos[index].complete;
    notifyListeners();
  }
}
