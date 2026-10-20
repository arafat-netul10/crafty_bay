import 'package:crafty_bay/features/home/presentation/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_carousel_slider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              ProductSearchBar(),
              HomeCarouselSlider()

            ],
          ),
        ),
      ),
    );
  }
}






