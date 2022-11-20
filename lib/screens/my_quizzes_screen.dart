import 'package:flutter/material.dart';

class MyQuizzesScreen extends StatefulWidget {
  const MyQuizzesScreen({Key? key}) : super(key: key);

  @override
  State<MyQuizzesScreen> createState() => _MyQuizzesScreenState();
}

class _MyQuizzesScreenState extends State<MyQuizzesScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: DataTable(
        columns: const [
          DataColumn(
            label: Text("Data"),
          ),
          DataColumn(
            label: Text("Nome"),
          ),
          DataColumn(
            label: Text("Nota"),
          ),
          DataColumn(
            label: Text("Moedas"),
          ),
        ],
        rows: const [
          DataRow(
            cells: [
              DataCell(Text("12/11/2022")),
              DataCell(Text("Av 1")),
              DataCell(Text("10")),
              DataCell(Text("100")),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text("12/11/2022")),
              DataCell(Text("Av 1")),
              DataCell(Text("10")),
              DataCell(Text("100")),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text("12/11/2022")),
              DataCell(Text("Av 1")),
              DataCell(Text("10")),
              DataCell(Text("100")),
            ],
          ),
        ],
      ),
    );
  }
}
