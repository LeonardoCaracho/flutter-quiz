import 'dart:async';

import 'package:provider_arc/core/models/question.dart';
import 'package:provider_arc/core/services/api.dart';

import '../models/question.dart';

class QuizService {
  final Api _api;

  int _index = 0;
  int _rightQuestions = 0;

  List<Question> _questions;
  List<Question> get questions => _questions;

  QuizService({Api api}) : _api = api;
}
