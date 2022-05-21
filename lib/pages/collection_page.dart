import 'package:collection_memory/models/collection.dart';
import 'package:collection_memory/pages/take_picture.dart';
import 'package:flutter/material.dart';

class CollectionPageArgs {
  final Collection collection;

  CollectionPageArgs(this.collection);
}

class CollectionPage extends StatelessWidget {
  const CollectionPage({Key? key}) : super(key: key);
  static const String pageRoute = '/collection';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CollectionPageArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.collection.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          TakePicturePage.pageRoute,
          arguments: TakePicturePageArgs(args.collection.name),
        ),
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
