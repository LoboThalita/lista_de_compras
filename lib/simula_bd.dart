import 'package:lista_de_compras/Entidades/Item.dart';
import 'package:lista_de_compras/Entidades/Lista.dart';

class SimulaBD {
  static String email = 'adm@gmail.com';
  static String senha = '123';

  static List<Lista> listas = [
    Lista(nome: 'Lista 1', itens: [
      Item(
        nome: 'Item 1',
        quantidade: 2,
        unidadeDeMedida: 'un',
        categoria: 'Categoria A',
        notasAdicionais: 'Notas sobre o item 1',
        comprado: false,
      ),
      Item(
        nome: 'Item 2',
        quantidade: 1.5,
        unidadeDeMedida: 'kg',
        categoria: 'Categoria B',
        notasAdicionais: 'Notas sobre o item 2',
        comprado: true,
      ),
    ]),
    Lista(nome: 'Lista 2', itens: [
      Item(
        nome: 'Item A',
        quantidade: 3,
        unidadeDeMedida: 'un',
        categoria: 'Categoria C',
        notasAdicionais: 'Notas sobre o item A',
        comprado: false,
      ),
      Item(
        nome: 'Item B',
        quantidade: 0.5,
        unidadeDeMedida: 'kg',
        categoria: 'Categoria D',
        notasAdicionais: 'Notas sobre o item B',
        comprado: false,
      ),
    ]),
  ];

//Métodos referentes a login
  static bool login(String Email, String Senha) {
    if (Email == email && Senha == senha) return true;

    return false;
  }

  static void redefinirSenha(String Senha) {
    senha = Senha;
  }

//Métodos referentes a Lista
  static void criarLista(String nomeLista) {
    bool listaExistente = listas.any((lista) => lista.nome == nomeLista);

    if (!listaExistente) {
      Lista novaLista = Lista(nome: nomeLista, itens: []);
      listas.add(novaLista);
    }
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
    Lista? listaEncontrada;
    for (int i = 0; i < listas.length; i++) {
      if (listas[i].nome == nomeLista) {
        listaEncontrada = listas[i];
        break;
      }
    }
    return listaEncontrada;
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

    if (listaEncontrada != null) {
      return listaEncontrada.itens;
    } else {
      return [];
    }
  }

  static void comprarItem(String nomeLista, String nomeItem) {
    int index = encontraIndexLista(nomeLista);

    Item item = listas[index].itens.firstWhere((element) => element.nome == nomeItem);

    item.comprado = !item.comprado;
  }
}
