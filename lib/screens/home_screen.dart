import 'package:flutter/material.dart';
import 'package:revisa_ai_mobile/components/base_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pvController = PageController();

  final List<Widget> pageList = const [
    Text("Loja"),
    Text("Responder quiz"),
    Text("Meus quizes"),
    Text("Perfil"),
  ];

  int currentScreenIndex = 0;

  void changeScreen(int newScreenIndex) {
    setState(() {
      currentScreenIndex = newScreenIndex;
      pvController.jumpToPage(newScreenIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Revisa Aí"),
      ),
      body: PageView(
        controller: pvController,
        physics: const NeverScrollableScrollPhysics(),
        children: pageList,
      ),
      bottomNavigationBar: BaseBottomNavBar(
        currentIndex: currentScreenIndex,
        onChangeIndex: changeScreen,
      ),
    );
  }
}
