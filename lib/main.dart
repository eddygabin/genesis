import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(
        id: 1, titre: 'Achat téléphone', montant: 100, date: DateTime.now()),
    Transaction(id: 1, titre: 'Achat TV', montant: 200, date: DateTime.now()),
  ];
  String inputTitre = "";
  String inputMontant = "";
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Personal Expenses"),
        ),
        body: Column(
          children: [
            Container(
              child: Card(
                child: Text("Mes Charts"),
                color: Colors.yellow,
                elevation: 5,
              ),
            ),
            Card(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Description'),
                    onChanged: (value) {
                      inputTitre = value;
                    },
                  ),
                  TextField(
                      decoration: InputDecoration(labelText: 'Montant'),
                      onChanged: (value) {
                        inputMontant = value;
                      }),
                  TextButton(
                      onPressed: () {
                        print(inputTitre);
                        print(inputMontant);
                      },
                      child: Text('Ajouter Transaction'))
                ],
              ),
            ),
            Column(
              children: transactions.map((t) {
                return Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.purple,
                            width: 3,
                          )),
                      child: Text(
                        "\$${t.montant.toString()}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (t.titre),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: const Color.fromARGB(255, 5, 5, 5),
                          ),
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(t.date),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                );
              }).toList(),
            )
          ],
        ));
  }
}
