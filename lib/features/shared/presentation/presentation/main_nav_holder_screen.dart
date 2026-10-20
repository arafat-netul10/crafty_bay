import 'package:crafty_bay/features/shared/presentation/providers/main_nav_holder_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../home/presentation/screens/home_screen.dart';

class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});

  static const String name = "/mainNavHolderScreen";


  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {

  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];



  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavHolderProvider>(
      builder: (context, mainNavHolderProvider, _) {
        return Scaffold(
          body: _screens[mainNavHolderProvider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.themeColor,
          showUnselectedLabels: true,
          currentIndex: mainNavHolderProvider.currentIndex,
          onTap: mainNavHolderProvider.changeIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourite"),
          ],)
        );
      }
    );
  }
}
