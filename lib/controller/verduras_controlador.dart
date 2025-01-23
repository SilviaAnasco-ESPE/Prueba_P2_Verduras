import 'dart:convert';
import 'package:evaluacion_u2/model/verduras_model.dart';
import 'package:http/http.dart' as http;

class VerduraController {
  final String url = 'https://drive.google.com/file/d/1VlOMzg6X1CwsNJSWJ1XMLYtjL0yYDBdQ/view?usp=sharing';

  Future<List<Verdura>> fetchVerduras() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((verdura) => Verdura.fromJson(verdura)).toList();
    } else {
      throw Exception('Error al cargar las verduras');
    }
  }

  Future<void> updateVerdura(Verdura verdura) async {
    // Aquí se implementaría la lógica para actualizar la verdura en el JSON
    // Debes implementar la lógica para enviar el JSON actualizado a Google Drive
  }

  Future<void> deleteVerdura(int codigo) async {
    // Implementar lógica para eliminar una verdura del JSON
    // Debes implementar la lógica para enviar el JSON actualizado a Google Drive
  }

  Future<void> addVerdura(Verdura verdura) async {
    // Implementar lógica para agregar una nueva verdura al JSON
    // Debes implementar la lógica para enviar el JSON actualizado a Google Drive
  }
}
