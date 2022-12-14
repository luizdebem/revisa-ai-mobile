import 'package:flutter/material.dart';
import 'package:revisa_ai_mobile/components/base_bottom_nav_bar.dart';
import 'package:revisa_ai_mobile/screens/my_quizzes_screen.dart';
import 'package:revisa_ai_mobile/screens/profile_screen.dart';
import 'package:revisa_ai_mobile/screens/start_quiz_screen.dart';
import 'package:revisa_ai_mobile/screens/store_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pvController = PageController(initialPage: 1);

  final List<Widget> pageList = const [
    StoreScreen(),
    StartQuizScreen(),
    MyQuizzesScreen(),
    ProfileScreen(),
  ];

  int currentScreenIndex = 1;

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
