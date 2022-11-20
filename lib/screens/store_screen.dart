import 'package:carousel_slider/carousel_slider.dart';
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
            children: const [
              Icon(
                Icons.paid_outlined,
                color: Colors.green,
              ),
              SizedBox(width: 6),
              Text(
                "300",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        const Text(
          "Clique em um item da listagem para resgatar!",
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
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          i,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
