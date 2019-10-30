import 'package:flutter/material.dart';

class PLOutlinedButton extends StatelessWidget {
  const PLOutlinedButton({
    @required this.title,
    this.onPressed,
    this.color,
  });

  final String title;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var _color = color == null ? Theme.of(context).colorScheme.primary : color;

    return FlatButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: _color,
        ),
      ),
      splashColor: _color.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: _color,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
