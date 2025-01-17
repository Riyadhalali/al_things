import 'package:al_things/views/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:al_things/views/register_screen/screen/register_screen.dart';
import 'package:al_things/views/sign_in_screen/controller/sign_in_controller.dart';
import 'package:al_things/views/wifi_connect_screen/screen/wifi_connect_screen.dart';
import 'package:al_things/widgets/imagebackground.dart';
import 'package:al_things/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: GetBuilder(
        init: SignInController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ImageBackground(assetImage: 'assets/logo/logo.png'),
                TextFieldCustom(
                  controller: controller.usernameController,
                  labeltext: "username",
                  prefixicon: Icon(Icons.people_rounded),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFieldCustom(
                  controller: controller.passwordController,
                  labeltext: "password",
                  prefixicon: Icon(Icons.password),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 25.0,
                    ),
                    Checkbox(
                      checkColor: Colors.blue,
                      value: controller.isChecked, // State of the checkbox
                      onChanged: controller.toggleCheckbox,
                    ),
                    Text('Remember Me'),
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent),
                    onPressed: () {
                      controller.login();
                    },
                    child: Text("Login")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent),
                    onPressed: () {
                      Get.to(() => WifiConnectScreen());
                    },
                    child: Text("Config WiFi")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "I am New User?",
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  } // end build
} // end class
