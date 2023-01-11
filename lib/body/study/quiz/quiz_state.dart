import 'package:flutter/material.dart';
import 'package:l2_transition/services/models.dart';

class QuizState with ChangeNotifier {
  double _progress = 0;
  Option? _selected;

  final PageController controller = PageController();

  double get progress => _progress;
  Option? get selected => _selected;

  set progress(double value) {
    _progress = value;
    notifyListeners();
  }

  set selected(Option? option) {
    _selected = option;
    notifyListeners();
  }

  void nextPage() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }
}
