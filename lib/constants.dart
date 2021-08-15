import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  prefixIcon: Icon(Icons.text_fields),
  labelText: "Value",
  labelStyle:
  TextStyle(color: Color(0xFF8E7F7F), letterSpacing: 1.0, fontSize: 12.0),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
);