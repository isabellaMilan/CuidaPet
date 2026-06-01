import 'dart:io';

void main () { 
  List produtos = [];
  List <double> valor = [];
  int op = 1;
  for(int i = 0; op != 0; i++){
    print("Digite o seu nome: ");
    String nome = stdin.readLineSync()!;
    apresentacao(nome);
    menu();
    for(int i = 0; op != 0; i++){
    op = int.parse(stdin.readLineSync()!);
    opcao1(op, nome, produtos, valor);
    print("Total de clientes: $i");
  }
  }
}

void apresentacao(String nome) {
  print("Prezado $nome. Seja muito bem vindo(a) a nossa loja");
}

void menu() {
  print("1 - Ver promoções \n2 - Solicitar serviço \n3 - Listar carrinho de compra. \n4 - Finalizar carrinho de compra. \n8 - Adicionar ao carrinho \n0 - Sair");
  print("Escolha a opção: ");
}

void opcao1 (int a, String nome, List produtos, List <double> valor) {
  int id;
  String p;
  double total;
  if(nome == "cuidapetrestrito") {
    print("Digite o nome do cliente");
    nome = stdin.readLineSync()!;
    print("Digite o valor da compra: ");
    valor.add(double.parse(stdin.readLineSync()!));
    print("DIgite a forma de pagamento: D para dinheiro e C para cartão");
    p = stdin.readLineSync()!;
    if(p == "D"){
      total = valor[0] * 0.9;
    }
    else{
      total = valor[0];
    }
    print("Cliente: $nome");
    print("Valor a ser pago: $total"); 
  }
  switch(a){
    case 1:
      print("Código 101 - Ração Royal Canin Indoor Para Cães Adultos De Porte Mini De Ambientes Internos 7,5kg na promoção pelo preço de R 290,00.");
      print("Código 102 - Ração Royal Canin Sterilised para Gatos Adultos Castrados e com o valor promocional de R 492,00.");
      print("Código 103 - Bifinho Keldog para Cães Porte Pequeno Sabor Carne e Cereais por R 23,92.");
      print("Código 104 - Fraldas Descartáveis Super Secão para Cães Machos com 12 Unidades R 38,61.");
    break;
    case 2:
      print("Código 201 - Banho e tosa - R 55,99.");
      print("Código 202 - Tosa higienica -R 12,99.");
      print("Código 203 - Hidratação dos pelos - R 20,99.");     
      break;
    case 3:
      for(int i = 0; i < produtos.length; i++) {
        print("${produtos[i]} = ${valor[i]}");
      }
      break;
    case 4:
    print("DIgite a forma de pagamento: D para dinheiro e C para cartão");
    p = stdin.readLineSync()!;
    if(produtos.length == 3){
      if(p == "D"){
      double total = (valor[0] + valor[1] + valor[2]) * 0.9;
      print("Valor a pagar: $total");
    }
    else {
      double total = valor[0] + valor[1] + valor[2];
      print("Valor a pagar: $total");
    }
    } else if(produtos.length == 2){
      if(p == "D"){
      double total = (valor[0] + valor[1]) * 0.9;
      print("Valor a pagar: $total");
    }
    else {
      double total = valor[0] + valor[1];
      print("Valor a pagar: $total");
    }
    }else{
      if(p == "D"){
      double total = (valor[0]) * 0.9;
      print("Valor a pagar: $total");
    }
    else {
      double total = valor[0];
      print("Valor a pagar: $total");
    }
    }
    
      break;
    case 8:
          if(produtos.length >= 3){
            print("O seu carrinho já atingiu o limite de produtos. ");
          } else{
            print("Digite o código: ");
            id = int.parse(stdin.readLineSync()!);
            if (id == 101) {
              produtos.add("Ração Royal Canin Indoor Para Cães Adultos De Porte Mini De Ambientes Internos 7,5kg");
              valor.add(290);
            }
            else if(id == 102) {
              produtos.add("Ração Royal Canin Sterilised para Gatos Adultos Castrados");
              valor.add(492);
            }
            else if(id == 103) {
              produtos.add("Bifinho Keldog para Cães Porte Pequeno Sabor Carne e Cereais");
              valor.add(23.92);
            }
            else if(id == 104) {
              produtos.add("Fraldas Descartáveis Super Secão para Cães Machos com 12 Unidades");
              valor.add(38.61);
            }
            else if(id == 201) {
              produtos.add("Banho e tosa");
              valor.add(55.99);
            }
            else if(id == 202){
              produtos.add("Tosa higienica");
              valor.add(12.99);
            }
            else if(id == 203){
              produtos.add("Hidratação dos pelos");
              valor.add(20.99);
            }
            else {
              print("Opção inválida");
            }
          }
          break;
    default:
      print("Opção inválida");
  }
        
      }