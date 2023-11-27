import 'package:flutter/material.dart';
import 'package:marketplace/components/home/card_item.dart';
import 'package:marketplace/components/home/carousel_home.dart';
import 'package:marketplace/components/home/icons_group_home.dart';
import 'package:marketplace/components/home/search_bar.dart';
import 'package:provider/provider.dart';

import '../controller/home_controller.dart';
import 'all_items_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    // Pegando o tamanho da tela geral
    var size = MediaQuery.of(context).size;

    // Formula para ajustar ao tamanho da tela o card
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    // Formula para ajustar ao tamanho do carrossel
    final double carHeight = (size.height - kToolbarHeight - 24) / 1.5;
    final double carWidth = size.width / 1;

    return Consumer<HomeController>(
      builder: (context, value, child) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                
                const SizedBox(height: 50),
                
                const SearchBarHome(),

                Container(
                    height: carHeight,
                    width: carWidth,
                    color: Colors.blue,
                    child: CarouselHome()),

                const IconsGroupHome(),
                
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Special for U",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),

                        InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute
                              (builder: (context) => const AllItemsPage())),
                            child: const Text("See All", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18))),
                      ],
                    ),
                  ),
                ),
          
                const SizedBox(height: 10),
          
                SizedBox(
                  height: 350,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: value.homeItems.results.length,
                    itemBuilder: (context, index) {
                      return cardItem(
                          cardInfo: value.homeItems.results[index]);
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
