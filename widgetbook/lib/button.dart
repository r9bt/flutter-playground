import 'package:flutter/material.dart';
import 'package:playground/widget_book/button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';


@UseCase(name: 'Primary', type: Button)
Widget primaryButton(BuildContext context) {
  return Center(
    child: Button(
      text: 'Primary',
    ),
  );
}

@UseCase(name: 'Secondary', type: Button)
Widget secondaryButton(BuildContext context) {
  return Center(
    child: Button(
      text: 'Secondary',
    ),
  );
}

@UseCase(name: 'Disabled', type: Button)
Widget disabledButton(BuildContext context) {
  return Center(
    child: Button(
      text: 'Disabled',
    ),
  );
}
