


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isma/data/services/network_manager.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}