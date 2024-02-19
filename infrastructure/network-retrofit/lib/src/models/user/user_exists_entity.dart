import 'package:data/data.dart';

class UserExistsEntity
    implements BaseLayerDataTransformer<UserExistsEntity, bool> {
  final bool userexists;

  UserExistsEntity(this.userexists);

  @override
  UserExistsEntity restore(bool data) {
    return UserExistsEntity(data);
  }

  @override
  bool transform() {
    return userexists;
  }
}
