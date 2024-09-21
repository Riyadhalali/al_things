import 'package:al_things/views/register_screen/controller/register_controller.dart';
import 'package:al_things/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Register'),
      ),
      body: GetBuilder(
          init: RegisterController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    TextFieldCustom(
                      labeltext: 'username',
                      controller: controller.usernameController,
                      prefixicon: Icon(Icons.person_outline_rounded),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldCustom(
                      labeltext: 'password',
                      controller: controller.passwordController,
                      prefixicon: Icon(Icons.password),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldCustom(
                      labeltext: 'confirm password',
                      controller: controller.passwordConfirmController,
                      prefixicon: Icon(Icons.password),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldCustom(
                      labeltext: 'email',
                      controller: controller.emailController,
                      prefixicon: Icon(Icons.email_outlined),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldCustom(
                      labeltext: 'phone',
                      controller: controller.phoneController,
                      prefixicon: Icon(Icons.phone),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldCustom(
                      labeltext: 'WiFi pin module number',
                      controller: controller.wifiPinController,
                      prefixicon: Icon(Icons.pin),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueAccent),
                        onPressed: () {},
                        child: Text("Register")),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
