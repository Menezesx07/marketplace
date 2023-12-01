import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_button.dart';
import '../controller/cart_controller.dart';
import '../model/fakeapi_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, this.cardInfo});

  // ignore: prefer_typing_uninitialized_variables
  final cardInfo;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

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

    var size = MediaQuery.of(context).size;
    double height40 = size.height * 0.4;
    double width30 = size.width * 0.8;

    return Scaffold(

      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 32.0),
            child: CartButton(),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
        
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
        
              Center(
                child: Container(
                  width: width30,
                  height: height40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage('${cardInfoDestr.image}'),
                    ),
                  ),
                ),
              ),
        
              const SizedBox(height: 30,),
        
              Text("${cardInfoDestr.title}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        
               Row(
                children: [
                  Text("${cardInfoDestr.rating?.rate}"),
                  const SizedBox(width: 2),
                  const Icon(Icons.star, size: 12),
                  const SizedBox(width: 4),
                  Text("(${cardInfoDestr.rating?.count} reviews)", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300))
                ],
              ),
        
              const SizedBox(height: 30),
        
              const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        
              const SizedBox(height: 20),
        
              Text("${cardInfoDestr.description}",
              )
        
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Total", style: TextStyle(fontSize: 12)),
                Text("R\$ ${cardInfoDestr.price?.toStringAsFixed(2)}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),

            FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.black, // Cor de fundo do botão
                  ),
                ),
                onPressed: () {

                  //instanciando o provider
                  var func = Provider.of<CartController>(context, listen: false);

                  //passando o objeto sem destruir
                  func.insertItem(widget.cardInfo);

                  showMySnackbar(context);
                  
                },
                child: const Text("ADD TO CARD")

            )
          ],
          
        ),
      ),

    );
  }

  void showMySnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Item adicionado com sucesso!'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Fechar',
        onPressed: () { },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
