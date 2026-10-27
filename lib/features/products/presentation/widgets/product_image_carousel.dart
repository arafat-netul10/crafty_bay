import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  @override
  Widget build(BuildContext context) {

   final ValueNotifier<int> selectedIndex = ValueNotifier(0);

    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 220.0,
              autoPlay: false,
              autoPlayInterval : const Duration(seconds: 4),
              pauseAutoPlayOnTouch: true,
              viewportFraction: 1.0,
              onPageChanged: (index, _) {
                selectedIndex.value = index;
              }
          ),
          items: [1,2,3,4].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(60)
                    ),
                    child: Center(child: Text('Image $i', style: TextStyle(fontSize: 16.0),))
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, index, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=0; i<4; i++)
                      Container(
                        height: 10,
                        width: 10,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i == index ? AppColors.themeColor : Colors.white,
                        ),
                      )
                  ],
                );
              }
          ),
        )
      ],
    );
  }
}
