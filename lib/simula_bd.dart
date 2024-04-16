import 'package:lista_de_compras/Entidades/Item.dart';
import 'package:lista_de_compras/Entidades/Lista.dart';

class SimulaBD {
  static String email = 'adm@gmail.com';
  static String senha = '123';

  static List<Lista> listas = [
    Lista(nome: 'Lista Supermercado', itens: [
      Item(
        nome: 'Chocolate',
        quantidade: 2,
        unidadeDeMedida: 'un',
        categoria: 'Doces',
        notasAdicionais: 'Meio amargo',
        comprado: false,
      ),
      Item(
        nome: 'Brócolis',
        quantidade: 100.5,
        unidadeDeMedida: 'gm',
        categoria: 'Legumes',
        comprado: false,
      ),
    ]),
    Lista(nome: 'Farmácia', itens: [
      Item(
        nome: 'Remédio de dor de cabeça',
        quantidade: 3,
        unidadeDeMedida: 'un',
        categoria: 'Remédio',
        notasAdicionais: 'De preferencia neusaudina',
        comprado: false,
      ),
    ]),
  ];

//Métodos referentes a login
  static bool login(String Email, String Senha) {
    return Email == email && Senha == senha ? true : false;
  }

  static String? recuperarSenha(String emailDeRecuperacao) {
    return email == emailDeRecuperacao ? senha : null;
  }

//Métodos referentes a Lista
  static void criarLista(String nomeLista) {
    bool listaExistente = listas.any((lista) => lista.nome == nomeLista);

    if (!listaExistente) {
      Lista novaLista = Lista(nome: nomeLista, itens: []);
      listas.add(novaLista);
    }
  }

  static void editaNomeLista(String nomeAntigo, String nomeNovo) {
    int index = encontraIndexLista(nomeAntigo);

    listas[index].nome = nomeNovo;
  }

  static List<String> recuperarListas() {
    return listas.map((lista) => lista.nome).toList();
  }

  static void excluirLista(String nomeLista) {
    int index = encontraIndexLista(nomeLista);

    if (index != -1) {
      listas.removeAt(index);
    }
  }

  static int encontraIndexLista(String nomeLista) {
    int index = -1;
    for (int i = 0; i < listas.length; i++) {
      if (listas[i].nome == nomeLista) {
        index = i;
        break;
      }
    }
    return index;
  }

  static Lista? encontraLista(String nomeLista) {
    int index = encontraIndexLista(nomeLista);
    return listas[index];
  }

//Métodos referentes aos itens
  static void adicionarItem(String nomeLista, Item novoItem) {
    int index = encontraIndexLista(nomeLista);

    if (!listas[index].itens.any((element) => element.nome == novoItem.nome)) {
      listas[index].adicionarItem(novoItem);
    }
  }

  static void excluirItem(String nomeLista, String nomeItem) {
    int indexLista = encontraIndexLista(nomeLista);

    if (indexLista != -1) {
      listas[indexLista].excluirItem(nomeItem);
    }
  }

  static List<Item> recuperarItens(String nomeLista) {
    Lista? listaEncontrada = encontraLista(nomeLista);

    return listaEncontrada != null ? listaEncontrada.itens : [];
  }

  static void editarItem(String nomeLista, Item itemAntigo, Item novoItem) {
    int index = encontraIndexLista(nomeLista);

    Item antigo = listas[index]
        .itens
        .firstWhere((element) => element.nome == itemAntigo.nome);

    antigo.nome = novoItem.nome;
    antigo.categoria = novoItem.categoria;
    antigo.notasAdicionais = novoItem.notasAdicionais;
    antigo.quantidade = novoItem.quantidade;
    antigo.unidadeDeMedida = novoItem.unidadeDeMedida;
  }

  static void comprarItem(String nomeLista, String nomeItem) {
    Item? item = pesquisarItem(nomeLista, nomeItem);
    if (item != null) item.comprado = !item.comprado;
  }

  static Item? pesquisarItem(String nomeLista, String nomeItem) {
    int index = encontraIndexLista(nomeLista);

    try {
      return listas[index]
          .itens
          .firstWhere((element) => element.nome == nomeItem);
    } catch (e) {
      return null;
    }
  }
}
