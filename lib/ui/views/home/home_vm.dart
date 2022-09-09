import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'package:untitled/data/base/base_vm.dart';

import '../../../locator.dart';
import '../../utilities/image_to_text_utilities.dart';

class HomeViewModel extends BaseVm {
  final ImageToTextUtilities _utils = locator<ImageToTextUtilities>();
  String _scannedText = '';
  File? _image;

  File? get imageFile => _image;

  String get scannedText => _scannedText;

 set setScannedText(String val) {
    _scannedText = val;
    notifyListeners();
  }

  set setImage(var file) {
    _image = file;
    notifyListeners();
  }

  scanImageForText(BuildContext context) async {
   if(imageFile != null){
     var text = await _utils.pickImageFromGallery(context, imageFile!);
     setScannedText = text;
   }
   notifyListeners();
  }
}
