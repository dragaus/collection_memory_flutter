import 'package:collection_memory/pages/home.dart';
import 'package:collection_memory/pages/take_picture.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(const CollectionMemoryApp());
}

class CollectionMemoryApp extends StatelessWidget {
  const CollectionMemoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomePage(),
        '/take_photo': (ctx) => TakePicturePage(cameras)
      },
    );
  }
}
