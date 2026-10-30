import 'package:flutter/material.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  static const String name = "/addReviewScreen";

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Create a review"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          TextField(
            controller: firstNameController,
            decoration: InputDecoration(labelText: "First Name"),
          ),
          const SizedBox(height: 18),

          TextField(
            controller: lastNameController,
            decoration: InputDecoration(labelText: "Last Name"),
          ),
          const SizedBox(height: 18),
          
          TextField(
            controller: descriptionController,
            maxLines: 10,
            decoration: InputDecoration(labelText: "Description"),
          ),
          const SizedBox(height: 10),

          SizedBox(
            width: double.maxFinite,
            child: FilledButton(
              onPressed: (){
                Navigator.pop(context);
              },
                child: Text("Submit", style: TextStyle(fontSize: 16),),),
          ),

        ]),
      ),
    );
  }
}
