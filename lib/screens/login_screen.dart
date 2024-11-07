import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_flow_app/controller/login_controller.dart';
import 'package:flutter_flow_app/widgets/text_widgets.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final LoginController _controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Container(
          height: 400,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 31, 15, 173).withOpacity(0.8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Center(child: TextWidget(text: "Login", color: Colors.white,fontSize: 15,)),
                  const Spacer(),
                  const TextWidget(text: "Email", color: Colors.white,),
                  Container(
                    height: 35,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.white))),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),

                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const TextWidget(
                    text :"Password",
                    color: Colors.white,
                  ),
                  Container(
                    height: 35,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.white))),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     Obx(
                       ()=> Checkbox(
                        value: _controller.isRememberMe,
                        onChanged: (value){
                          _controller.updateIsRememberMe();
                       },
                        
                       ),
                     ),

                     const Expanded(child: TextWidget(text:"Remember Me", color: Colors.white,))
                    ],
                  ),
                  // const Spacer(),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    alignment: Alignment.center,
                    child: TextWidget(text: "Log In"),
                  ),
                  const Spacer(),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(text:"Don't have a account", color: Colors.white,),
                       TextWidget(text:"  Register", color: Colors.white54,),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
