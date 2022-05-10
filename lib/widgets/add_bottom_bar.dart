import 'package:flutter/material.dart';

class FloatingBottomBar extends StatelessWidget {
  const FloatingBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 60,
        color: Colors.white,
      ),
      elevation: 4,
      color: Colors.white,
    );
  }
}
