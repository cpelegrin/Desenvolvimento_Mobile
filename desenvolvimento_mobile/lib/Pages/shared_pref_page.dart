import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefPage extends StatelessWidget {
  SharedPreferences? prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Menu de Recursos"),
        ),
        body: FutureBuilder(
            future: _getInstance(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(
                    "Erro ao recuperar a instância do Shared Preferences");
              }
              if (snapshot.hasData) {
                return _body(context);
              }
              return CircularProgressIndicator();
            }));
  }

  _getInstance() async {
    return prefs = await SharedPreferences.getInstance();
  }

  _body(context) {
    return Container(
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              prefs!.setString("chave", "valor1");
            },
            child: Text("Incluir valor"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                var recuperado = prefs!.getString('chave') ?? 0;
                print("Valor Recuperado: $recuperado");
              },
              child: Text("Recuperar valor"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              prefs!.remove('chave');
            },
            child: Text("Remover"),
          ),
        ],
      ),
    );
  }
}
