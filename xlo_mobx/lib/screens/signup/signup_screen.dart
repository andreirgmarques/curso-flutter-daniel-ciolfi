import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/error_box.dart';
import 'package:xlo_mobx/screens/signup/components/field_title.dart';
import 'package:xlo_mobx/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpStore _signUpStore = SignUpStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Observer(
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ErrorBox(
                            message: _signUpStore.error,
                          ),
                        );
                      },
                    ),
                    FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios',
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !_signUpStore.loading,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: João S.',
                            isDense: true,
                            errorText: _signUpStore.nameError,
                          ),
                          onChanged: _signUpStore.setName,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação',
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !_signUpStore.loading,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: joao@gmail.com',
                            isDense: true,
                            errorText: _signUpStore.emailError,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          onChanged: _signUpStore.setEmail,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta',
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !_signUpStore.loading,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: (99) 99999-9999',
                            isDense: true,
                            errorText: _signUpStore.phoneError,
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                          onChanged: _signUpStore.setPhone,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Senha',
                      subtitle: 'Use letras, números e caracteres especiais',
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !_signUpStore.loading,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: _signUpStore.pass1Error,
                          ),
                          obscureText: true,
                          onChanged: _signUpStore.setPass1,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    FieldTitle(
                      title: 'Confirmar Senha',
                      subtitle: 'Repita a senha',
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !_signUpStore.loading,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: _signUpStore.pass2Error,
                          ),
                          obscureText: true,
                          onChanged: _signUpStore.setPass2,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return Container(
                          height: 40,
                          margin: const EdgeInsets.only(top: 20, bottom: 12),
                          child: RaisedButton(
                            color: Colors.orange,
                            disabledColor: Colors.orange.withAlpha(120),
                            child: _signUpStore.loading
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(
                                      Colors.white,
                                    ),
                                  )
                                : Text('CADASTRAR'),
                            textColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: _signUpStore.signUpPressed,
                          ),
                        );
                      },
                    ),
                    Divider(color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text(
                            'Já tem uma conta? ',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: Navigator.of(context).pop,
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
