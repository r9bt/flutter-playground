import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13ProMax,
          ],
          initialDevice: Devices.ios.iPhone13ProMax,
        ),
        AlignmentAddon(),
        MaterialThemeAddon(themes: [
          WidgetbookTheme(name: "light", data: ThemeData.light()),
          WidgetbookTheme(name: "dark", data: ThemeData.dark())
        ]),
      ],
      appBuilder: (context, child) {
        return child;
      },
    );
  }
}
