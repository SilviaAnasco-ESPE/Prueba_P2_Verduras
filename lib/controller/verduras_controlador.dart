import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:evaluacion_u2/model/verduras_model.dart';

class VerduraController {
  final String url = 'https://gist.githubusercontent.com/YormanOna/ac2aab69d0985d54591a34f8816b108d/raw/Verduras.json';

  Future<List<Verdura>> fetchVerduras() async {
    try {
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((verdura) => Verdura.fromJson(verdura)).toList();
      } else {
        throw Exception('Error al cargar: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}