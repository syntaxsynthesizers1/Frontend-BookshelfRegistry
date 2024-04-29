import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  static const routeName = '/SupportScreen';
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center());
  }
}
