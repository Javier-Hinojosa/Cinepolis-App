import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.text, required this.onPressed, this.color = Colors.blue});

  final GestureTapCallback onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
                Theme.of(context).primaryColor),
            foregroundColor: WidgetStateProperty.all<Color>(
                Theme.of(context).inputDecorationTheme.fillColor!)),
        onPressed: () => onPressed(),
        child: Container(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.all(10)),
      ),
    );
  }

  Color defineColor(BuildContext context) {
    if (color == Colors.blue) {
      return Theme.of(context).colorScheme.secondary;
    } else {
      return color;
    }
  }
}
