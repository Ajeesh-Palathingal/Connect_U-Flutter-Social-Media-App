import 'package:connect_u/core/colors.dart';
import 'package:connect_u/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PersonListTile extends StatelessWidget {
  const PersonListTile({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(image),
          ),
          const SizedBox(width: 10),
          Expanded(child: CustomText(text: name, color: kBlackColor)),
          // const SizedBox(width: double.infinity)
        ],
      ),
    );
  }
}
