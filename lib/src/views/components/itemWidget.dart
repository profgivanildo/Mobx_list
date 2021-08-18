import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_lista/src/controllers/homeController.dart';
import 'package:mobx_lista/src/models/itemModel.dart';

class ItemWidget extends StatelessWidget {
  late ItemModel item;
  final Function()? removeClicked;
  final controller = HomeController();

  ItemWidget({Key? key, required this.item, required this.removeClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListTile(
        title: Text(item.title.toString()),
        leading: Checkbox(
          value: item.check,
          onChanged: item.setCheck,
        ),
        trailing: IconButton(
          onPressed: removeClicked,
          icon: Icon(Icons.remove_circle),
          color: Colors.red,
        ),
      );
    });
  }
}
