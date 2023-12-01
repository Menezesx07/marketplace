import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselHome extends StatefulWidget {
  const CarouselHome({Key? key}) : super(key: key);

  @override
  State<CarouselHome> createState() => _SliderPState();
}

class _SliderPState extends State<CarouselHome> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
                carouselController: controller,
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                },
                options: CarouselOptions(
                    height: 300,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index))),

            const SizedBox(height: 40),

            buildIndicator()
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    onDotClicked: animateToSlide,
    effect: const WormEffect(dotWidth: 15, activeDotColor: Colors.purple),
    activeIndex: activeIndex,
    count: urlImages.length,
  );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(String urlImage, int index) =>
    Image.network(urlImage, fit: BoxFit.cover);