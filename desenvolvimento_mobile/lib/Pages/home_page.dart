import 'package:desenvolvimento_mobile/Pages/second_page.dart';
import 'package:flutter/material.dart';

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
            ],
          ),
        ],
      ),
    );
  }
}
