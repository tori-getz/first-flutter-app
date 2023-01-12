import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddUserPage();
  }
}

class _AddUserPage extends State<AddUserPage> {
  late bool _imageValid;

  final _formkey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _imageController = TextEditingController();

  final _nameFocus = FocusNode();
  final _imageFocus = FocusNode();

  @override
  void initState() {
    _imageValid = false;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _imageController.dispose();

    super.dispose();
  }

  void _submitForm() async {
    if (!_formkey.currentState!.validate()) return;

    _formkey.currentState!.save();

    print('name: ${_nameController.text}');
    print('image: ${_imageController.text}');
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
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
          key: _formkey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                  focusNode: _nameFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _nameFocus, _imageFocus);
                  },
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Имя пользователя',
                    hintText: 'Чебурашка',
                    prefixIcon: Icon(Icons.person),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.blue, width: 2.5)),
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(18)],
                  validator: _validateName),
              const SizedBox(height: 16),
              TextFormField(
                focusNode: _imageFocus,
                controller: _imageController,
                decoration: const InputDecoration(
                  labelText: 'URL картинки пользователя',
                  hintText: 'Да вводи, не ссы',
                  prefixIcon: Icon(Icons.image),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.5)),
                ),
                validator: _validateImage,
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

  String? _validateName(String? val) {
    if (val!.isEmpty) {
      return 'Поле обязательное для ввода';
    }

    return null;
  }

  String? _validateImage(String? val) {
    final _uriRegex = RegExp(
        r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');

    if (val!.isEmpty) {
      return 'Поле обязательное для ввода';
    }

    if (!_uriRegex.hasMatch(val)) {
      return 'Введи нормальную ссылку чувырла!';
    }

    return null;
  }
}
