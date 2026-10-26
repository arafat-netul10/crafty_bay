import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onChanged});

  final List<String> colors;
  final Function(String) onChanged;


  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {

  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return  Wrap(
        spacing: 8,
        children: widget.colors.map((colors){
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedColor = colors;
                widget.onChanged(colors);
              });

            },
            child: Container(
              padding: .symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                border: .all(color: Colors.grey),
                borderRadius: .circular(4),
                color: colors == _selectedColor ? AppColors.themeColor : null,
              ),
              child: Text(colors, style: TextStyle(fontSize: 16),),
            ),
          );
        }).toList(),

    );
  }
}
