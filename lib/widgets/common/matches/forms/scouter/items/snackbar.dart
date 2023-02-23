
import 'package:flutter/material.dart';

class ScoutingSnackbar extends SnackBar {
  ScoutingSnackbar({
    this.message = 'Data saved successfully', 
    this.color = Colors.black87,
    this.onPressed,
  }) : super(
    content: Text(message),
    backgroundColor: color,
    action: onPressed != null ? SnackBarAction(
      label: 'OK',
      onPressed: onPressed
    ) : null,
  );

  final String message;
  final Color color;
  final VoidCallback? onPressed;
}