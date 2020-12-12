import 'dart:io';

import 'package:dio/dio.dart';
import 'package:provider_arc/core/models/question.dart';
import 'package:provider_arc/core/utils/failure.dart';

class Api {
  static const endpoint = 'https://my-json-server.typicode.com';

  Future<List<Question>> getQuestions() async {
    try {
      var response = await Dio().get(
        '$endpoint/leonardocaracho/basic-stuff/results',
      );

      var questions = new List<Question>.from(
        response.data.map((q) => new Question.fromJson(q)).toList(),
      );

      return questions;
    } on DioError catch (error) {
      if (error.response.statusCode == 404) {
        throw Failure('Rota não encontrada. 😑');
      }
      if (error.response.statusCode == 400) {
        throw Failure('Erro ao processar requisição. 😑');
      }
      if (error.response.statusCode == 408) {
        throw Failure(
            'O servidor demorou a responder, verifique sua conexão. 😑');
      }

      throw Failure('Erro ao carregar perguntas. 😑');
    }
  }
}
