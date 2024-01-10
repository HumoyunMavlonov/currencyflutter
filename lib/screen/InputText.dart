import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget InputText(String label, TextEditingController controller, int length, bool enabled) {
  return Container(
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.redAccent,
          primaryColorDark: Colors.red,
        ),
        child: TextField(
          enabled: enabled,
          maxLength: length,
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: "",
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF8E8E93))),
            labelText: label,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF673bb7))),
          ),
        ),
      ));
}
