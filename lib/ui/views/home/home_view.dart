import 'package:flutter/material.dart';

import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/ui/shared/ui_helpers.dart';

import 'package:provider_arc/ui/shared/text_styles.dart';
import 'package:provider_arc/ui/widgets/button_default.dart';
import 'package:provider_arc/ui/widgets/heading.dart';

class HomeView extends StatelessWidget {
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
                    Text(
                      'QUIZ',
                      style: subHeaderStyle,
                      textAlign: TextAlign.center,
                    ),
                    Heading(),
                  ],
                ),
              ),
              UIHelper.verticalSpaceMedium,
              ButtonDefault(
                text: 'START',
                icon: Icons.play_arrow,
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
