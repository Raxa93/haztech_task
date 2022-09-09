// ignore_for_file: avoid_print, use_build_context_synchronously, unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class ImageToTextUtilities {

  Future<String> pickImageFromGallery(BuildContext context, File file) async {
    EasyLoading.show(dismissOnTap: false);
    final text = await recogniseText(File(file.path));

    await Future.delayed(const Duration(seconds: 1)).whenComplete(() => {
          EasyLoading.isShow ? EasyLoading.dismiss() : null,
          // Navigator.of(context).push(CupertinoPageRoute(builder: (context) => PreviewTextView(text: text,)))
        });
    return text;
  }

  Future<String> recogniseText(File imageFile) async {
    if (imageFile == null) {
      return 'No selected image';
    } else {
      final inputImage = InputImage.fromFilePath(imageFile.path);

      try {
        final textDetector = GoogleMlKit.vision.textDetector();
        final RecognisedText reconizedText =
            await textDetector.processImage(inputImage);

        final text = extractText(reconizedText.blocks);
        return text.isEmpty ? 'No text found in the image' : text;
      } catch (error) {
        return error.toString();
      }
    }
  }


  static extractText(var visionText) {
    String text = '';

    for (TextBlock block in visionText) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          text = '$text${word.text} ';
        }
        text = text;
      }
    }
    return text;
  }
}
