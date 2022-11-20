import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:revisa_ai_mobile/components/base_button.dart';
import 'package:revisa_ai_mobile/components/base_text_field.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = "/sign-up";
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

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
                          onPressed: () {
                            print("Submitted");
                          },
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
