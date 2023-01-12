import 'package:flutter/material.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddUserPage();
  }
}

class _AddUserPage extends State<AddUserPage> {
  final _nameController = TextEditingController();
  final _imageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _imageController.dispose();

    super.dispose();
  }

  void _submitForm() async {
    print('name: ${_nameController.text}');
    print('image: ${_imageController.text}');
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle submitStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)));

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Добавить юзверя',
          ),
        ),
        body: Form(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Имя пользователя',
                  hintText: 'Чебурашка',
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.5)),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                  labelText: 'URL картинки пользователя',
                  hintText: 'Да вводи, не ссы',
                  prefixIcon: Icon(Icons.image),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.5)),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: submitStyle,
                onPressed: _submitForm,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add),
                    Text('Добавить пользователя'),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
