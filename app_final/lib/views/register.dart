import 'package:app_final/servicos/autenticacao_servico.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AutenticacaoServico _autenticacaoServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            autofillHints: const [AutofillHints.name],
                            textInputAction: TextInputAction.next,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "O campo Nome Completo deve ser preenchido.";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Nome Completo',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 4),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 4),
                                )),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: const [AutofillHints.email],
                            textInputAction: TextInputAction.next,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "O campo e-mail deve ser preenchido.";
                              }
                              if (value.length < 6) {
                                return "O campo e-mail deve ter pelo menos 6 caracteres.";
                              }
                              if (!value.contains("@")) {
                                return "O campo e-mail deve conter um @.";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 4),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 4),
                                )),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            autofillHints: const [AutofillHints.password],
                            obscureText: true,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "O campo senha deve ser preenchido.";
                              }
                              if (value.length < 8) {
                                return "O campo senha deve ter pelo menos 8 caracteres.";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Senha',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 4),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 4),
                                )),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            autofillHints: const [AutofillHints.password],
                            obscureText: true,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "O campo confirme a aenha deve ser preenchido.";
                              }
                              if (value.length < 8) {
                                return "O campo confirme a senha deve ter pelo menos 8 caracteres.";
                              }
                              if (value != _passwordController.text) {
                                return "As senhas devem ser iguais.";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Confirme a senha',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 4),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 2),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(64),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 4),
                                )),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor: Colors.blue,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                            ),
                          ),
                          onPressed: () {
                            botaoCadastrar();
                          },
                          child: const Text('Cadastrar'),
                        ),
                        const SizedBox(height: 20),
                        Divider(),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                              'Já tem uma conta? Clique aqui para entrar!'),
                        )
                      ],
                    ),
                  ),
                ),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        tooltip: 'Voltar a home page',
        child: const Icon(Icons.home),
      ),
    );
  }

  botaoCadastrar() {
    String nome = _nameController.text;
    String email = _emailController.text;
    String senha = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      print('Cadastro efetuado com sucesso!');
      print('Nome: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Senha: ${_passwordController.text}');
      _autenticacaoServico.cadastrarUsuario(
          nome: nome, email: email, senha: senha);
    } else {
      print('Cadastro falhou!');
    }
  }
}
