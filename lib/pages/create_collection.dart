import 'package:collection_memory/models/collection.dart';
import 'package:collection_memory/pages/collection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateCollectionPage extends StatefulWidget {
  const CreateCollectionPage({Key? key}) : super(key: key);

  static const String pageRoute = '/create_collection';

  @override
  State<CreateCollectionPage> createState() => _CreateCollectionPageState();
}

class _CreateCollectionPageState extends State<CreateCollectionPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear una colección nueva'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text('Nombre de la colección nueva'),
              ),
              validator: (value) => value == null || value.isEmpty
                  ? 'Escribe un nombre para la colección'
                  : null,
            ),
            ElevatedButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                final collection = Collection(nameController.text);
                Navigator.of(context).pushReplacementNamed(
                  CollectionPage.pageRoute,
                  arguments: CollectionPageArgs(collection),
                );
              },
              child: const Text('Crear Colección'),
            )
          ],
        ),
      ),
    );
  }
}
