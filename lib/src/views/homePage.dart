import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_lista/src/controllers/homeController.dart';
import 'package:mobx_lista/src/models/itemModel.dart';
import 'package:mobx_lista/src/views/components/itemWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _dialog() {
    var item = ItemModel();

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Adicionar Item'),
          content: TextField(
            onChanged: item.setTitle,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Novo item',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                controller.addItem(item);
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: controller.setFilter,
          decoration: InputDecoration(hintText: "Pesquisar..."),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Observer(builder: (_) {
              return Text("${controller.totalChecked}");
            }),
          )
        ],
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
            itemCount: controller.listFiltered.length,
            itemBuilder: (_, index) {
              var item = controller.listFiltered[index];
              return ItemWidget(
                  removeClicked: () {
                    controller.removeItem(item);
                  },
                  item: item);
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
