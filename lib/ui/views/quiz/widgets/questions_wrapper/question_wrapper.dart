import 'package:flutter/material.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';

import 'package:provider_arc/ui/shared/text_styles.dart';
import 'package:provider_arc/ui/shared/ui_helpers.dart';

class QuestionWrapper extends StatelessWidget {
  final String question;
  final List<String> alternatives;
  final Function checkAnswer;

  QuestionWrapper({
    @required this.alternatives,
    @required this.checkAnswer,
    @required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Expanded(
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "Qual a origem?\n $question",
                  style: headerStyle,
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalSpaceMedium,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: alternatives.length,
                  itemBuilder: (context, index) {
                    var alternative = alternatives[index];

                    return GestureDetector(
                      onTap: () => checkAnswer(alternative, context),
                      child: Card(
                        color: lightBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            alternative,
                            style: subHeaderStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
