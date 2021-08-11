import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  Future<String>? delivery;

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
                      child: Text("Pedir Pizza")),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Simular Erro")),
              ],
            ),
            delivery == null
                ? Text("Nenhuma Pizza Comprada")
                : FutureBuilder(
                    future: delivery,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("O Motoboy Caiu");
                      }
                      if (snapshot.hasData) {
                        return Image.asset("pizza.jpg");
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
    return Future.delayed(const Duration(seconds: 10), () => "Pizza saindo");
  }
}
