import 'package:flutter/material.dart';
import 'package:l2_transition/body/prepare/todo/todo_state.dart';
import 'package:l2_transition/theme.dart';
import 'package:provider/provider.dart';

class ToDoTile extends StatefulWidget {
  final int index;
  const ToDoTile({
    super.key,
    required this.index,
  });

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<ToDoState>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 3,
            ),
          ],
          color: accentBlue,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              state.toDoList!.todos[widget.index].detail,
              style: TextStyle(color: themeGrey, fontSize: 16),
            ),
            Checkbox(
              activeColor: themeGrey,
              checkColor: accentBlue,
              value: state.toDoList!.todos[widget.index].complete,
              onChanged: (value) {
                state.updateToDoComplete(value, widget.index);
              },
              side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(width: 1.0, color: themeGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
