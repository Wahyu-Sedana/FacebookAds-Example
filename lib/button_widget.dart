import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdButton extends StatelessWidget {
  final String networkName;
  final VoidCallback onTap;
  const AdButton({Key? key, required this.onTap, required this.networkName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            networkName,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
