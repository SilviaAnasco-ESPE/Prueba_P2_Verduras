import 'package:evaluacion_u2/controller/verduras_controlador.dart';
import 'package:evaluacion_u2/model/verduras_model.dart';
import 'package:flutter/material.dart';

class VerdurasPage extends StatefulWidget {
  @override
  _VerdurasPageState createState() => _VerdurasPageState();
}

class _VerdurasPageState extends State<VerdurasPage> {
  final VerduraController controller = VerduraController();
  late Future<List<Verdura>> futureVerduras;

  @override
  void initState() {
    super.initState();
    futureVerduras = controller.fetchVerduras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestión de Verduras')),
      body: FutureBuilder<List<Verdura>>(
        future: futureVerduras,
        builder: (context, snapshot) {
          // Manejo de estados más detallado
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 60),
                      Text('Error al cargar verduras', 
                        style: TextStyle(color: Colors.red)),
                      Text('${snapshot.error}'),
                      ElevatedButton(
                        onPressed: () => setState(() {
                          futureVerduras = controller.fetchVerduras();
                        }),
                        child: Text('Reintentar'),
                      )
                    ],
                  ),
                );
              }
              
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.agriculture, size: 60),
                      Text('No hay verduras disponibles'),
                    ],
                  ),
                );
              }

              List<Verdura> verduras = snapshot.data!;
              return ListView.builder(
                itemCount: verduras.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.local_grocery_store),
                    title: Text(verduras[index].descripcion),
                    subtitle: Text('Código: ${verduras[index].codigo} - Precio: \$${verduras[index].precio}'),
                  );
                },
              );
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}