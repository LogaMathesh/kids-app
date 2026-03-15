import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/classifier.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final picker = ImagePicker();
  final classifier = Classifier();

  @override
  void initState() {
    super.initState();
    classifier.loadModel();
  }

  Future pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) return;

    File image = File(pickedFile.path);

    String label = await classifier.predict(image);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(image: image, label: label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Learn Objects")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Take Photo"),
              onPressed: () => pickImage(ImageSource.camera),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              child: Text("Pick from Gallery"),
              onPressed: () => pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }
}
