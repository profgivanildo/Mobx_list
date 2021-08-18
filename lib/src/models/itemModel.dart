import 'package:mobx/mobx.dart';
part 'itemModel.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  _ItemModelBase({this.title, this.check = false});

  @observable
  late String? title;

  @observable
  late bool? check;

  @action
  setTitle(String? value) => title = value;

  @action
  setCheck(bool? value) => check = value;
}
