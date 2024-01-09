import 'package:flutter/material.dart';

class FormTest extends StatefulWidget {
  const FormTest({super.key});

  @override
  State<FormTest> createState() => _FormTestState();
}

class _FormTestState extends State<FormTest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _name;

  Widget _buildNameField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Enter your name", labelText: "Name"),
      maxLength: 20,
      // maxLines: 2,

      validator: (name) {
        if (name!.isEmpty) return "Name is required";
        return null;
      },
      onSaved: (text) {
        _name = text;
        print("onSaved called");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _buildNameField(),
                const SizedBox(
                  height: 100.0,
                ),
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save(); // executes onSaved Fns.
                    }
                    print(_name);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
