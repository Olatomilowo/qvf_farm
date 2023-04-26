import 'package:flutter/material.dart';

import '../core/reuseables/general_text.dart';

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 3),
    ),
  );
}
