import 'dart:io';

import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';

import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PostingScreen extends StatelessWidget {
  const PostingScreen({super.key, required this.imageFile});
  final File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: kBlackColor,
        title: CustomText(
          text: "New Post",
          color: kWhiteColor,
          size: kHeadingSize,
          fontweight: FontWeight.w500,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: ElevatedButton(
              onPressed: () {
                const snackBar = SnackBar(
                  content: Text('Your photo will be posted'),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context).pop();
              },
              child: Text("POST"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    imageFile != null ? Image.file(imageFile!) : Image(image: AssetImage("lib/core/assets/add_post_img.png")),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration.collapsed(hintText: "Add Caption"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







// Container(
//       height: double.infinity,
//       width: double.infinity,
//       child: Column(
//         children: [
//           Container(
//             color: kBlackColor,
//             height: 70,
//             width: double.infinity,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 15, right: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomText(
//                     text: "New Post",
//                     color: kWhiteColor,
//                     size: kHeadingSize,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {},
//                     child: Text("POST"),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               child: Column(
//                 children: [
//                   imageFile != null ? Image.file(imageFile!) : Image(image: AssetImage("lib/core/assets/add_post_img.png")),
//                   TextField(
//                     maxLines: null,
//                     keyboardType: TextInputType.multiline,
//                     decoration: InputDecoration.collapsed(hintText: "Add Caption"),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );