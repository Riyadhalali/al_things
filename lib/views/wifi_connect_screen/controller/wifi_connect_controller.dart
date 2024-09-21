import 'dart:async';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WifiConnectController extends GetxController {
  String connectionStatus = 'Unknown';
  String ssid = '';
  String password = '';
  bool isLoading = false; // This will control the loading indicator
  Timer? _statusCheckTimer; // Timer to periodically check status

  // Function to connect to WiFi
  Future<void> connectToWifi() async {
    if (ssid.isEmpty || password.isEmpty) {
      connectionStatus = 'SSID and Password are required';
      update();
      return;
    }

    isLoading = true; // Show the loading indicator
    update();

    try {
      final response = await http.post(
        Uri.parse('http://192.168.4.1/connect'),
        body: {
          'ssid': ssid,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        connectionStatus = 'Trying to connect...';
        update();
        // Start checking the connection status every 2 seconds
        _startCheckingStatus();
      } else {
        connectionStatus = 'Failed to connect';
        isLoading = false; // Hide the loading indicator on failure
        update();
      }
    } catch (e) {
      connectionStatus = 'Failed to connect to ESP8266';
      isLoading = false;
      update();
    }
  }

  // Function to check the connection status
  Future<void> checkStatus() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.4.1/status'));

      if (response.statusCode == 200) {
        connectionStatus = response.body;

        // Stop the timer if connected
        if (response.body == 'Connected') {
          _stopCheckingStatus();
          isLoading = false; // Hide the loading indicator when connected
        }
        update();
      } else {
        connectionStatus = 'Failed to check status';
        update();
      }
    } catch (e) {
      connectionStatus = 'No connection to ESP8266';
      isLoading = false;
      update();
    }
  }

  // Function to start periodic status checking
  void _startCheckingStatus() {
    _statusCheckTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      checkStatus();
    });
  }

  // Function to stop periodic status checking
  void _stopCheckingStatus() {
    if (_statusCheckTimer != null) {
      _statusCheckTimer!.cancel();
      _statusCheckTimer = null;
    }
  }

  @override
  void onInit() {
    _startCheckingStatus();
    super.onInit();
  }

  // Cleanup when the controller is no longer used
  @override
  void onClose() {
    _stopCheckingStatus();
    super.onClose();
  }
}
