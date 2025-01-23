class Verdura {
  final int codigo;
  final String descripcion;
  final double precio;

  Verdura({required this.codigo, required this.descripcion, required this.precio});

  factory Verdura.fromJson(Map<String, dynamic> json) {
    return Verdura(
      codigo: json['codigo'],
      descripcion: json['descripcion'],
      precio: json['precio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'descripcion': descripcion,
      'precio': precio,
    };
  }
}
