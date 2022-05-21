import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({Key? key}) : super(key: key);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  List<File> images = [];

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  void loadImages() async {
    final dir = await getApplicationDocumentsDirectory();

    await for (final file in dir.list(recursive: true, followLinks: false)) {
      if (file.path.endsWith('.jpg')) {
        setState(() {
          images.add(File(file.path));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: images.isEmpty
          ? CircularProgressIndicator()
          : GridView.count(
              crossAxisCount: 3,
              children: images
                  .map(
                    (image) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.file(image),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
