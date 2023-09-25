import 'package:connect_u/core/colors.dart';
import 'package:flutter/material.dart';

class PosterImageCard extends StatelessWidget {
  PosterImageCard({
    super.key,
    required this.imageUrl,
  });

  final imageUrl;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.cover),
      ),
    );
  }
}
