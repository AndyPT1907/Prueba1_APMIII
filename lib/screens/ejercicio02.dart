import 'package:flutter/material.dart';

class Ejercicio02Screen extends StatefulWidget {
  const Ejercicio02Screen({super.key});

  @override
  _Ejercicio02ScreenState createState() => _Ejercicio02ScreenState();
}

class _Ejercicio02ScreenState extends State<Ejercicio02Screen> {
  final TextEditingController _velocidadController = TextEditingController();
  String _resultado = "";

  // Método para calcular la distancia
  void calcularDistancia() {
    final double velocidad = double.tryParse(_velocidadController.text) ?? 0.0;
    const double tiempo = 100; 
    if (velocidad <= 0) {
      setState(() {
        _resultado = "Por favor, ingrese un valor válido para la velocidad.";
      });
      return;
    }
    final double distancia = velocidad * tiempo;
    setState(() {
      _resultado = "Distancia: ${distancia.toStringAsFixed(2)} metros";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio02'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
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
                  controller: _velocidadController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Velocidad en m/s',
                    filled: true,
                    fillColor: Colors.white70, // Para que el texto sea legible sobre la imagen
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: calcularDistancia,
                  child: const Text('Calcular Distancia'),
                ),
                const SizedBox(height: 16),
                Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, backgroundColor: Colors.white70), // Para que el texto sea legible sobre la imagen
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
