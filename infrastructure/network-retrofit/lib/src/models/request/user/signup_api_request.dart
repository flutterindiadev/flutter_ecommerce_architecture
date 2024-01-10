import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SignUpApiRequest
    implements BaseLayerDataTransformer<SignUpApiRequest, SignUpRequest> {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;

  SignUpApiRequest({required this.email, required this.password});

  @override
  restore(data) {
    return SignUpApiRequest(email: data.email, password: data.password);
  }

  @override
  SignUpRequest transform() {
    return SignUpRequest(email: email, password: password);
  }
}
