import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/shared/presentation/presentation/main_nav_holder_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = "/splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToSignInScreen();
  }

  void _navigateToSignInScreen(){
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, MainNavHolderScreen.name);
    });
  }

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
            spacing: 16,
            children: [
              CircularProgressIndicator(
                color: Colors.cyan[200],),
              Text("Version 1.0.0"),
            ],
          ),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}


