import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Alterar a SDK mínima para 21
class FirestorePage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Firestore"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    var fido = Dog(
                      id: 3,
                      name: 'Fido',
                      age: 25,
                    );

                    await insertDog(fido);
                  },
                  child: Text("Inserir valores"),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  readDogs();
                },
                child: Text("Ler Valores"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  insertDog(Dog dog) {
    //Precisa ter o Firestore criado
    CollectionReference dogs = firestore.collection('dogs');

    return dogs
        .add({
          'name': dog.name,
          'age': dog.age,
        })
        .then((value) => print("Doguineo Adicionado"))
        .catchError((error) => print("Failed to add Doguineo: $error"));
  }

  Future<void> readDogs() async {
    CollectionReference dogs = firestore.collection('dogs');

    await dogs.get().then(
          (querySnapshot) => {
            print("Quantidade de registros: ${querySnapshot.docs.length}"),
            querySnapshot.docs.forEach((doc) {
              print(doc.data());
            }),
          },
        );
  }
}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
