import 'package:flutter/material.dart';
import 'package:provider_arc/ui/shared/text_styles.dart';

class ButtonDefault extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData icon;

  const ButtonDefault({
    @required this.onPressed,
    @required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: () => onPressed(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Text(
                  text,
                  style: subHeaderStyle,
                ),
              ),
              icon != null ? Icon(icon) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
