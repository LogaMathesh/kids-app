import 'dart:io';
import 'package:flutter/material.dart';
import '../services/object_service.dart';
import '../services/tts_service.dart';

class ResultScreen extends StatefulWidget {
  final File image;
  final String label;

  ResultScreen({required this.image, required this.label});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String description = "";
  final tts = TTSService();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await ObjectService.loadObjects();

    setState(() {
      description = ObjectService.getDescription(widget.label);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.file(widget.image, height: 200),

            SizedBox(height: 20),

            Text(
              widget.label.toUpperCase(),
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Text(description, style: TextStyle(fontSize: 18)),

            SizedBox(height: 30),

            ElevatedButton(
              child: Text("🔊 Listen"),
              onPressed: () {
                tts.speak("${widget.label}. $description");
              },
            ),
          ],
        ),
      ),
    );
  }
}
