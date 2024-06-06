import 'package:flutter/material.dart';

class Ejercicio01Screen extends StatefulWidget {
  const Ejercicio01Screen({super.key});

  @override
  _Ejercicio01ScreenState createState() => _Ejercicio01ScreenState();
}

class _Ejercicio01ScreenState extends State<Ejercicio01Screen> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  String resultado = "";

  void calcularIMC() {
    final double altura = double.tryParse(_alturaController.text) ?? 0.0;
    final double peso = double.tryParse(_pesoController.text) ?? 0.0;
    if (altura <= 0 || peso <= 0) {
      setState(() {
        resultado = "Por favor, ingrese valores válidos.";
      });
      return;
    }
    final double imc = peso / (altura * altura);
    String rango;
    if (imc < 18.5) {
      rango = "Bajo peso";
    } else if (imc >= 18.5 && imc < 25) {
      rango = "Peso normal";
    } else if (imc >= 25 && imc < 30) {
      rango = "Sobrepeso";
    } else {
      rango = "Obesidad";
    }
    setState(() {
      resultado = "IMC: ${imc.toStringAsFixed(2)}\nrango: $rango";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 01'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              //Imagen locla
              image: DecorationImage(
                image: NetworkImage('https://images.pexels.com/photos/719396/pexels-photo-719396.jpeg?cs=srgb&dl=pexels-gabriel-peter-219375-719396.jpg&fm=jpg'), // Reemplaza esta URL con la de tu imagen
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _alturaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Altura en metros',
                    filled: true,
                    fillColor: Colors.white70, 
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _pesoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Peso en kilogramos',
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: calcularIMC,
                  child: const Text('Calcular IMC'),
                ),
                const SizedBox(height: 16),
                Text(
                  resultado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, backgroundColor: Colors.white70), 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}