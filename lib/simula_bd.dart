class SimulaBD {
  static List<String> listaDeNomes = ['Lista 1', 'Lista 2', 'Lista 3', 'Lista 4'];
  static String email = 'adm@gmail.com';
  static String senha = '123';

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
