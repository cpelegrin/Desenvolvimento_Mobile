import 'package:desenvolvimento_mobile/Pages/second_page.dart';
import 'package:desenvolvimento_mobile/Pages/speeddial_page.dart';
import 'package:desenvolvimento_mobile/Pages/stateful_lifecyle.dart';
import 'package:flutter/material.dart';

import 'future_builder_page.dart';

class HomePage extends StatelessWidget {
  const HomePage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu de Recursos"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return SegundaPagina();
                        },
                      ),
                    );
                  },
                  child: Text("Navegação"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return SegundaPagina();
                      },
                    ),
                  );
                },
                child: Text("Nova Função"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return StatefulLifecyle();
                        },
                      ),
                    );
                  },
                  child: Text("StateFul LifeCycle"),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return FutureBuilderPage();
                        },
                      ),
                    );
                  },
                  child: Text("FutureBuilder"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return SpeedDialPage();
                      },
                    ),
                  );
                },
                child: Text("SpeedDial"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
