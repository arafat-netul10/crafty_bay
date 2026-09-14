import 'package:flutter/material.dart';

import '../../../../app/assets_path.dart';


class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key, this.width = 320
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPath.logoPng, width: width,);
  }
}