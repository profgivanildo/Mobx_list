import 'package:mobx/mobx.dart';
import 'package:mobx_lista/src/models/itemModel.dart';
part 'homeController.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: 'O primeiro item', check: true),
    ItemModel(title: 'O segundo item', check: false),
    ItemModel(title: 'O item número 3', check: false),
    ItemModel(title: 'O quarto item', check: true),
  ].asObservable();

  @observable
  String filter = '';

  @computed
  List<ItemModel> get listFiltered {
    if (listItems.isEmpty) {
      return listItems;
    } else {
      return listItems
          .where((element) =>
              element.title!.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @computed
  int get totalChecked =>
      listItems.where((element) => element.check == true).length;

  @action
  setFilter(String value) => filter = value;

  @action
  addItem(ItemModel item) {
    listItems.add(item);
  }

  @action
  removeItem(ItemModel item) {
    listItems.removeWhere((element) => element.title == item.title);
  }
}
