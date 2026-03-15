import 'dart:convert';
import 'package:flutter/services.dart';

class ObjectService {
  static Map<String, dynamic> _objects = {};

  // Load JSON only once
  static Future<void> loadObjects() async {
    if (_objects.isNotEmpty) return;

    String data = await rootBundle.loadString('assets/data/objects.json');

    _objects = json.decode(data);
  }

  static String getDescription(String label) {
    if (_objects.containsKey(label)) {
      return _objects[label];
    }

    return "I do not know this object yet.";
  }
}
