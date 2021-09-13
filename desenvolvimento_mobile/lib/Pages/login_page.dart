import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatelessWidget {
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();

  final _fPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: FlutterLogo(size: 250),
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
              onFieldSubmitted: (_) {},
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Autenticar")),
                ElevatedButton(onPressed: () {}, child: Text("Cadastrar")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
