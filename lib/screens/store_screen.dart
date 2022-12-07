import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final List<String> titles = [
    "Uber\n\nCartão-presente de R\$50,00\n\nPreço: 1200 moedas",
    "iFood\n\nCartão-presente de R\$50,00\n\nPreço: 1200 moedas",
    "Americanas\n\nCartão-presente de R\$50,00\n\nPreço: 1200 moedas",
    "Starbucks\n\nCartão-presente de R\$50,00\n\nPreço: 1200 moedas",
    "PlayStation Store\n\nCartão-presente de R\$50,00\n\nPreço: 1200 moedas",
  ];

  final List<String> images = [
    'images/uber.png',
    'images/ifood.png',
    'images/americanas.png',
    'images/starbucks.png',
    'images/playstationstore.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 25, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.paid_outlined,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 6),
              Text(
                "300",
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        const Text(
          "Clique em um item para resgatá-lo!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
        CarouselSlider(
          options: CarouselOptions(height: 300, initialPage: 2),
          items: titles.map(
            (i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Em breve!"),
                            content: const Text(
                              "O resgate de itens na loja será implementado futuramente!",
                            ),
                            actions: <Widget>[
                              // define os botões na base do dialogo
                              TextButton(
                                child: const Text("Fechar"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            images[titles.indexOf(i)],
                            height: 150,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            i,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        const Spacer(),
      ],
    );
  }
}
