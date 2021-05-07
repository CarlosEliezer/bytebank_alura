import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController _controlador; //Variável privada, não é opcional.
  final String _rotulo;
  final String _dica;
  final String tipo;
  final IconData icone; //Variável pública, pode ser deixada como opcional no Constructor colocando {} ao redor da variável.
  //As {} podem englobar mais de uma varável.

  Editor(this._controlador, this._rotulo, this._dica, {this.icone, this.tipo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 7.5, 15, 5),
      child: TextField(
          controller: _controlador,

          decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: _rotulo,
            hintText: _dica,
          ),

          style: TextStyle(
            fontSize: 22.5,
          )
      ),
    );
  }
}