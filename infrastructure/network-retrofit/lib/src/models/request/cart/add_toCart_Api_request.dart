import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class AddtoCartApiRequest
    implements BaseLayerDataTransformer<AddtoCartApiRequest, AddtoCartRequest> {

  @JsonKey(name: 'product')
  Product product;

  AddtoCartApiRequest(this.product);

  @override
  AddtoCartApiRequest restore(AddtoCartRequest data) {
    // TODO: implement restore
    return AddtoCartApiRequest(product);
  }

  @override
  AddtoCartRequest transform() {
    return AddtoCartRequest(product);
  }
}

