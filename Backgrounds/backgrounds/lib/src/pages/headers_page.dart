import 'package:backgrounds/src/theme/theme.dart';
import 'package:backgrounds/src/widgets/headers_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      body: WaveHeader(
        color: appTheme.colorScheme.secondary,
      ),
    );
  }
}
