import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/cart_controller.dart';
import '../controller/home_controller.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //função que vai carregar o controller ao iniciar o app, semelhante ao iniState
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<HomeController>(context, listen: false).getHomeitems();
    Provider.of<CartController>(context, listen: false).getHiveItemCart();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    goToHome();
  }

  goToHome() async {
    //delay só pra fazer a animação da splash
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250.0,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText('MarketPlace!'),
              FadeAnimatedText('FakeApiStore!!'),
              FadeAnimatedText('do it RIGHT NOW!!!'),
            ],
          ),
        ),
      ),
    );
  }
}
