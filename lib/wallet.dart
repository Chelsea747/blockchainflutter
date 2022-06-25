import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blockchain/shared_var.dart';
import 'package:http/http.dart' as http;

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      var url = Uri.parse('https://Blockchain.nathanl4.repl.co/get_balance');
      var headers = {'Content-Type': 'application/json'};
      var body = json.encode({
        'username': SharedVar.username,
        'password': SharedVar.password,
      });
      http.post(url, headers: headers, body: body).then((response) {
        if (response.statusCode == 200) {
          SharedVar.balance = jsonDecode(response.body)['balance'];
          if (mounted) setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Balance: ${SharedVar.balance}'),
    ));
  }
}
