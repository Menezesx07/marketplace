import 'package:flutter/material.dart';
import '../pages/cart_page.dart';

class CartButton extends StatefulWidget {
  const CartButton({super.key});

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ()=> Navigator.push(context, MaterialPageRoute
      (builder: (context) => const CartPage())),
    child: const Icon(Icons.card_travel)
    );
  }
}
