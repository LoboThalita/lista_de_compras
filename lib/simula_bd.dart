class SimulaBD {
  static List<String> listaDeNomes = ['Lista 1', 'Lista 2', 'Lista 3', 'Lista 4'];
  static String email = 'adm@gmail.com';
  static String senha = '123';

  
//refatorar todo o BD para essa lsita dinamica
  static List<List<dynamic>> listas = [
    ['Lista 1', ['Item 1', 'Item 2', 'Item 3']],
    ['Lista 2', ['Item A', 'Item B', 'Item C']],
    ['Lista 3', ['Item X', 'Item Y', 'Item Z']],
  ];

  static void adicionarLista(String nome) {
    listaDeNomes.add(nome);
  }

  static void excluirLista(String nome) {
    listaDeNomes.remove(nome);
  }

  static List<String> recuperarListas() {
    return listaDeNomes;
  }

  static bool login(String Email, String Senha){
    if(Email == email && Senha == senha) return true;

    return false;
  }

  static void redefinirSenha(String Senha){
    senha = Senha;
  }
}
