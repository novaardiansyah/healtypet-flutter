import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtypet/screens/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const Home()
        ), 
        (route) => false
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/background.png', fit: BoxFit.cover),

          Center(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 42),
                  Image.asset('assets/images/logo.png', height: 22),
                  const SizedBox(height: 73),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(text: "Helping you \nto keep ",
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        color: const Color(0xFFDEE1FE),
                        letterSpacing: 3.5 / 100,
                        height: 152 / 100
                      ),
                      children: const [
                        TextSpan(
                          text: "your bestie\n",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800
                          )
                        ),
                        TextSpan(text: "stay healthy!"),
                      ]  
                    )
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}