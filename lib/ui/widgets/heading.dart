import 'package:flutter/material.dart';
import 'package:provider_arc/ui/shared/text_styles.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      child: Text(
        'Origem das Montadoras',
        style: headerStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
