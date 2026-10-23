import 'package:crafty_bay/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListByCategory extends StatefulWidget {
  const ProductListByCategory({super.key, required this.categoryId, required this.categoryName});

  static const String name = "/productListByCategory";

  final String categoryId;
  final String categoryName;

  @override
  State<ProductListByCategory> createState() => _ProductListByCategoryState();
}

class _ProductListByCategoryState extends State<ProductListByCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: GridView.builder(
        itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index){
          return FittedBox(child: ProductCard());
    },
    ),
    );
  }
}

