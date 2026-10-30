import 'package:crafty_bay/features/reviews/presentation/widgets/add_review_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/review_widget.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key, });

  static const String name = "/reviewScreen";
  //final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Reviews"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
                itemBuilder: (context, index){
                return ReviewWidget();
                }),
          ),
          AddReviewWidget()
        ],
      ),
    );
  }
}


