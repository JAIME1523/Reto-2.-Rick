import 'package:app_rick/futures/home/services/home_services.dart';
import 'package:flutter/material.dart';

import '../models/custom_info_model.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool _isSendInfo = false;

  List<CustomInfoModel> listInfo = [];
  getCharacter() async {
    isLoading = true;
    listInfo = await HomeService.customGet(ids: [1, 2, 13, 26, 32, 336]);
    isLoading = false;
  }

  postCharacter() async {
    isSendInfo = true;
    await HomeService.postCharacter(listInfo);
    isSendInfo = false;

  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isSendInfo => _isSendInfo;
  set isSendInfo(bool value) {
    _isSendInfo = value;
    notifyListeners();
  }
}
