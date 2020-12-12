import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/ui/shared/base_model.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/core/models/question.dart';

class QuizViewModel extends BaseModel {
  Api api;

  List<Question> _questions;
  int _index = 0;

  double _score = 0;
  double get score => _score;

  StreamController<Question> _currentQuestion = StreamController<Question>();
  Stream<Question> get currentQuestion => _currentQuestion.stream;

  QuizViewModel({
    @required this.api,
  }) {
    fetchQuestions();
  }

  void fetchQuestions() {
    api.getQuestions().asStream().listen((response) {
      _questions = response;
      _questions.shuffle();
      _currentQuestion.add(_questions[_index]);
    }).onError((error) {
      _currentQuestion.addError(error.message);
    });
  }

  void nextQuestion(context) {
    if (hasQuizFinished()) {
      Navigator.pushNamed(
        context,
        RoutePaths.Result,
        arguments: getFinalScore(),
      );
      return;
    }
    _index++;
    var question = _questions[_index];
    question.possibleAnswers.shuffle();
    _currentQuestion.add(question);
  }

  void checkAnswer(String answer, context) {
    if (_questions[_index].correctAnswer == answer) {
      _score++;
    }
    nextQuestion(context);
  }

  bool hasQuizFinished() {
    return _index == _questions.length - 1;
  }

  double getFinalScore() {
    return (_score / _questions.length) * 100;
  }
}
