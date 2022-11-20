import 'package:flutter/material.dart';

import 'base_button.dart';

class Question extends StatefulWidget {
  final int index;
  const Question({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Questão ${widget.index}"),
        const SizedBox(height: 15),
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut luctus enim ut diam faucibus feugiat. Sed laoreet varius ligula. Praesent at ipsum ut est sodales hendrerit. Aliquam faucibus nisi odio, at ornare sapien rhoncus sed. Morbi porttitor sollicitudin velit, imperdiet dapibus tellus blandit non. Aliquam ut mollis purus. Aenean libero enim, commodo in lobortis eget, bibendum ac eros.",
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 15),
        Image.network(
          "https://s2.static.brasilescola.uol.com.br/be/2022/06/2-mapa-mundi.jpg",
          width: double.infinity,
        ),
        const SizedBox(height: 15),
        const Text("a) Brasil\nb) Argentina\nc) Bolívia\nd) Equador"),
        const SizedBox(height: 15),
        Center(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseButton(onPressed: () {}, child: const Text("A")),
                  const SizedBox(width: 5),
                  BaseButton(onPressed: () {}, child: const Text("B")),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseButton(onPressed: () {}, child: const Text("C")),
                  const SizedBox(width: 5),
                  BaseButton(onPressed: () {}, child: const Text("D")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
