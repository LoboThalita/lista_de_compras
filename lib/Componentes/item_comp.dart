import 'package:flutter/material.dart';
import 'package:lista_de_compras/Entidades/Item.dart';

class ItemComp extends StatelessWidget {
  final Item item;
  final String nomeLista;
  final Function(Item) onChecked;
  final Function(Item) onEdit;
  final Function(Item) onDelete;

  const ItemComp({
    Key? key,
    required this.item,
    required this.nomeLista,
    required this.onChecked,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          Checkbox(
            value: item.comprado,
            onChanged: (value) => onChecked(item),
          ),
          Expanded(
            child: ListTile(
              title: Text(item.nome),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quantidade: ${item.quantidade} ${item.unidadeDeMedida}'),
                  Text('Categoria: ${item.categoria}'),
                  if(item.notasAdicionais !=  null) Text('Notas Adicionais:  ${item.notasAdicionais}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => onEdit(item),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Color.fromARGB(255, 191, 21, 21)),
                    onPressed: () => onDelete(item),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}