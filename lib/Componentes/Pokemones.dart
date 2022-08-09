class nota_pokemon {
  String nombre = '';
  String posicion = '';
  String url= '';
  late List<String> version;
  int indices = 0;
  late Property property;
  String url_imagen = '';

  nota_pokemon(this.url_imagen,this.nombre,this.url,this.indices);

  nota_pokemon.fromJson(Map<String, dynamic> json) {
    nombre = json['name'];
    url = json['url'];
    String result = url.substring(url.length - 3, url.length - 1);
    indices = int.parse(numberFormat(result));
    url_imagen = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/'+indices.toString()+'.png';

  }
}
class Property{
  String name = '';
  String url = '';

  Property({
    required this.name,
    required this.url
  });
  factory Property.fromJson(Map<String, dynamic> json){
    return Property(
        name: json['name'],
        url: json['url']
    );
  }
}
String numberFormat(String x) {
  RegExp re = RegExp('/');
  x = x.replaceAll(re, '');
  return x;
}

