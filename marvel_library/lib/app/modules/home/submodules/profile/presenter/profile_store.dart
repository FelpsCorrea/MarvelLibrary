import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  logoutDialog() {
    asuka.showDialog(builder: (context) {
      return AlertDialog(
        title: Text('Aviso'),
        content: Text("Deseja realmente sair?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Não',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Sim',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      );
    });
  }
}
