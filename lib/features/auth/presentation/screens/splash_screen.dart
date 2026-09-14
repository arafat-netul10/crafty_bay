import 'package:crafty_bay/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = "/splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(child: AppLogo()),
          //Center(child: SvgPicture.asset('assets/images/CraftyBay.svg')),
          Spacer(),

          Column(
            children: [
              CircularProgressIndicator(
                color: Colors.cyan[200],),
              SizedBox(height: 16,),
              Text("Version 1.0.0"),
              SizedBox(height: 16,),
            ],
          )

        ],
      ),
    );
  }
}


