import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import './models/image_model.dart';

class App extends StatefulWidget {
  @override
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    setState(() {
      counter += 1;
    });

    var response = await get(
        'https://jsonplaceholder.typicode.com/photos/$counter' as Uri);
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lets see some images!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(Icons.add),
        ),
        body: Text('$counter'),
      ),
    );
  }
}
