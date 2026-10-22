import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: .circular(8)),
        color: Colors.white,
        shadowColor: AppColors.themeColor.withAlpha(40),
        elevation: 4,
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                height: 120,
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withAlpha(30),
                  borderRadius: .only(
                    topLeft: .circular(8),
                    topRight: .circular(8),
                  ),
                ),
                child: Image.asset(AssetsPath.shoeImagePng),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: .start,
                  children: [
                    Text("Name",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: .w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment:  .spaceBetween,
                      children: [
                        Text('\$100',
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: .w600,
                            color: AppColors.themeColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            spacing: 4,
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 18,),
                              Text("4.5"),
                            ],
                          ),
                        ),
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
                  ],
                ),
              ),
              const SizedBox(height: 4,)
            ],
          ),
        ),
      ),
    );
  }
}