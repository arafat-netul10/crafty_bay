import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Row(
            spacing: 10,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withAlpha(50),
                child: Icon(Icons.person_2_outlined, color: Colors.grey,),
              ),
              Text("Reviewer Name",
                style: TextStyle(
                    fontWeight: .w600,
                    fontSize:18
                ),),
            ],
          ),
          const SizedBox(height: 10,),
          Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in volatile velit esse cillum dolore eu fugiat nulla pariatur.''',
              style: TextStyle(color: Colors.black54)

          ),

        ],
      ),
    );
  }
}