import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  final String assetImage;

  ImageBackground({required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(assetImage), fit: BoxFit.contain),
        ),
      ),
    );
  }
}
