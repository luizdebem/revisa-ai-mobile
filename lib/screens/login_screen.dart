import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:localstorage/localstorage.dart';
import 'package:revisa_ai_mobile/components/base_button.dart';
import 'package:revisa_ai_mobile/components/base_text_field.dart';
import 'package:revisa_ai_mobile/helpers.dart';
import 'package:revisa_ai_mobile/screens/home_screen.dart';
import 'package:revisa_ai_mobile/screens/signup_screen.dart';
import 'package:revisa_ai_mobile/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  void login() async {
    if (!_formKey.currentState!.saveAndValidate()) {
      _formKey.currentState
          ?.saveAndValidate(); // @TODO adicionar validação e tratamento
    }

    try {
      final res =
          await LoginService.login(_formKey.currentState!.value) as Response;
      final data = res.data;

      LocalStorage("revisa_ai").setItem("accessToken", data["accessToken"]);
      LocalStorage("revisa_ai").setItem("user", jsonEncode(data["user"]));
      Navigator.of(context).pushNamedAndRemoveUntil(
        HomeScreen.routeName,
        (route) => false,
      );
      return;
    } catch (e) {
      if (e is DioError && e.response!.statusCode == 400) {
        Helpers.showToast(msg: "Email ou senha incorretos.", success: false);
        return;
      }
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
                const Spacer(),
                const Text("Bem-vindo ao app Revisa Aí"),
                const SizedBox(height: 20),
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
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
                          onPressed: login,
                          child: const Text("ENTRAR"),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    SignupScreen.routeName,
                  ),
                  child: const Text(
                    "Ainda não tem uma conta? Cadastre-se aqui.",
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
