import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DisplayPicturePage extends StatelessWidget {
  const DisplayPicturePage(
      {Key? key, required this.imagePath, required this.dirName})
      : super(key: key);

  final String imagePath;
  final String dirName;

  void savePicture() async {
    final File image = File(imagePath);

    if (image == null) {
      return;
    }

    final dir = await getApplicationDocumentsDirectory();
    final String path = dir.path;

    final fileName = basename(image.path);
    final finalDir = Directory('$path/$dirName');
    final existDir = await finalDir.exists();
    if (!existDir) {
      await finalDir.create();
    }

    await image.copy('$path/$dirName/$fileName');
    print('$path/$fileName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('¿Quieres guardar esta fotografia?'),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.file(
                File(imagePath),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.cancel_sharp),
                ),
                IconButton(
                  onPressed: savePicture,
                  icon: const Icon(Icons.check),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
