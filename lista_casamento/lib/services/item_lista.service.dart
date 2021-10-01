import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lista_casamento/models/item_lista.dart';

class ItemListaService {
  Future<List<ItemLista>> getAll() async {
    var listaQuery = await FirebaseFirestore.instance
        .collection('/teste')
        .orderBy('comodo')
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
