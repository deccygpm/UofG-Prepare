import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/prepare/todo/todo_tile.dart';
import 'package:uofg_prepare/services/firestore.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  initState() {
    super.initState();
    FirestoreService().getToDoList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ToDoList>(
        stream: FirestoreService().streamToDoList(),
        builder: (context, stream) {
          if (stream.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (stream.hasError) {
            return const LoadingScreen();
          } else if (stream.hasData) {
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
                          return ToDoTile(index: index, list: stream.data!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const LoadingScreen();
          }
        });
  }
}
