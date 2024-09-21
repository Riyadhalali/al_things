import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  const ElevatedButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueAccent),
        onPressed: () {},
        child: Text("Config WiFi"));
  }
}
