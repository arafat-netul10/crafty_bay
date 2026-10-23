import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';
import '../../../../app/constants.dart';
import '../../../shared/presentation/widgets/inc_dec_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: .symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(AssetsPath.shoeImagePng, width: 100,),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                spacing: 8,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text("Name of the product",
                              style: TextStyle(
                                  fontSize: 16
                              ),),
                            Text("Color: White   Size: 48",
                              style: TextStyle(
                                  color: Colors.black54
                              ),),
                          ],
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: AppColors.themeColor,))
                    ],
                  ),

                  Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text('${Constants.takaSign}100',
                          style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: .w600,
                              fontSize: 18
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          child: IncDecButton(
                              maxValue: 10,
                              minValue: 1,
                              initialValue: 1,
                              onChanged: (value){}),
                        ),
                      ]
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}