import 'package:flutter/material.dart';
import 'package:marketplace/components/cart/cart_tile.dart';
import 'package:provider/provider.dart';

import '../controller/cart_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {

    // Pegando o tamanho da tela geral
    var size = MediaQuery.of(context).size;

    // Formula para ajustar ao tamanho da tela o card
    final double itemHeight = size.height * 0.65;

    return Consumer<CartController>(
        builder: (context, value, child) => Scaffold(

      appBar: AppBar(),

      
      body:

    value.totalValue == 0.0 ?
    const Center(child: Text("O carrinho está vazio")) :
    Column(

        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Text("Cart Items", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: 500,
                    height: itemHeight,
                    child: ListView.builder(
                      //adicionando chave unica a cada item da lista
                      //sendo assim, facilitando a identificação de adição ou remoção dos itens
                      //resolve o b.o de atualizar o .lenght mas não a lista
                        key: UniqueKey(),
                        itemCount: value.itemList.results.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              CartTile(
                                  cardInfo: value.itemList.results[index]),
                              const Divider()
                            ],
                          );
                        }
                    ),
                  )

                ],
              ),
            ),
          ),
        ],

      ),

      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Price", style: TextStyle(fontSize: 12)),
                Text("R\$ ${value.totalValue.toStringAsFixed(2)}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),

            FilledButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.black, // Cor de fundo do botão
                ),
              ),
                onPressed: () {},
                child: const Text("PAY NOW")

            )
          ],

        ),
      ),
     )
    );
  }
}
