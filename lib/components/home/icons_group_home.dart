import 'package:flutter/material.dart';

class IconsGroupHome extends StatefulWidget {
  const IconsGroupHome({super.key});

  @override
  State<IconsGroupHome> createState() => _IconsGroupHomeState();
}

class _IconsGroupHomeState extends State<IconsGroupHome> {

  List<IconData> iconsList = [Icons.phone_android, Icons.diamond, Icons.man, Icons.woman];
  List<String> label = ["Eletronics", "Jewelry", "Men", "Woman"];

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
              Text("See All", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18)),
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
                            onPressed: () {},
                          ),

                          const SizedBox(height: 10),

                          Text(label[index], style: const TextStyle(fontWeight: FontWeight.bold),)

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
