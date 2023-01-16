import 'package:flutter/material.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/theme.dart';

class TestimonialCard extends StatefulWidget {
  final Testimony testimony;

  const TestimonialCard({
    super.key,
    required this.testimony,
  });

  @override
  State<TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<TestimonialCard> {
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
          height: isOpen ? 450 : 70,
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

  final TestimonialCard widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.testimony.intro.name} ${widget.testimony.intro.icon}',
                    style: TextStyle(
                        fontSize: 24,
                        color: themeGrey,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.testimony.intro.course,
                    style: TextStyle(color: themeGrey, fontSize: 20),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    widget.testimony.interview.questions[0].question,
                    style: TextStyle(color: themeGrey, fontSize: 18),
                  ),
                  Text(
                    widget.testimony.interview.questions[0].answer,
                    style: TextStyle(color: themeGrey, fontSize: 16),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    widget.testimony.interview.questions[1].question,
                    style: TextStyle(color: themeGrey, fontSize: 18),
                  ),
                  Text(
                    widget.testimony.interview.questions[1].answer,
                    style: TextStyle(color: themeGrey, fontSize: 16),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    widget.testimony.interview.questions[2].question,
                    style: TextStyle(color: themeGrey, fontSize: 18),
                  ),
                  Text(
                    widget.testimony.interview.questions[2].answer,
                    style: TextStyle(color: themeGrey, fontSize: 16),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          ],
        ),
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

  final TestimonialCard widget;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.testimony.intro.name} ${widget.testimony.intro.icon}',
              style: TextStyle(
                fontSize: 24,
                color: themeGrey,
              ),
            ),
            Text(
              widget.testimony.intro.course,
              style: TextStyle(
                fontSize: 20,
                color: themeGrey,
              ),
            )
          ],
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
