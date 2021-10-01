import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lista_casamento/models/item_lista.dart';

class ItemListaService {
  Future<List<ItemLista>> getAll() async {
    var listaQuery = await FirebaseFirestore.instance
        .collection('/itens_teste')
        .orderBy('nome')
        .get();

    var listaItens = listaQuery.docs
        .map(
          (e) => ItemLista.fromMap(
            e.id,
            e.data(),
          ),
        )
        .toList();

    return listaItens;
  }
}
