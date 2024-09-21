import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/wifi_connect_controller.dart';

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
                wifiConnectController.ssid = value;
              },
              decoration: InputDecoration(
                labelText: 'SSID',
              ),
            ),
            TextField(
              onChanged: (value) {
                wifiConnectController.password = value;
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
            // Display progress bar while connecting
            GetBuilder<WifiConnectController>(
              builder: (controller) {
                if (controller.isLoading) {
                  return Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            GetBuilder<WifiConnectController>(
              builder: (controller) {
                return Text(
                    'Connection Status: ${controller.connectionStatus}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
