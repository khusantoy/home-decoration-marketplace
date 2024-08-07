import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String title;

  const ProductItem({required this.image, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 110,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage("assets/images/lamp.png"),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Table desk",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
