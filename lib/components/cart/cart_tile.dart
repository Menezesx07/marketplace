// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/cart_controller.dart';
import '../../model/fakeapi_model.dart';

class CartTile extends StatefulWidget {
  const CartTile({super.key, this.cardInfo});

  final cardInfo;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {

  //qnty está sendo declarado por conta do nullSafety
  FakeApiItem cardInfoDestr = FakeApiItem(qnty: 1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    destructuringCard();
  }

  destructuringCard () {
    cardInfoDestr = widget.cardInfo;
  }

  @override
  Widget build(BuildContext context) {
    //instanciando o provider
    var cartController = Provider.of<CartController>(context, listen: true);
    double width = MediaQuery.of(context).size.width;
    double fontSizeh1 = width * 0.04;

    return Consumer<CartController>(

        builder: (context, value, child) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Container(
        height: 100,
        width: 500,

        decoration: const BoxDecoration(
          //color: Colors.amberAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            
            Row(
              children: [
                Image(image: NetworkImage("${cardInfoDestr.image}"), width: 60, height: 60,),

                const SizedBox(width: 20),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //passando tamanho de fonte, pois em telas menores, o Text.title vaza
                    Text("${cardInfoDestr.title?.substring(0,17)}", style: TextStyle(fontSize: fontSizeh1),),
                    Row(
                      children: [
                        Text("${cardInfoDestr.rating?.rate}"),
                        const SizedBox(width: 2),
                        const Icon(Icons.star, size: 12),
                        const SizedBox(width: 4),
                        Text("(${cardInfoDestr.rating?.count} reviews)", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300))
                      ],
                    ),

                    Text(
                      'R\$ ${cardInfoDestr.price!.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ],
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => cartController.decrement(widget.cardInfo),
                ),
                Text("${cardInfoDestr.qnty}"),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => cartController.increment(widget.cardInfo)

                ),
              ],
            )

          ],
          
        ),

      )

     )

    );

  }
}
