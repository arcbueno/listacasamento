import 'package:flutter/material.dart';
import 'package:lista_casamento/models/item_lista.dart';
import 'package:lista_casamento/screens/home.screen/home.viewmodel.dart';

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
                    backgroundImage: AssetImage('praia.jpg'),
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
                  'Esse site foi apenas uma forma com que a gente achou de facilitar a escolha de compras dos presentes para o nosso casamento. \nPartiu da idéia de tentar ajudar ambos os lados: os de quem irão nos ajudar nessa nova etapa, no caso vocês :P,  e o da gente, pra conseguir gerenciar bonitinho nossas coisas. \nEntendemos que durante essa pandemia muita coisa ocorreu, principalmente perda de emprego, então queriamos evitar que uma pessoa acabe gastando em nós mais do que ela pudesse. \nA gente já agradece só você abrir esse link :)',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                decoration: BoxDecoration(
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
                      return ListView.builder(
                        itemCount: lista.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(lista[index].nome),
                          );
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
