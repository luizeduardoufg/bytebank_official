import 'package:bytebank_stable/database/app_database.dart';
import 'package:bytebank_stable/models/Contact.dart';
import 'package:flutter/material.dart';

class ContactsForm extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Column(
        children: [
          TextInputField(
            controller: _fullNameController,
            label: 'Full name',
            hint: 'John Lee',
          ),
          TextInputField(
            controller: _accountNumberController,
            label: 'Account number',
            hint: '0000',
            textInputType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: Text('Create'),
                onPressed: () {
                  final Contact contact = Contact(0, _fullNameController.text,
                      _accountNumberController.text);
                  save(contact).then((value) => Navigator.of(context).pop());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String label, hint, accountNumber;

  TextInputField(
      {this.controller,
      this.textInputType,
      this.label,
      this.hint,
      this.accountNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
