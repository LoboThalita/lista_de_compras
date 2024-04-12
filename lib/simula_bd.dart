class SimulaBD {
  static String email = 'adm@gmail.com';
  static String senha = '123';

  static List<List<dynamic>> listas = [
    [
      'Lista 1',
      ['Item 1', 'Item 2', 'Item 3']
    ],
    [
      'Lista 2',
      ['Item A', 'Item B', 'Item C']
    ],
    [
      'Lista 3',
      ['Item X', 'Item Y', 'Item Z']
    ],
  ];

  static void adicionarItem(String nomeLista, String novoItem) {
    int index = encontraIndexLista(nomeLista);
    listas[index][1].add(novoItem);
  }

  static void criarLista(String nomeLista) {
    bool listaExistente = listas.any((lista) => lista[0] == nomeLista);

    if (!listaExistente) {
      listas.add([nomeLista, []]);
    }
  }

  static void excluirLista(String nomeLista) {
    int index = encontraIndexLista(nomeLista);

    if (index != -1) {
      listas.removeAt(index);
    }
  }

  static void excluirItem(String nomeLista, String item) {
    int indexLista = encontraIndexLista(nomeLista);

    if (indexLista != -1) {
      int indexItem = listas[indexLista][1].indexOf(item);
      if (indexItem != -1) {
        listas[indexLista][1].removeAt(indexItem);
      }
    }
  }

  static List<String> recuperarListas() {
    return listas.map((lista) => lista[0] as String).toList();
  }

  static List<String> recuperarItens(String nomeLista) {
    List<dynamic>? listaEncontrada = encontraLista(nomeLista);

    if (listaEncontrada != null) {
      return List<String>.from(listaEncontrada[1]);
    } else {
      return [];
    }
  }

  static bool login(String Email, String Senha) {
    if (Email == email && Senha == senha) return true;

    return false;
  }

  static void redefinirSenha(String Senha) {
    senha = Senha;
  }

  static int encontraIndexLista(String nomeLista) {
    int index = -1;
    for (int i = 0; i < listas.length; i++) {
      if (listas[i][0] == nomeLista) {
        index = i;
        break;
      }
    }
    return index;
  }

  static List<dynamic>? encontraLista(String nomeLista) {
    List<dynamic>? listaEncontrada;
    for (int i = 0; i < listas.length; i++) {
      if (listas[i][0] == nomeLista) {
        listaEncontrada = listas[i];
        break;
      }
    }
    return listaEncontrada;
  }
}
