import 'package:flutter/material.dart';
import 'package:revisa_ai_mobile/components/base_button.dart';
import 'package:revisa_ai_mobile/screens/home_screen.dart';

class ResultScreen extends StatefulWidget {
  static const routeName = "/results";
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
                const Text("Parabéns! Sua nota foi:"),
                const Text(
                  "10",
                  style: TextStyle(fontSize: 150, color: Colors.blue),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Pontuação recebida neste quiz: "),
                    Text(
                      "100 moedas.",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                BaseButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    HomeScreen.routeName,
                    (route) => false,
                  ),
                  child: const Text("Sair"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
