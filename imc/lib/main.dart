import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Imc(),
  ));
}

class Imc extends StatefulWidget {
  const Imc({Key? key}) : super(key: key);

  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String infor = "Informe seus Dados";

  void reset() {
    setState(() {
      pesoController.text = "";
      alturaController.text = "";
      infor = "Informe seus Dados";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(pesoController.text);
      double height = double.parse(alturaController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.5) {
        infor = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc <= 24.9) {
        infor = "Peso normal(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25.0 && imc <= 29.9) {
        infor = "Sobrepeso(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc <= 34.9) {
        infor = "Obesidade grau 1 (${imc.toStringAsPrecision(3)})";
      } else {
        infor = "Obesidade grau 2 (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(16),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Calculadora IMC",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          centerTitle: true,
          actions: [IconButton(onPressed: reset, icon: Icon(Icons.refresh))],
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.green,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (Kg):",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: pesoController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm):",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: alturaController,
              ),
              ElevatedButton(
                onPressed: _calculate,
                child: Text('Calcular'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 25)),
              ),
              Text(
                infor,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}
