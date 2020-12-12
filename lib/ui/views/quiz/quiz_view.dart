import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/core/models/question.dart';
import 'package:provider_arc/ui/shared/ui_helpers.dart';
import 'package:provider_arc/ui/views/quiz/quiz_view_model.dart';

import 'package:provider_arc/ui/shared/text_styles.dart';
import 'package:provider_arc/ui/widgets/centered_circular_progress.dart';
import 'widgets/questions_wrapper/question_wrapper.dart';

class QuizView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuizViewModel>.value(
      value: QuizViewModel(
        api: Provider.of(context),
      ),
      child: Consumer<QuizViewModel>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Origem das Montadoras',
            ),
            leading: new IconButton(
              icon: new Icon(Icons.keyboard_arrow_left),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, RoutePaths.Home),
            ),
          ),
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<Question>(
                stream: model.currentQuestion,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error,
                        style: subHeaderStyle,
                      ),
                    );
                  }

                  if (!snapshot.hasData) {
                    return CenteredCircularProgress();
                  }

                  var question = snapshot.data;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QuestionWrapper(
                        alternatives: question.possibleAnswers,
                        question: question.question,
                        checkAnswer: model.checkAnswer,
                      ),
                      UIHelper.verticalSpaceMedium,
                      Text(
                        'Questão ${model.index + 1} de ${model.totalQuestions}',
                        style: subHeaderStyle,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
