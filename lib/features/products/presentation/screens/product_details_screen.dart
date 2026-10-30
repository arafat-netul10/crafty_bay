import 'package:crafty_bay/features/products/presentation/widgets/size_picker.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../reviews/presentation/screens/review_screen.dart';
import '../widgets/color_picker.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/total_price_and_add_to_cart.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = "/productDetailsScreen";

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarousel(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Title of the product",
                              style: textTheme.titleMedium?.copyWith(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              width: 90,
                              child: IncDecButton(
                                maxValue: 20,
                                minValue: 1,
                                initialValue: 1,
                                onChanged: (newValue) {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Wrap(
                              spacing: 4,
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                Text("4.5"),
                              ],
                            ),
                            TextButton(onPressed: () {
                              Navigator.pushNamed(context, ReviewScreen.name);
                            },
                                child: Text("Reviews", style: TextStyle(color: AppColors.themeColor),)),
                            Container(
                              padding: .all(2),
                              decoration: BoxDecoration(
                                color: AppColors.themeColor,
                                borderRadius: .circular(4),
                              ),
                              child: Icon(
                                Icons.favorite_border,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
              
                        //Color
                        _sectionTitle("Color"),
                        ColorPicker(
                          colors: [
                            'Red', 'Yellow', 'White', 'Black'
                          ],
                          onChanged: (String selectedColor) {
                            print(selectedColor);
                        },),
              
                        //Size
                        const SizedBox(height: 16),
                        _sectionTitle("Size"),
                        SizePicker(
                            sizes: [
                          'S', 'M', 'L', 'XL'
                        ],
                         onChanged: (String selectedSize) {
              print(selectedSize);
                        }),
              
                        //Description
                        const SizedBox(height: 16),
                        _sectionTitle("Description"),
                        Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in volatile velit esse cillum dolore eu fugiat nulla pariatur.''',
                        style: TextStyle(color: Colors.black54)
              
                        )
              
              
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TotalPriceAndAddToCart(),

        ],
      ),

    );
  }

  //Section Title
  Widget _sectionTitle(String header) {

    return  Padding(
      padding: const EdgeInsets.only(bottom:8.0),
      child: Text(header, style: TextStyle(
        fontSize: 16,
        color: Colors.black54,
        fontWeight: .w600,
      ),),
    );
  }
}
