import 'package:flutter/material.dart';

ButtonStyle customOutlineButtonStyle() {
  return ButtonStyle(
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  )));
}
