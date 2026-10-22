import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.headerText, required this.onTapSeeAll,
  });


  final String headerText;
  final VoidCallback onTapSeeAll;


  @override
  Widget build(BuildContext context) {

    final textTheme = TextTheme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(headerText, style: textTheme.titleMedium,),
        TextButton(
            onPressed: onTapSeeAll,
            child: Text("See All",
              style:
              TextStyle(color: AppColors.themeColor, fontSize: 18,),))
      ],
    );
  }
}