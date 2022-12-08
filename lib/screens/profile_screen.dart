import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:localstorage/localstorage.dart';
import 'package:revisa_ai_mobile/components/base_button.dart';
import 'package:revisa_ai_mobile/components/base_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Map user = {
    "fullName": "",
    "email": "",
  };

  fetchUser() async {
    final prefs = await SharedPreferences.getInstance();

    final res = jsonDecode(prefs.getString("user")!);
    setState(() {
      user["fullName"] = res["fullName"];
      user["email"] = res["email"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: FormBuilder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Meu Perfil",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            BaseTextField(
              name: "fullName",
              keyboardType: TextInputType.name,
              labelText: "Nome completo",
              initialValue: user["fullName"],
            ),
            BaseTextField(
              name: "email",
              keyboardType: TextInputType.name,
              labelText: "E-mail",
              initialValue: user["email"],
            ),
            const BaseTextField(
              name: "newPassword",
              obscureText: true,
              labelText: "Alterar senha",
            ),
            SizedBox(
              width: double.infinity,
              child: BaseButton(
                onPressed: () {
                  print("Submitted");
                },
                child: const Text("SALVAR"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
