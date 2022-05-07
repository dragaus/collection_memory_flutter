import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class TakePicturePage extends StatefulWidget {
  const TakePicturePage(this.cameras, {Key? key}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  State<TakePicturePage> createState() => _TakePicturePageState();
}

class _TakePicturePageState extends State<TakePicturePage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(),
      body: CameraPreview(controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final image = await controller.takePicture();
            print(image.path);
          } catch (error) {
            print(error);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
