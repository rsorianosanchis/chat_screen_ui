// This model takes all response data and map it in the instance, after we will take from the model the necessary data for entities.

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

  // YesNoMaybeModel has next method to cretate a new Message instance that is really that we use in app program.
  Message toMessageEntity() => Message(
    text: (answer=='yes')?'Si':'No', 
    fromWho: FromWho.hers,
    imageUrl: image);
}
