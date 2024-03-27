import 'package:flutter/material.dart';

class InputValidator {
  static String validateInput(String input, {String unit = ''}) {
    // Regular expression to match a number
    RegExp numberRegex = RegExp(r'^-?[0-9]+$');

    // Regular expression to match a number with optional decimal
    RegExp decimalRegex = RegExp(r'^-?[0-9]*(\.[0-9]*)?$');

    // Check if input is a valid number
    if (!decimalRegex.hasMatch(input)) {
      return 'Invalid input. Please enter a valid number.';
    }

    // Check if input contains alphabet characters
    if (!numberRegex.hasMatch(input)) {
      return 'Invalid input. Please enter a number without alphabet characters.';
    }

    // Convert input to double
    double numericValue = double.parse(input);

    // If it's minutes, check if it's an integer (no decimals)
    if (unit.toLowerCase() == 'min' && input.contains('.')) {
      return 'Invalid input. Minutes cannot have decimals.';
    }

    return '$input';
  }
}
