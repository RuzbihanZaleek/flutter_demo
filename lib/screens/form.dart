import 'package:flutter/material.dart';

class MainForm extends StatefulWidget {
  const MainForm({super.key});

  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _name;
  String? _email;
  String? _password;
  int? _mobile;

  Widget _buildNameField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Name",
          hintText: "Enter your name",
          labelStyle: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(color: Colors.black12)),
      maxLength: 20,
      validator: (name) {
        if (name!.isEmpty) return "Name is required";
        return null;
      },
      onSaved: (name) {
        _name = name;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          labelStyle: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(color: Colors.black12)),
      maxLength: 20,
      validator: (email) {
        if (email!.isEmpty) return "Email is required";
        return null;
      },
      onSaved: (email) {
        _email = email;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        hintText: "Enter your password",
        hintStyle: TextStyle(color: Colors.black12),
      ),
      maxLength: 10,
      obscureText: true,
      validator: (pass) {
        if (pass!.isEmpty) return "Password is required";
        return null;
      },
      onSaved: (pass) {
        _password = pass;
      },
    );
  }

  Widget _buildMobileNumber() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Mobile Number",
        labelStyle: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        hintText: "Enter your mobile number",
        hintStyle: TextStyle(color: Colors.black12),
      ),
      maxLength: 10,
      keyboardType: TextInputType.number,
      validator: (mobile) {
        if (mobile!.isEmpty) return "Mobile Number is required";
        return null;
      },
      onSaved: (mobile) {
        _mobile = int.parse(mobile!);
      },
    );
  }

  Widget _formFieldsWithPadding(Widget field) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: field,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                _formFieldsWithPadding(_buildNameField()),
                _formFieldsWithPadding(_buildEmailField()),
                _formFieldsWithPadding(_buildPasswordField()),
                _formFieldsWithPadding(_buildMobileNumber()),
                const SizedBox(height: 50),
                ElevatedButton(
                  child: const Text("Save"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
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
