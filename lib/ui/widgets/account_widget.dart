import 'dart:math';

import 'package:bancodchina/models/account.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final Account account;

  const AccountWidget({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffFFEBEB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${account.name} ${account.lastName}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("ID: ${account.id.substring(0, min(account.id.length, 5))}"),
              Text('SALDO: ${account.balance.toStringAsFixed(2)}'),
              Text('TIPO DE CONTA: ${account.accountType ?? 'SEM TIPO DEFINIDO'}'),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon((Icons.settings)))
        ],
      ),
    );
  }
}
