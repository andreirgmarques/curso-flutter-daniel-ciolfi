import 'package:flutter/material.dart';
import 'package:gerente_loja/screens/home_screen.dart';
import 'package:gerente_loja/widgets/input_field.dart';
import 'package:gerente_loja/blocs/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();

    _loginBloc.outState.listen((state) {
      switch (state) {
        case LoginState.SUCCESS:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
          break;
        case LoginState.FAIL:
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Erro'),
              content: Text('Você não possui os privilégios necessários'),
            ),
          );
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: StreamBuilder<LoginState>(
        stream: _loginBloc.outState,
        initialData: LoginState.LOADING,
        builder: (context, snapshot) {
          switch (snapshot.data) {
            case LoginState.LOADING:
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Colors.pinkAccent,
                ),
              ));
            case LoginState.FAIL:
            case LoginState.SUCCESS:
            case LoginState.IDLE:
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(),
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(
                            Icons.store_mall_directory,
                            color: Colors.pinkAccent,
                            size: 160,
                          ),
                          InputField(
                            icon: Icons.person_outline,
                            hint: 'Usuário',
                            obscure: false,
                            keyboardType: TextInputType.emailAddress,
                            stream: _loginBloc.outEmail,
                            onChanged: _loginBloc.changeEmail,
                          ),
                          InputField(
                            icon: Icons.lock_outline,
                            hint: 'Senha',
                            obscure: true,
                            stream: _loginBloc.outPassword,
                            onChanged: _loginBloc.changePassword,
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          StreamBuilder<bool>(
                            stream: _loginBloc.outSubmitValid,
                            builder: (context, snapshot) {
                              return SizedBox(
                                height: 50,
                                child: RaisedButton(
                                  color: Colors.pinkAccent,
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: snapshot.hasData
                                      ? _loginBloc.submit
                                      : null,
                                  disabledColor:
                                      Colors.pinkAccent.withAlpha(140),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
