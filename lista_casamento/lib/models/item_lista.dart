class ItemLista {
  String id;
  String nome;
  String comodo;
  String link;
  bool reservado;

  ItemLista({
    required this.id,
    required this.nome,
    required this.comodo,
    required this.link,
    required this.reservado,
  });

  ItemLista copyWith({
    String? id,
    String? nome,
    String? comodo,
    String? link,
    bool? reservado,
  }) {
    return ItemLista(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      comodo: comodo ?? this.comodo,
      link: link ?? this.link,
      reservado: reservado ?? this.reservado,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'comodo': comodo,
      'link': link,
      'reservado': reservado,
    };
  }

  factory ItemLista.fromMap(String id, Map<String, dynamic> map) {
    return ItemLista(
      id: id,
      nome: map['nome'],
      comodo: map['comodo'],
      link: map['link'],
      reservado: map['reservado'],
    );
  }

  @override
  String toString() {
    return 'ItemLista(id: $id, nome: $nome, comodo: $comodo, link: $link, reservado: $reservado)';
  }
}
