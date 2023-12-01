import 'package:flutter/material.dart';
import '../cart_button.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of (context).size.width;
    double width85 = width*0.85;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all( color: Colors.black, width: 1.0 ),
            ),
            width: width85,
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "What are u lookin ?",
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: CartButton()
                  )
              ),
            )
      ],
    );
  }
}
