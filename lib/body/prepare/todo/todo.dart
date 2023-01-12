import 'package:flutter/material.dart';
import 'package:l2_transition/body/prepare/todo/todo_state.dart';
import 'package:l2_transition/body/prepare/todo/todo_tile.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';
import 'package:provider/provider.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ToDoState(),
        builder: (context, snapshot) {
          var state = Provider.of<ToDoState>(context);
          return Scaffold(
              appBar: const CustomAppBar(),
              body: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Headline(data: 'To Do List', color: themeBlue),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.toDoList!.todos.length,
                        itemBuilder: (context, index) {
                          return ToDoTile(index: index);
                        },
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
