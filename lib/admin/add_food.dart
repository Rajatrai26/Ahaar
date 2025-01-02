import 'package:ahaar/widget/widget_support.dart';
import 'package:flutter/material.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Item",
          style: AppWidget.HeadLineTextFeildStyle(),
        ),
      ),
      body: Container(
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Upload the Item ",
              style: AppWidget.semiBoldTextFeildStyle(),
            )
          ],
        ),
      ),
    );
  }
}
