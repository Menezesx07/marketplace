import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/home/card_item.dart';
import '../controller/home_controller.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, this.label});

  final label;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<HomeController>(context, listen: false).getCategpryitem(widget.label);
  }

  @override
  Widget build(BuildContext context) {

    // Pegando o tamanho da tela geral
    var size = MediaQuery.of(context).size;

    // Formula para ajustar ao tamanho da tela o card
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    //controllando o botão de voltar para limpar a lista
    return Consumer<HomeController>(
        builder: (context, value, child) =>  WillPopScope(
        onWillPop: () async {
      //chamando a função para limpar a lista e não cachear os itens
      value.clearCategoryList();
      return true;
    },

      child: Scaffold(
          appBar: AppBar(),

          body:

          value.categoryItems.results.isEmpty ?

          const Center(child: CircularProgressIndicator()) :

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(widget.label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

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
                      itemCount: value.categoryItems.results.length,
                      itemBuilder: (context, index) {
                        return cardItem(
                            cardInfo: value.categoryItems.results[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}
