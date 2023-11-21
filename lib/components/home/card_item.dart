import 'package:flutter/material.dart';
import 'package:marketplace/model/fakeapi_model.dart';
import 'package:marketplace/pages/detail_screen.dart';

class cardItem extends StatefulWidget {
  const cardItem({super.key, this.cardInfo});

  final cardInfo;

  @override
  State<cardItem> createState() => _cardItemState();
}

class _cardItemState extends State<cardItem> {

  FakeApiItem cardInfoDestr = FakeApiItem();

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

    double width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var heightImage = height*0.18;
    double fontSizeh1 = width * 0.042;
    double fontSizeh2 = width * 0.035;
    double fontSizePrice = width * 0.05;

    return InkWell(

      onTap: () => Navigator.push(context, MaterialPageRoute
          (builder: (context) => DetailScreen(cardInfo: cardInfoDestr))),

      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do produto
            Container(
              height: heightImage,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage('${cardInfoDestr.image}'),
                ),
              ),
            ),
            // Descrição do produto
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${cardInfoDestr.title}",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: fontSizeh1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    '${cardInfoDestr.description}',
                    maxLines: 2,
                    style: TextStyle(fontSize: fontSizeh2),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Text('${cardInfoDestr.rating?.rate}'),
                      const SizedBox(width: 2),
                      const Icon(Icons.star, size: 12),
                      const SizedBox(width: 4),
                      Text("(${cardInfoDestr.rating?.count} reviews)", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300))
                    ],
                  ),

                  Text(
                    'R\$ ${cardInfoDestr.price}',
                    style: TextStyle(
                      fontSize: fontSizePrice,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
