import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../products/presentation/screens/product_list_by_category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.name,
  });

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListByCategory.name, arguments: {
          "categoryId": "1",
          "categoryName": "Electronics",
        });
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.themeColor.withAlpha(20),
            ),
            padding: EdgeInsets.all(16),
            child: Icon(icon, size: 48, color: AppColors.themeColor),
          ),
          const  SizedBox(height: 8,),
          Text(name, style: TextStyle(color: AppColors.themeColor),),
        ],
      ),
    );
  }
}