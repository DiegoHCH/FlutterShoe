import 'package:flutter/material.dart';
import 'package:flutter_shoes/view/widgets/widgets.dart';

class AddShoppingCart extends StatelessWidget {
  final double price;
  const AddShoppingCart({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Text('\$$price', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const Spacer(),
          const CustomButton(textButton: 'Add to cart'),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
