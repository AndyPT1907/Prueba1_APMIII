import 'package:flutter/material.dart';
import 'package:prueba_1_apm3/screens/ejercicio02.dart';

class PruebaScreen extends StatelessWidget {
  const PruebaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://png.pngtree.com/background/20230517/original/pngtree-wolfs-full-hd-wallpaper-art-wallpaper-1920x1080-1080p-picture-image_2634113.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Nombre : Andy Tituaña",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const Text(
                "Usuario de GitHub: AndyPT1907",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirmación'),
                        content: const Text('¿Desea ir al Ejercicio 02?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Ejercicio02Screen()),
                              );
                            },
                            child: const Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Ir a Ejercicio 02'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
