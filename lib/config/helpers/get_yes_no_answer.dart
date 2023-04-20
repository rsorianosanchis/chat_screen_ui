import 'package:dio/dio.dart';
import 'package:yes_no_maybe_23/domain/entities/message.dart';
import 'package:yes_no_maybe_23/infrastructure/models/yes_no_maybe_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    // Aqui usariamos el modelo intermedio antes de cargar datos en la entidad Message
    final tempInstance = YesNoMaybeModel.fromJsonMap(response.data);

    // return Message(
    //     text: tempInstance.answer,
    //     fromWho: FromWho.hers,
    //     imageUrl: tempInstance.image);

    return tempInstance.toMessageEntity();
  }
}
