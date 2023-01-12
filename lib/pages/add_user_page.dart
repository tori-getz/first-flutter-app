import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_app/models/user.dart';
import 'package:http/http.dart' as http;

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddUserPage();
  }
}

enum MessageType {
  success,
  error,
}

enum FormFields { name, image }

class _AddUserPage extends State<AddUserPage> {
  late User newUser = User(name: '', image: '');
  // фу бля говнокод
  bool _showClearName = false;
  bool _showClearImage = false;

  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _imageController = TextEditingController();

  final _nameFocus = FocusNode();
  final _imageFocus = FocusNode();
  final _submitFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      setState(() {
        _showClearName = _nameController.text.isNotEmpty;
      });
    });

    _imageController.addListener(() {
      setState(() {
        _showClearImage = _imageController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _imageController.dispose();

    _nameFocus.dispose();
    _imageFocus.dispose();
    _submitFocus.dispose();

    super.dispose();
  }

  void _submitForm(BuildContext context) {
    if (!_formkey.currentState!.validate()) {
      _showMessage(context, MessageType.error, 'Форма ваще невалидна');
      return;
    }

    _formkey.currentState!.save();

    _showMessage(context, MessageType.success,
        'Пользователь ${_nameController.text} добавлен');

    Navigator.pop(context, newUser);
  }

  void _showMessage(BuildContext context, MessageType type, String message) {
    Color _snackbarColor =
        type == MessageType.success ? Colors.green : Colors.red;

    SnackBar _snackBar = SnackBar(
      content: Text(message),
      backgroundColor: _snackbarColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  GestureDetector? _clearField(
      bool showClearButton, TextEditingController controller) {
    if (!showClearButton) return null;

    return GestureDetector(
      onTap: () {
        controller.clear();
        setState(() {});
      },
      child: const Icon(Icons.close),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle submitStyle = ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)));

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Добавить юзверя',
          ),
        ),
        key: _scaffoldKey,
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
                decoration: InputDecoration(
                  labelText: 'Имя пользователя',
                  hintText: 'Чебурашка',
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: _clearField(_showClearName, _nameController),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.5)),
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(18)],
                validator: _validateName,
                onSaved: (val) => newUser.name = val!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                focusNode: _imageFocus,
                onFieldSubmitted: (_) {
                  _fieldFocusChange(context, _imageFocus, _submitFocus);
                },
                controller: _imageController,
                decoration: InputDecoration(
                  labelText: 'URL картинки пользователя',
                  hintText: 'Да вводи, не ссы',
                  prefixIcon: const Icon(Icons.image),
                  suffixIcon: _clearField(_showClearImage, _imageController),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.5)),
                ),
                validator: _validateImage,
                onSaved: (val) => newUser.image = val!,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                focusNode: _submitFocus,
                style: submitStyle,
                onPressed: () => _submitForm(context),
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
