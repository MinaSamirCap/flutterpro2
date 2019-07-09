import 'package:flutter/material.dart';
import 'package:flutter_course_2/updatedcourse/answer.dart';
import 'package:flutter_course_2/updatedcourse/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions.elementAt(questionIndex)['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              title: answer['text'],
              selectHandler: () => answerQuestion(answer['score']));
        }).toList(),
      ],
    );
  }
}
