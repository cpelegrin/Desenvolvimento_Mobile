import 'package:desenvolvimento_mobile/Pages/pagina_vazia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatefulLifecyle extends StatefulWidget {
  @override
  _StatefulLifecyleState createState() => _StatefulLifecyleState();
}

class _StatefulLifecyleState extends State<StatefulLifecyle> {
  @override
  void initState() {
    super.initState();
    print("Init State");
  }

  var texto = "Próxima Tela";
  @override
  Widget build(BuildContext context) {
    print("build");
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return PaginaVazia();
                    },
                  ),
                );
              },
              child: Text(texto),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  print("setstate");
                  texto = "Modificado";
                });
              },
              child: Text("Modifica Estado"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("Dispose");
  }
}
