import 'package:flutter/material.dart';
import 'package:uofg_prepare/body/study/quiz/quiz_state.dart';
import 'package:uofg_prepare/services/models.dart';
import 'package:uofg_prepare/shared/sub_headline.dart';
import 'package:uofg_prepare/theme.dart';
import 'package:provider/provider.dart';

class QuizQuestionScreen extends StatelessWidget {
  final Question question;
  const QuizQuestionScreen({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset(
                    'assets/image/illustrations/project_manager/fifteen.png'),
                SubHeadline(data: 'Q: ${question.question}'),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: question.options.map((option) {
                return Container(
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 10),
                  color: themeBlue,
                  child: InkWell(
                    onTap: () {
                      state.selected = option;
                      _bottomSheet(context, option, state);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Icon(
                              state.selected == option
                                  ? Icons.check_circle
                                  : Icons.circle,
                              size: 30,
                              color: themeGrey,
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 15),
                                child: Text(
                                  option.value,
                                  style:
                                      TextStyle(color: themeGrey, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              }).toList()),
        ),
      ],
    );
  }

  _bottomSheet(BuildContext context, Option option, QuizState state) {
    bool correct = option.correct;

    showModalBottomSheet(
        context: context,
        builder: ((context) {
          return SizedBox(
            height: 205,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    correct
                        ? "That's right, well done!"
                        : "Incorrect, try again",
                    style: const TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: correct ? Colors.green : Colors.red),
                    onPressed: () {
                      if (correct) {
                        state.nextPage();
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Text(correct ? 'Next' : 'Try Again'),
                  )
                ]),
          );
        }));
  }
}
