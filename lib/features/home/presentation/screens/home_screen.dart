import 'package:crafty_bay/features/home/presentation/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/presentation/providers/main_nav_holder_provider.dart';
import '../../../shared/presentation/widgets/product_card.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/section_elements.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // void onTapSeeAllCategory(){
    //   context.read<MainNavHolderProvider>().changeIndex(1);
    // }

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              ProductSearchBar(),
              HomeCarouselSlider(),

              //Category
              SectionHeader(
                headerText: "Category",
                onTapSeeAll: () {
                  context.read<MainNavHolderProvider>().navigateToCategory();
                },
              ),
              SectionElements(icon: Icons.computer, name: "Electronics"),

              //Popular
              SectionHeader(
                headerText: "Popular",
                onTapSeeAll: () {
                  context.read<MainNavHolderProvider>().navigateToCategory();
                },
              ),
              SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  children: [1, 2, 3, 4, 5].map((e) => ProductCard()).toList(),
                ),
              ),

              //Special
              SectionHeader(
                headerText: "Special",
                onTapSeeAll: () {
                  context.read<MainNavHolderProvider>().navigateToCategory();
                },
              ),
              SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  children: [1, 2, 3, 4, 5].map((e) => ProductCard()).toList(),
                ),
              ),

              //New
              SectionHeader(
                headerText: "New",
                onTapSeeAll: () {
                  context.read<MainNavHolderProvider>().navigateToCategory();
                },
              ),
              SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  children: [1, 2, 3, 4, 5].map((e) => ProductCard()).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
