import 'package:get/get.dart';

class LoginController extends GetxController{
  final _isRememberMe = false.obs;
  bool get isRememberMe => _isRememberMe.value;

  updateIsRememberMe(){
    _isRememberMe.value =!_isRememberMe.value;
  }
}