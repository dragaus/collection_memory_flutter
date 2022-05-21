import 'dart:io';
import 'package:collection_memory/pages/create_collection.dart';
import 'package:collection_memory/widgets/gallery.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Memory'),
      ),
      body: const GalleryWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, CreateCollectionPage.pageRoute),
        child: const Icon(Icons.add),
      ),
    );
  }
}
