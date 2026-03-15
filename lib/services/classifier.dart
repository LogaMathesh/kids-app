import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  late Interpreter interpreter;

  Future loadModel() async {
    interpreter = await Interpreter.fromAsset(
      'assets/model/mobilenet_v2.tflite',
    );
  }

  Future<String> predict(File image) async {
    // TODO: Add real preprocessing + inference

    // Temporary label for MVP testing
    return "bicycle";
  }
}
