import 'package:crafty_bay/app/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<ThemeMode>(
        items: [
          DropdownMenuItem(
            value:  ThemeMode.system,
              child: Text("System"),),
          DropdownMenuItem(
            value:  ThemeMode.light,
              child: Text("Light"),),
          DropdownMenuItem(
            value: ThemeMode.dark,
              child: Text("Dark")),
        ],
        onChanged: (newMode){
          context.read<ThemeModeProvider>().changeThemeMode(newMode!);
          },
    );
  }
}
