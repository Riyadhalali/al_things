import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/wifi_connect_controller.dart';

class WifiConnectScreen extends StatelessWidget {
  final WifiConnectController wifiConnectController =
      Get.put(WifiConnectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Wi-Fi Configuration"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wi-Fi Connection Information Container
              Container(
                //padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wifi,
                      color: Colors.white,
                      size: 60.0,
                    ),
                    SizedBox(width: 20),
                    // Display SSID and Connection Status
                    GetBuilder<WifiConnectController>(
                      builder: (controller) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Currently connected Wi-Fi:',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              controller.ssid.isNotEmpty
                                  ? controller.ssid
                                  : 'No Wi-Fi Connected',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              controller.connectionStatus,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // TextField for SSID Input
              TextField(
                onChanged: (value) {
                  wifiConnectController.ssid = value;
                },
                decoration: InputDecoration(
                  labelText: 'Enter SSID',
                  labelStyle: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // TextField for Password Input
              TextField(
                obscureText: true,
                onChanged: (value) {
                  wifiConnectController.password = value;
                },
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  labelStyle: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Connect Button
              ElevatedButton(
                onPressed: () {
                  wifiConnectController.connectToWifi();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Connect to Wi-Fi',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              // Check Status Button
              ElevatedButton(
                onPressed: () {
                  wifiConnectController.checkStatus();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Check Connection Status',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 30),
              // Loading Indicator when trying to connect
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
              // Connection Status Display
              GetBuilder<WifiConnectController>(
                builder: (controller) {
                  return Text(
                    'Connection Status: ${controller.connectionStatus}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
