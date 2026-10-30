import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../screens/add_review_screen.dart';

class AddReviewWidget extends StatelessWidget {
  const AddReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        borderRadius: .only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: AppColors.themeColor.withAlpha(30),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: .start,
              children: [
                Text(
                  "Reviews",
                  style: TextStyle(fontWeight: .w600, fontSize: 18),
                ),
                const SizedBox(width: 8),

                Text(
                  '(1000)',
                  style: TextStyle(fontWeight: .w600, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddReviewScreen.name);
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
