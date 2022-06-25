import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Chain extends StatefulWidget {
  const Chain({Key? key}) : super(key: key);

  @override
  State<Chain> createState() => _ChainState();
}

class _ChainState extends State<Chain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: widget,)
    );
  }
}