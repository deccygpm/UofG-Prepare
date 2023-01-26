import 'package:flutter/material.dart';
import 'package:l2_transition/services/firestore.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/theme.dart';

class ToDoTile extends StatefulWidget {
  final int index;
  final ToDoList list;
  const ToDoTile({
    super.key,
    required this.index,
    required this.list,
  });

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: Text(
                widget.list.todos[widget.index].detail,
                style: TextStyle(
                  color: themeGrey,
                  fontSize: 16,
                ),
                softWrap: true,
              ),
            ),
            Checkbox(
              activeColor: themeGrey,
              checkColor: accentBlue,
              value: widget.list.todos[widget.index].complete,
              onChanged: (value) {
                widget.list.todos[widget.index].complete =
                    !widget.list.todos[widget.index].complete;
                FirestoreService().updateUserToDoList(widget.index);
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
