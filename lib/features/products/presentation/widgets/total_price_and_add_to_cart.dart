import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import '../../../cart/presentation/screens/cart_screen.dart';

class TotalPriceAndAddToCart extends StatelessWidget {
  const TotalPriceAndAddToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
          borderRadius: .only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          color: AppColors.themeColor.withAlpha(30)
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Text("Total Price:",
                style: TextStyle(
                  fontWeight: .w600,

                ),),

              Text('${Constants.takaSign}100',
                style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: .w600,
                    fontSize: 18
                ),),
            ],
          ),
          SizedBox(
              width: 140,
              child: FilledButton(
                  onPressed: (){

                  }, child: Text("Add to Cart",
              style: TextStyle(fontSize: 16),))),
        ],
      ),
    );
  }
}