import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:revisa_ai_mobile/components/base_button.dart';
import 'package:revisa_ai_mobile/components/base_text_field.dart';
import 'package:revisa_ai_mobile/helpers.dart';
import 'package:revisa_ai_mobile/screens/login_screen.dart';
import 'package:revisa_ai_mobile/services/login_service.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = "/sign-up";
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  void submit() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _formKey.currentState
          ?.saveAndValidate(); // @TODO adicionar validação e tratamento
    }

    try {
      await LoginService.signup({
        "fullName": _formKey.currentState!.fields["fullName"]!.value,
        "email": _formKey.currentState!.fields["email"]!.value,
        "password": _formKey.currentState!.fields["password"]!.value,
        "role": 0,
      }) as Response;

      Helpers.showToast(
        msg: "Cadastro realizado com sucesso.",
        success: true,
      );

      Navigator.of(context).pushNamedAndRemoveUntil(
        LoginScreen.routeName,
        (route) => false,
      );
      return;
    } catch (e) {
      Helpers.showToast(msg: "Ocorreu um erro interno.", success: false);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Revisa Aí"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Formulário de cadastro"),
                const SizedBox(height: 20),
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      const BaseTextField(
                        name: "fullName",
                        labelText: "Nome completo",
                      ),
                      const BaseTextField(
                        name: "email",
                        labelText: "E-mail",
                      ),
                      const BaseTextField(
                        name: "password",
                        labelText: "Senha",
                        obscureText: true,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: BaseButton(
                          onPressed: submit,
                          child: const Text("CADASTRAR"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
