import 'package:flutter/material.dart';
import 'package:lista_casamento/models/item_lista.dart';
import 'package:lista_casamento/screens/home.screen/home.viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.pink,
                Colors.pink.shade100,
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 250,
                    backgroundImage: NetworkImage(
                        'https://i.ibb.co/CQ5Y0dH/20200829-164143.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Lista de casamento de Pedro e Rebeca',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Esse site foi apenas uma forma com que a gente achou de facilitar a escolha de compras dos presentes para o nosso casamento. \nPartiu da idéia de tentar ajudar ambos os lados: os de quem irão nos ajudar nessa nova etapa, no caso vocês :P,  e o da gente, pra conseguir gerenciar bonitinho.\nEntendemos que durante essa pandemia muita coisa ocorreu, então queriamos evitar que uma pessoa acabe gastando em nós mais do que ela pudesse.\nA gente já agradece só você abrir esse link :)',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.pink[100]!,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: StreamBuilder<List<ItemLista>>(
                    initialData: [],
                    stream: _viewModel.listaItensStream,
                    builder: (context, snapshot) {
                      var lista = snapshot.data ?? [];
                      return DataTable(
                        columns: [
                          DataColumn(
                            label: Text(
                              'Cômodo',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Nome',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Link sugerido',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Já reservado',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                        rows: lista
                            .map(
                              (e) => DataRow(cells: [
                                DataCell(
                                  Text(e.comodo),
                                ),
                                DataCell(
                                  Text(e.nome),
                                ),
                                DataCell(
                                  InkWell(
                                    onTap: e.link.isNotEmpty
                                        ? () => launch(e.link)
                                        : null,
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      child: Text(
                                        e.link,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Checkbox(
                                    value: e.reservado,
                                    onChanged: (bool? value) => print("aaa"),
                                  ),
                                ),
                              ]),
                            )
                            .toList(),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
