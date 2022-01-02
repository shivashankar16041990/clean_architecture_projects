import 'package:flutter/material.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader();
  @override
  Widget build(BuildContext context) {

    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: const CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}