import 'package:flutter/material.dart';

import '../../../shared/presentation/widgets/category_card.dart';

class SectionElements extends StatelessWidget {
  const SectionElements({
    super.key, required this.icon, required this.name,
  });

  final IconData icon;
  final String name;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
          scrollDirection: .horizontal,
          itemCount: 10,
          itemBuilder: (context, index){

            return CategoryCard(icon: icon, name: name);

          },
          separatorBuilder: (_, _) => SizedBox(width: 20,)
      ),
    );
  }
}

