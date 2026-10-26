import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onChanged});

  final List<String> sizes;
  final Function(String) onChanged;


  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {

  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return  Wrap(
      spacing: 8,
      children: widget.sizes.map((sizes){
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedSize = sizes;
              widget.onChanged(sizes);
            });

          },
          child: Container(
            padding: .symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
              border: .all(color: Colors.grey),
              borderRadius: .circular(4),
              color: sizes == _selectedSize ? AppColors.themeColor : null,
            ),
            child: Text(sizes, style: TextStyle(fontSize: 16),),
          ),
        );
      }).toList(),

    );
  }
}
