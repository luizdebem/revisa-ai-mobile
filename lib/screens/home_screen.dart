import 'package:flutter/material.dart';
import 'package:revisa_ai_mobile/components/base_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreenIndex = 0;

  void changeScreen(int newScreenIndex) {
    setState(() {
      currentScreenIndex = newScreenIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Revisa Aí"),
      ),
      body: const Text("Home Screen Router"),
      bottomNavigationBar: BaseBottomNavBar(
        currentIndex: currentScreenIndex,
        onChangeIndex: changeScreen,
      ),
    );
  }
}
