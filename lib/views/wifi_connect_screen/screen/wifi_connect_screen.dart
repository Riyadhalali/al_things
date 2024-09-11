import 'package:al_things/views/wifi_connect_screen/controller/wifi_connect_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WifiConnectScreen extends StatelessWidget {
  final WifiConnectController wifiConnectController =
      Get.put(WifiConnectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connect to Router"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                wifiConnectController.ssid.value = value;
              },
              decoration: InputDecoration(
                labelText: 'SSID',
              ),
            ),
            TextField(
              onChanged: (value) {
                wifiConnectController.password.value = value;
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                wifiConnectController.connectToWifi();
              },
              child: Text('Connect to Wi-Fi'),
            ),
            ElevatedButton(
              onPressed: wifiConnectController.checkStatus,
              child: Text('Check Status'),
            ),
            SizedBox(height: 20),
            Obx(
              () => Text(
                  'Connection Status: ${wifiConnectController.connectionStatus.value}'),
            ),
          ],
        ),
      ),
    );
  }
}
