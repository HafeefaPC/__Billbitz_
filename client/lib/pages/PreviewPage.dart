import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PreviewPage extends StatefulWidget {
  final String picturePath;

  const PreviewPage({Key? key, required this.picturePath}) : super(key: key);

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  Future<void> _sendImageToServer(String imagePath) async {
    try {
      // Read image bytes
      List<int> imageBytes = await File(imagePath).readAsBytes();

      // Encode image bytes to base64
      String base64Image = base64Encode(imageBytes);

      // Define server URL
      String serverUrl =
          'http://YOUR_SERVER_IP:3000/processImage'; // Update with your server URL

      // Send image data to server
      final response = await http.post(
        Uri.parse(serverUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'base64Image': base64Image}),
      );

      if (response.statusCode == 200) {
        // Handle response as needed
        print(response.body);
      } else {
        // Failed to send image to server
        print('Failed to send image to server');
      }
    } catch (e) {
      print('Error occurred while sending image: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _sendImageToServer(widget.picturePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
      ),
      body: Center(
        child: Image.file(
          File(widget.picturePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
