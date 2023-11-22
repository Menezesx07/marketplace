import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../pages/category_page.dart';

class IconsGroupHome extends StatefulWidget {
  const IconsGroupHome({super.key});

  @override
  State<IconsGroupHome> createState() => _IconsGroupHomeState();
}

class _IconsGroupHomeState extends State<IconsGroupHome> {

  List<IconData> iconsList = [Icons.phone_android, Icons.diamond, Icons.man, Icons.woman];
  List<String> label = ["electronics", "jewelery", "men's clothing", "women's clothing"];
  //lista criada pois usar a "label" que vai ser enviado como paramtro, quebra o texto do widget
  List<String> displayLabel = ["Electronics", "Jewelery", "Men", "Women"];

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of (context).size.width;
    double width85 = width*0.85;

    double height = MediaQuery.of (context).size.height;
    double height50 = width*0.5;

    return SizedBox(
      width: width85,
      height: height50,
      child: Column(
        children: [

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Brands", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),

            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: SizedBox(

              child: ListView.builder(
                  itemCount: iconsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(

                        children: [

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(20)
                            ),
                            child: Icon(
                              iconsList[index],
                              size: 30,
                            ),
                            onPressed: () => Navigator.push(context, MaterialPageRoute
                                (builder: (context) => CategoryPage(label: label[index])))

                          ),

                          const SizedBox(height: 10),

                          Text(displayLabel[index], style: const TextStyle(fontWeight: FontWeight.bold),)

                        ],

                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
