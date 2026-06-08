import 'dart:io';
 
class Produto {
  int codigo;
  String nome;
  double preco;
 
  Produto(this.codigo, this.nome, this.preco);
}
 
class Carrinho {
  List<String> produtos = [];
  List<double> valores = [];
 
  bool get estaCheio => produtos.length >= 3;
 
  void adicionar(String nome, double preco) {
    if (estaCheio) {
      print("O seu carrinho já atingiu o limite de produtos.");
    } else {
      produtos.add(nome);
      valores.add(preco);
      print("$nome adicionado ao carrinho!");
    }
  }
 
  void listar() {
    for (int i = 0; i < produtos.length; i++) {
      print("${produtos[i]} = ${valores[i]}");
    }
  }
 
  void finalizar() {
    print("Digite a forma de pagamento: D para dinheiro e C para cartão");
    String p = stdin.readLineSync()!;
    double total = 0;
    for (int i = 0; i < valores.length; i++) {
      total = total + valores[i];
    }
    if (p == "D") {
      total = total * 0.9;
    }
    print("Valor a pagar: $total");
  }
}
 
class Catalogo {
  List<Produto> lista = [
    Produto(101, "Ração Royal Canin Indoor Para Cães Adultos De Porte Mini 7,5kg", 290.00),
    Produto(102, "Ração Royal Canin Sterilised para Gatos Adultos Castrados", 492.00),
    Produto(103, "Bifinho Keldog para Cães Porte Pequeno Sabor Carne e Cereais", 23.92),
    Produto(104, "Fraldas Descartáveis Super Secão para Cães Machos 12 Unidades", 38.61),
    Produto(201, "Banho e tosa", 55.99),
    Produto(202, "Tosa higienica", 12.99),
    Produto(203, "Hidratação dos pelos", 20.99),
  ];
 
  void exibirPromocoes() {
    print("Código 101 - Ração Royal Canin Indoor Para Cães Adultos De Porte Mini De Ambientes Internos 7,5kg na promoção pelo preço de R 290,00.");
    print("Código 102 - Ração Royal Canin Sterilised para Gatos Adultos Castrados e com o valor promocional de R 492,00.");
    print("Código 103 - Bifinho Keldog para Cães Porte Pequeno Sabor Carne e Cereais por R 23,92.");
    print("Código 104 - Fraldas Descartáveis Super Secão para Cães Machos com 12 Unidades R 38,61.");
  }
 
  void exibirServicos() {
    print("Código 201 - Banho e tosa - R 55,99.");
    print("Código 202 - Tosa higienica - R 12,99.");
    print("Código 203 - Hidratação dos pelos - R 20,99.");
  }
 
  Produto buscarPorCodigo(int codigo) {
    for (int i = 0; i < lista.length; i++) {
      if (lista[i].codigo == codigo) {
        return lista[i];
      }
    }
    return Produto(0, "", 0);
  }
}
 
class Cliente {
  String nome;
  Carrinho carrinho = Carrinho();
 
  Cliente(this.nome);
 
  void saudacao() {
    print("Prezado $nome. Seja muito bem vindo(a) a nossa loja");
  }
}
 
class AdminPainel {
  void processarVenda() {
    print("Digite o nome do cliente");
    String nomeCliente = stdin.readLineSync()!;
    print("Digite o valor da compra: ");
    double valorCompra = double.parse(stdin.readLineSync()!);
    print("Digite a forma de pagamento: D para dinheiro e C para cartão");
    String p = stdin.readLineSync()!;
    double total;
    if (p == "D") {
      total = valorCompra * 0.9;
    } else {
      total = valorCompra;
    }
    print("Cliente: $nomeCliente");
    print("Valor a ser pago: $total");
  }
}
 
class Sistema {
  Catalogo catalogo = Catalogo();
  int totalClientes = 0;
 
  void menu() {
    print("1 - Ver promoções \n2 - Solicitar serviço \n3 - Listar carrinho de compra. \n4 - Finalizar carrinho de compra. \n8 - Adicionar ao carrinho \n0 - Sair");
    print("Escolha a opção: ");
  }
 
  void iniciar() {
    int op = 1;
    for (int i = 0; op != 0; i++) {
      print("Digite o seu nome: ");
      String nome = stdin.readLineSync()!;
 
      if (nome == "cuidapetrestrito") {
        AdminPainel admin = AdminPainel();
        admin.processarVenda();
        continue;
      }
 
      Cliente cliente = Cliente(nome);
      cliente.saudacao();
      totalClientes++;
 
      op = 1;
      while (op != 0) {
        menu();
        op = int.parse(stdin.readLineSync()!);
        processarOpcao(op, cliente);
      }
      print("Total de clientes: $totalClientes");
    }
  }
 
  void processarOpcao(int op, Cliente cliente) {
    switch (op) {
      case 1:
        catalogo.exibirPromocoes();
        break;
      case 2:
        catalogo.exibirServicos();
        break;
      case 3:
        cliente.carrinho.listar();
        break;
      case 4:
        cliente.carrinho.finalizar();
        break;
      case 8:
        if (cliente.carrinho.estaCheio) {
          print("O seu carrinho já atingiu o limite de produtos.");
        } else {
          print("Digite o código: ");
          int codigo = int.parse(stdin.readLineSync()!);
          Produto p = catalogo.buscarPorCodigo(codigo);
          if (p.codigo == 0) {
            print("Opção inválida");
          } else {
            cliente.carrinho.adicionar(p.nome, p.preco);
          }
        }
        break;
      default:
        print("Opção inválida");
    }
  }
}
 
void main() {
  Sistema sistema = Sistema();
  sistema.iniciar();
}