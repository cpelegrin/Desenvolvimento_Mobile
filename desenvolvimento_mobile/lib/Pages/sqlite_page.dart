import 'package:flutter/material.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLitePage extends StatelessWidget {
  Database? database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  //Inicializando o Database e criando tabela
                  WidgetsFlutterBinding.ensureInitialized();
                  database = await openDatabase(
                    join(await getDatabasesPath(), 'doggie_database.db'),
                    onCreate: (db, version) {
                      return db.execute(
                        'CREATE TABLE IF NOT EXISTS dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
                      );
                    },
                    version: 1,
                  );
                },
                child: Text("Criar Tabela"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    var fido = Dog(
                      id: 3,
                      name: 'rex',
                      age: 25,
                    );

                    await insertDog(fido);
                  },
                  child: Text("Inserir valores"),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  print(await dogs());
                },
                child: Text("Ler Valores"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> insertDog(Dog dog) async {
    await database!.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> dogs() async {
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await database!.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
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
