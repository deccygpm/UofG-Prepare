import 'package:flutter/material.dart';
import 'package:l2_transition/body/study/topic/topic_quiz.dart';
import 'package:l2_transition/services/models.dart';
import 'package:l2_transition/shared/shared.dart';
import 'package:l2_transition/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopicContentScreen extends StatefulWidget {
  final List<Block> content;
  final Quiz quiz;

  const TopicContentScreen({
    super.key,
    required this.content,
    required this.quiz,
  });

  @override
  State<TopicContentScreen> createState() => _TopicContentScreenState();
}

class _TopicContentScreenState extends State<TopicContentScreen> {
  bool onLastPage = false;
  bool onFirstPage = true;

  late final List<Block> _content = widget.content;
  late final Quiz _quiz = widget.quiz;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      backgroundColor: themeBlue,
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                onFirstPage = (index == 0);
                onLastPage = (index == (_content.length - 1));
              });
            },
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            itemCount: _content.length,
            itemBuilder: ((context, index) {
              return Center(
                  child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 3,
                    ),
                  ],
                  color: themeGrey,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: MediaQuery.of(context).size.height * .6,
                width: MediaQuery.of(context).size.width * 0.9,
                child: FancyText(data: _content[index].body),
              ));
            }),
          ),
          Container(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                onFirstPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Back',
                          style: TextStyle(
                              fontSize: 14,
                              color: themeGrey,
                              fontWeight: FontWeight.bold),
                        ))
                    : GestureDetector(
                        onTap: () {
                          controller.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text('Back',
                            style: TextStyle(
                                fontSize: 14,
                                color: themeGrey,
                                fontWeight: FontWeight.bold)),
                      ),
                SmoothPageIndicator(
                  controller: controller,
                  count: _content.length,
                  effect: SlideEffect(
                      activeDotColor: Colors.amber, dotColor: themeGrey),
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TopicQuizScreen(quiz: _quiz),
                          ));
                        },
                        child: Text(
                          'Quiz',
                          style: TextStyle(
                              fontSize: 14,
                              color: themeGrey,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 14,
                              color: themeGrey,
                              fontWeight: FontWeight.bold),
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
