import 'package:connect_u/core/colors.dart';
import 'package:connect_u/presentation/authentication/widgets/custom_icon_text_field.dart';
import 'package:connect_u/presentation/widgets/user_not_found.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      prefix: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          Icons.search,
          color: Colors.grey[700],
        ),
      ),
      controller: searchController,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),

      // onSubmitted: (value) {
      //   return ;
      // },
    );
  }
}
