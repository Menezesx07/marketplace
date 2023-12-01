import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/home/card_item.dart';
import '../controller/home_controller.dart';

class AllItemsPage extends StatefulWidget {
  const AllItemsPage({super.key});

  @override
  State<AllItemsPage> createState() => _AllItemsPageState();
}

class _AllItemsPageState extends State<AllItemsPage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<HomeController>(context, listen: false).getAllitems();
  }

  @override
  Widget build(BuildContext context) {

    // Pegando o tamanho da tela geral
    var size = MediaQuery.of(context).size;

    // Formula para ajustar ao tamanho da tela o card
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Consumer<HomeController>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(),

          body:

          value.allItems.results.isEmpty ?

          const Center(child: CircularProgressIndicator()) :

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Text("All Items", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                  const SizedBox(height: 30),

                  SizedBox(
                    //ajuste para não cortar os cards
                    height: MediaQuery.of(context).size.height - 170,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: value.allItems.results.length,
                      itemBuilder: (context, index) {
                        return CardItem(
                            cardInfo: value.allItems.results[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
