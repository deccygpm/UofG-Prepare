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
    return StreamBuilder<ToDoList>(
        stream: FirestoreService().streamToDoList(),
        builder: (context, stream) {
          if (stream.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          } else if (stream.hasError) {
            return Text(stream.error.toString());
          } else if (stream.hasData) {
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
                            const Divider(
                              color: Colors.transparent,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: stream.data!.todos.length,
                                itemBuilder: (context, index) {
                                  return ToDoTile(
                                      index: index, list: stream.data!);
                                },
                              ),
                            ),
                          ],
                        ),
                      ));
                });
          } else {
            return Text('DB Issue');
          }
        });
  }
}
