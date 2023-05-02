import 'package:flutter/material.dart';

const textDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
  ),
);

final createGroupDecor = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFee7b64), width: 2),
    borderRadius: BorderRadius.circular(20),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFee7b64), width: 2),
    borderRadius: BorderRadius.circular(20),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xFFee7b64), width: 2),
    borderRadius: BorderRadius.circular(20),
  ),
);

void nextScreen(context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: ((context) => page),
    ),
  );
}

void nextScreenReplacement(context, page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: ((context) => page),
    ),
  );
}

void pushAndRemove(context, page) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page), (route) => false);
}

void showSnackBar(context, message, color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 3),
    action: SnackBarAction(
      onPressed: () {},
      label: "OK",
    ),
    ));
}
