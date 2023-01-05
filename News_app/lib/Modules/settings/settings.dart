import 'package:flutter/material.dart';

class Settings_Layout extends StatelessWidget {
  const Settings_Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings',
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
