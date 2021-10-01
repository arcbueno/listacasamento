import 'package:lista_casamento/models/item_lista.dart';
import 'package:lista_casamento/services/item_lista.service.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  final ItemListaService service = ItemListaService();

  final _listaItens = BehaviorSubject<List<ItemLista>>();
  Stream<List<ItemLista>> get listaItensStream => _listaItens.stream;

  HomeViewModel() {
    refresh();
  }

  refresh() {
    service.getAll().then((value) {
      _listaItens.add(value);
    });
  }

  void dispose() {
    _listaItens.close();
  }
}
