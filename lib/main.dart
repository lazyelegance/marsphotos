import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marsphotos/views/album-builder.dart';
import 'package:marsphotos/modal/photos.dart';
import 'package:marsphotos/views/mars-photos-builder.dart';

void main() {
  runApp(const MyApp());
}

Future<MarsPhotos> fetchMarsPhotos() async {
  final response = await http.get(Uri.parse(
      'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=hyHsS28WmAbk5VHI4HCpk1R2BydgTaKrjauJyfLB&sol=100'));

  if (response.statusCode == 200) {
    return MarsPhotos.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load photos');
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<MarsPhotos> futureMarsPhotos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureMarsPhotos = fetchMarsPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: MarPhotosBuilder(marsPhotos: futureMarsPhotos),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
