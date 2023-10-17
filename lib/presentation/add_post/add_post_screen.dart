import 'dart:io';

import 'package:connect_u/core/colors.dart';
import 'package:connect_u/core/constants.dart';
import 'package:connect_u/presentation/add_post/posting_screen.dart';
import 'package:connect_u/presentation/add_post/widgets/custom_icon_button.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({
    super.key,
  });
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: "ADD POST",
              size: kHeadingSize,
              fontweight: FontWeight.bold,
            ),
            Icon(
              Icons.add_a_photo,
              size: screenSize.width * 0.7,
              color: kGreyColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => pickImage(context, ImageSource.camera),
                  child: CustomIconButton(
                    icon: Icons.camera_alt_outlined,
                    label: "Camera",
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () => pickImage(context, ImageSource.gallery),
                  child: CustomIconButton(
                    icon: Icons.photo_library_outlined,
                    label: "Gallery",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future pickImage(BuildContext ctx, ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) {
      return;
    } else {
      imageFile = File(image.path);
      print(image.path);
      Navigator.of(ctx).push(MaterialPageRoute(
          builder: (ctx) => PostingScreen(imageFile: imageFile)));
    }
  }
}
