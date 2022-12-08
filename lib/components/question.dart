import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:revisa_ai_mobile/models/quiz_model.dart';

import 'base_button.dart';

class QuestionWidget extends StatefulWidget {
  final int index;
  final Question question;
  final Function onSelect;
  const QuestionWidget({
    Key? key,
    required this.index,
    required this.question,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int selectedOption = -1;

  final numberFormatDictionary = {
    0: "a)",
    1: "b)",
    2: "c)",
    3: "d)",
  };

  String alternatives() {
    String res = "";
    widget.question.alternatives!.asMap().forEach((key, value) {
      res += "${numberFormatDictionary[key]} $value\n";
    });
    return res;
  }

  void select(int option) {
    setState(() {
      selectedOption = option;
      widget.onSelect(option);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Questão ${widget.index}"),
        const SizedBox(height: 15),
        Text(
          widget.question.statement!,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 15),
        widget.question.imagePath != null
            ? Image.network(
                "http://localhost:3001/" + widget.question.imagePath!)
            : Container(),
        const SizedBox(height: 15),
        Text(alternatives()),
        const SizedBox(height: 15),
        Center(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseButton(
                    highlighted: selectedOption == 0,
                    onPressed: () => select(0),
                    child: const Text("A"),
                  ),
                  const SizedBox(width: 5),
                  BaseButton(
                    highlighted: selectedOption == 1,
                    onPressed: () => select(1),
                    child: const Text("B"),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseButton(
                    highlighted: selectedOption == 2,
                    onPressed: () => select(2),
                    child: const Text("C"),
                  ),
                  const SizedBox(width: 5),
                  BaseButton(
                    highlighted: selectedOption == 3,
                    onPressed: () => select(3),
                    child: const Text("D"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
