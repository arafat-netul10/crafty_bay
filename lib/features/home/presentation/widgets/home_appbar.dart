import 'package:flutter/material.dart';

import '../../../../app/assets_path.dart';
import 'circle_icon_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(AssetsPath.logoNavPng, width: 150,),
      actions: [
        CircleIconButton(icon: Icons.person, onTap: () {  },),
        SizedBox(width: 10),
        CircleIconButton(icon: Icons.call, onTap: () {  },),
        SizedBox(width: 10),
        CircleIconButton(icon: Icons.notifications_active, onTap: () {  },),
        SizedBox(width: 20),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}