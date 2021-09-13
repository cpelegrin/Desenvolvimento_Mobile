import 'package:desenvolvimento_mobile/Pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();

  final _fPassword = FocusNode();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // incluir SingleChildScrollView para corrigir erro de layout
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: FlutterLogo(size: 150),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    controller: _tEmail,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_fPassword);
                    },
                    validator: MultiValidator(
                      // dependência form_field_validator
                      [
                        RequiredValidator(errorText: 'Insira um email válido.'),
                        EmailValidator(errorText: 'Insira um email válido.'),
                      ],
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Insira uma senha.");
                      }
                    },
                    controller: _tPassword,
                    focusNode: _fPassword,
                    obscureText:
                        true, // importante para esconder os caracteres digitados
                    onFieldSubmitted: (_) {
                      _save(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _save(context);
                          },
                          child: Text("Autenticar"),
                        ),
                        SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para criar registro: https://firebase.flutter.dev/docs/auth/usage#registration
                          },
                          child: Text(
                            "Cadastrar",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shadowColor: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _save(context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: _tEmail.text, password: _tPassword.text);
        if (userCredential.user != null) {
          // feito em dois ifs pois o null safaty não permite fazer na mesma cláusula
          if (userCredential.user!.email == _tEmail.text) {
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return HomePage();
                },
              ),
            );
          }
          throw ("erro de autenticação");
        }
        throw ("erro de autenticação");
      } on Exception catch (e) {
        print(e.toString());
      }
    }
  }
}
