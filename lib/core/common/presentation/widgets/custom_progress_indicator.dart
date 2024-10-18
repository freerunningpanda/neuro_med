import 'package:flutter/material.dart';

class CustomProgressIndicator {
  factory CustomProgressIndicator() => instance;
  CustomProgressIndicator._();
  static CustomProgressIndicator instance = CustomProgressIndicator._();

  final progressIndicator = const Center(child: CircularProgressIndicator());
}
