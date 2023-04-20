// En infrastuctura tenemos los elementos que nos sirven de puente entre las Entitys propias de nuesta logica de negocio/aplicaion y la representacion en pantalla.  Aqui es donde por ejemplo trataremos la data de fuera y la procesaremos a nuestro gusto.

// Aqui cremos instancia con todos los datos del response y los cargamos en una nueva instancia. Asi accederemos a las propiedades åpr instancia.propiedad para igualarla al entity en las propiedades que nois interese.
// class YesNoMaybeModel {
//   String answer;
//   bool forced;
//   String urlImage;

//   YesNoMaybeModel(
//       {required this.answer, required this.forced, required this.urlImage});

//   factory YesNoMaybeModel.fromJsonMap(Map<String, dynamic> json) {
//     return YesNoMaybeModel(
//       answer: json['answer'],
//       forced: json['forced'],
//       urlImage: json['image']);
//   }
// }
// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

// Aqui cremos instancia con todos los datos del response y los cargamos en una nueva instancia. Asi accederemos a las propiedades åpr instancia.propiedad para igualarla al entity en las propiedades que nois interese.

//String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

import 'package:yes_no_maybe_23/domain/entities/message.dart';

class YesNoMaybeModel {
  YesNoMaybeModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  final String answer;
  final bool forced;
  final String image;

  factory YesNoMaybeModel.fromJsonMap(Map<String, dynamic> json) =>
      YesNoMaybeModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
    text: (answer=='yes')?'afirmativo':'negativo', 
    fromWho: FromWho.hers,
    imageUrl: image);
}
