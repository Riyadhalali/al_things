import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WifiConnectController extends GetxController {
  var connectionStatus = 'Unknown'.obs;
  var ssid = ''.obs;
  var password = ''.obs;

  // Function to connect to wifi

  Future<void> connectToWifi() async {
    if (ssid.value.isEmpty || password.value.isEmpty) {
      connectionStatus.value = 'SSID and Password are required';
      return;
    }
    final response = await http.post(
      Uri.parse('http://192.168.4.1/connect'),
      body: {
        'ssid': ssid.value,
        'password': password.value,
      },
    );

    if (response.statusCode == 200) {
      connectionStatus.value = 'Trying to connect...';
    } else {
      connectionStatus.value = 'Failed to Connect';
    }
  }

  Future<void> checkStatus() async {
    final response = await http.get(Uri.parse('http://192.168.4.1/status'));

    if (response.statusCode == 200) {
      connectionStatus.value = response.body;
    } else {
      connectionStatus.value = 'Failed to Connect';
    }
  }
} // end class
