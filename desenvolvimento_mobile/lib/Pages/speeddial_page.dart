import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialPage extends StatelessWidget {
  const SpeedDialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      title: Text('Title'),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Text("Mensagem do dialog")],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('ACTION 1'),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Dependências"),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.accessibility,
        children: [
          SpeedDialChild(
            child: Icon(Icons.account_circle),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'First',
            onTap: () => showDialog<void>(
                context: context, builder: (context) => dialog),
          ),
          SpeedDialChild(
            child: Icon(Icons.accessibility_new_outlined),
            backgroundColor: Colors.white,
            foregroundColor: Colors.green,
            label: 'second',
            onTap: () {
              final snackBar = SnackBar(
                content: Text('Text label'),
                action: SnackBarAction(
                  label: 'Action',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );
  }
}
