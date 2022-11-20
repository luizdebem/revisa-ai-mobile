import 'package:flutter/material.dart';

class BaseBottomNavBar extends StatefulWidget {
  final Function(int index)? onChangeIndex;
  final int currentIndex;

  const BaseBottomNavBar({
    Key? key,
    this.onChangeIndex,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<BaseBottomNavBar> createState() => _BaseBottomNavBarState();
}

class _BaseBottomNavBarState extends State<BaseBottomNavBar> {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.store_outlined,
      ),
      label: "Loja",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.edit_outlined,
      ),
      label: "Responder Quiz",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.note_outlined,
      ),
      label: "Meus Quizes",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline_outlined,
      ),
      label: "Perfil",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      onTap: (index) {
        widget.onChangeIndex!(index);
      },
      items: items,
    );
  }
}
