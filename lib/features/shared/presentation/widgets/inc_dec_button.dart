import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key, required this.maxValue, required this.minValue, required this.initialValue, required this.onChanged});

  final int maxValue;
  final int minValue;
  final int initialValue;
  final Function(int) onChanged;


  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {

  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        _iconButton(Icons.remove, () {
        if(_counter > widget.minValue){
          setState(() {
            _counter--;
          });
          widget.onChanged(_counter);
          setState(() {});

        }
        }),
        Text('$_counter', style: TextStyle(fontSize: 24),),
        _iconButton(Icons.add, () {
        if(_counter < widget.maxValue){
          setState(() {
            _counter++;
          });
          widget.onChanged(_counter);
          setState(() {});

        }
        }),
      ],
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
padding: .all(4),
        decoration: BoxDecoration(
          color: AppColors.themeColor,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Icon(icon, color: Colors.white, size: 16,),
      ),
    );

  }

}
