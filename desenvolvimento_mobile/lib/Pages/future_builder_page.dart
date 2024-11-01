import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<String>? delivery;
  var erro = false;
  bool enableReiniciar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asset e Future Builder"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          delivery = comprarPizza();
                        });
                      },
                      child: const Text("Pedir Pizza")),
                ),
                ElevatedButton(
                    onPressed: () {
                      erro = true;
                    },
                    child: const Text("Simular Erro")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: enableReiniciar
                          ? () {
                              enableReiniciar = false;
                              delivery = null;
                              setState(() {});
                            }
                          : null,
                      child: const Text("Reiniciar")),
                ),
              ],
            ),
            SizedBox(height: 250),
            delivery == null
                ? const Text(
                    "Nenhuma Pizza Comprada",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  )
                : FutureBuilder(
                    future: delivery,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text("O Motoboy Caiu",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ));
                      } else if (snapshot.hasData) {
                        if (erro) {
                          return const Text("O Motoboy Caiu, Sua pizza já era!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                              ));
                        }
                        return Image.asset("assets/pizza.jpg");
                      }
                      return CircularProgressIndicator();
                    })
          ],
        ),
      ),
    );
  }

  Future<String> comprarPizza() async {
    // Imagine that this function is fetching user info from another service or database.
    return Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        enableReiniciar = true;
      });
      return "Pizza saindo";
    });
  }
}
