import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/ui/shared/ui_helpers.dart';

import 'package:provider_arc/ui/shared/text_styles.dart';
import 'package:provider_arc/ui/widgets/button_default.dart';
import 'package:provider_arc/ui/widgets/heading.dart';

class ResultView extends StatelessWidget {
  final double finalScore;

  const ResultView({this.finalScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UIHelper.horizontalSpaceSmall,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Heading(),
                    UIHelper.verticalSpaceMedium,
                    RatingBarIndicator(
                      rating: (finalScore / 100) * 5.0,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 40.0,
                      direction: Axis.horizontal,
                    ),
                    UIHelper.verticalSpaceMedium,
                    Text(
                      'VOCÊ ACERTOU',
                      style: subHeaderStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$finalScore%',
                      style: headerStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpaceMedium,
              ButtonDefault(
                icon: Icons.refresh,
                text: 'Reiniciar',
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.Quiz);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
