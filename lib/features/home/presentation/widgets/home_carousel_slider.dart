import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class HomeCarouselSlider extends StatelessWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final ValueNotifier<int> selectedIndex = ValueNotifier(0);

    return Column(
      spacing: 8,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            autoPlay: true,
            autoPlayInterval : const Duration(seconds: 4),
            pauseAutoPlayOnTouch: true,
            viewportFraction: 1.0,
            onPageChanged: (index, _) {
              selectedIndex.value = index;
            }
         ),
          items: [1,2,3,].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: AppColors.themeColor
                    ),
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i=0; i<3; i++)
                  Container(
                    height: 10,
                    width: 10,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == index ? AppColors.themeColor : Colors.grey.withAlpha(100),
                    ),
                  )
              ],
            );
          }
        )
      ],
    );
  }
}