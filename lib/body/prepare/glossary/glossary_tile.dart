import 'package:flutter/material.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/shared.dart';
import 'package:uofg_prepare/theme.dart';

class GlossaryTile extends StatefulWidget {
  final Term term;
  const GlossaryTile({
    super.key,
    required this.term,
  });

  @override
  State<GlossaryTile> createState() => _GlossaryTileState();
}

class _GlossaryTileState extends State<GlossaryTile> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: accentBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 800),
          height: isOpen ? 300 : 50,
          child: isOpen
              ? SingleChildScrollView(
                  child: _TrueColumn(
                    widget: widget,
                  ),
                )
              : _FalseRow(widget: widget, isOpen: isOpen),
        ),
      ),
    );
  }
}

class _TrueColumn extends StatelessWidget {
  const _TrueColumn({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final GlossaryTile widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '💡',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              widget.term.term,
              style: TextStyle(
                  fontSize: 18, color: themeGrey, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_downward,
              size: 30,
              color: themeGrey,
            )
          ],
        ),
        FancyText(data: widget.term.definition, color: themeGrey)
      ],
    );
  }
}

class _FalseRow extends StatelessWidget {
  const _FalseRow({
    Key? key,
    required this.widget,
    required this.isOpen,
  }) : super(key: key);

  final GlossaryTile widget;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '💡',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          widget.term.term,
          style: TextStyle(fontSize: 18, color: themeGrey),
        ),
        isOpen
            ? Icon(
                Icons.arrow_downward,
                size: 30,
                color: themeGrey,
              )
            : Icon(
                Icons.arrow_back,
                color: themeGrey,
                size: 30,
              ),
      ],
    );
  }
}
