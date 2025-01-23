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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay verduras disponibles.'));
          }

          List<Verdura> verduras = snapshot.data!;
          return ListView.builder(
            itemCount: verduras.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(verduras[index].descripcion),
                subtitle: Text('Precio: ${verduras[index].precio}'),
              );
            },
          );
        },
      ),
    );
  }
}
