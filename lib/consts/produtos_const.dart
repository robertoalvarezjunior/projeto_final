import 'package:flutter/material.dart';

List<Map<String, dynamic>> bolo = [
  {
    "id": 1,
    "nome": "Bolo de Chocolate",
    "preco": 15.0,
    "descricao": "Delicioso bolo de chocolate",
    "imagem": "assets/images/bolo.png",
    "tag": "bolo"
  },
  {
    "id": 2,
    "nome": "Bolo de Morango",
    "preco": 12.0,
    "descricao": "Bolo saboroso com cobertura de morango",
    "imagem": "assets/images/bolo.png",
    "tag": "bolo"
  },
  {
    "id": 3,
    "nome": "Bolo de Cenoura",
    "preco": 10.0,
    "descricao": "Bolo caseiro de cenoura com cobertura de chocolate",
    "imagem": "assets/images/bolo.png",
    "tag": "bolo"
  },
  {
    "id": 4,
    "nome": "Bolo de Limão",
    "preco": 13.0,
    "descricao": "Bolo refrescante com sabor de limão",
    "imagem": "assets/images/bolo.png",
    "tag": "bolo"
  },
  {
    "id": 5,
    "nome": "Bolo de Coco",
    "preco": 11.0,
    "descricao": "Bolo macio e úmido com coco ralado",
    "imagem": "assets/images/bolo.png",
    "tag": "bolo"
  },
  {
    "id": 6,
    "nome": "Bolo Red Velvet",
    "preco": 14.0,
    "descricao": "Bolo vermelho aveludado com cream cheese",
    "imagem": "assets/images/bolo.png",
    "tag": "bolo"
  },
  {
    "id": 7,
    "nome": "Bolo de Nozes",
    "preco": 13.0,
    "descricao": "Bolo com pedaços de nozes e cobertura de caramelo",
    "imagem": "assets/images/bolo.png",
    "tag": "bolo"
  }
];

List<Map<String, dynamic>> cafe = [
  {
    "id": 1,
    "nome": "Café Expresso",
    "preco": 5.0,
    "descricao": "Café expresso de alta qualidade",
    "imagem": "assets/images/cafe.png",
    "tag": "cafe"
  },
  {
    "id": 2,
    "nome": "Café com Leite",
    "preco": 6.0,
    "descricao": "Café com leite cremoso",
    "imagem": "assets/images/cafe.png",
    "tag": "cafe"
  },
  {
    "id": 3,
    "nome": "Cappuccino",
    "preco": 7.0,
    "descricao": "Cappuccino italiano com espuma de leite",
    "imagem": "assets/images/cafe.png",
    "tag": "cafe"
  },
  {
    "id": 4,
    "nome": "Mocha",
    "preco": 8.0,
    "descricao": "Café com chocolate e chantilly",
    "imagem": "assets/images/cafe.png",
    "tag": "cafe"
  },
  {
    "id": 5,
    "nome": "Café Americano",
    "preco": 4.0,
    "descricao": "Café tradicional americano",
    "imagem": "assets/images/cafe.png",
    "tag": "cafe"
  },
  {
    "id": 6,
    "nome": "Café Gelado",
    "preco": 7.5,
    "descricao": "Café gelado com cubos de gelo",
    "imagem": "assets/images/cafe.png",
    "tag": "cafe"
  },
  {
    "id": 7,
    "nome": "Frappuccino",
    "preco": 9.0,
    "descricao": "Café gelado com chantilly e calda de caramelo",
    "imagem": "assets/images/cafe.png",
    "tag": "cafe"
  }
];

List<Map<String, dynamic>> cha = [
  {
    "id": 1,
    "nome": "Chá de Camomila",
    "preco": 3.0,
    "descricao": "Chá de camomila relaxante",
    "imagem": "assets/images/cha.png",
    "tag": "cha"
  },
  {
    "id": 2,
    "nome": "Chá Verde",
    "preco": 4.0,
    "descricao": "Chá verde antioxidante",
    "imagem": "assets/images/cha.png",
    "tag": "cha"
  },
  {
    "id": 3,
    "nome": "Chá de Frutas Vermelhas",
    "preco": 4.5,
    "descricao": "Chá de frutas vermelhas refrescante",
    "imagem": "assets/images/cha.png",
    "tag": "cha"
  },
  {
    "id": 4,
    "nome": "Chá de Hortelã",
    "preco": 3.5,
    "descricao": "Chá de hortelã revigorante",
    "imagem": "assets/images/cha.png",
    "tag": "cha"
  },
  {
    "id": 5,
    "nome": "Chá de Erva Cidreira",
    "preco": 3.0,
    "descricao": "Chá de erva cidreira calmante",
    "imagem": "assets/images/cha.png",
    "tag": "cha"
  },
  {
    "id": 6,
    "nome": "Chá de Jasmim",
    "preco": 4.5,
    "descricao": "Chá de jasmim aromático",
    "imagem": "assets/images/cha.png",
    "tag": "cha"
  },
  {
    "id": 7,
    "nome": "Chá de Gengibre",
    "preco": 3.5,
    "descricao": "Chá de gengibre revigorante",
    "imagem": "assets/images/cha.png",
    "tag": "cha"
  }
];

ColorScheme colorTheme(BuildContext context) {
  return Theme.of(context).colorScheme;
}
