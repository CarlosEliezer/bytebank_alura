import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Nova Transferência';

const _rotuloDescricao = 'Descrição';
const _dicaDescricao = 'Contra Baixo';

const _rotuloValor = 'Valor';
const _dicaValor = '000.00';

const _mensagemDeSucesso = 'Transferência Adicionada!';
const _mensagemDeFalha = 'Erro! Verifique os dados.';

const _textoBotao = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoDescricao = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(_controladorCampoDescricao, _rotuloDescricao, _dicaDescricao),
            Editor(_controladorCampoValor, _rotuloValor, _dicaValor, icone: Icons.monetization_on), //Se a variável é privada só precisa colocar o campo
            //->                                                                             //deve estar na ordem do Constructor. Se a variável é
            //->                                                                             //pública (por exemplo o icone) precisa definir qual
            //->                                                                             //variável do Constructor você está mexendo, nesse
            //->                                                                             //caso pode ser feito em qualquer ordem.
            ElevatedButton(
                child: Text(_textoBotao),
                onPressed: () { //Pode ser escrito com ArrowFunction: onPressed: () => _criaTransferencia(context)
                  _criaTransferencia(context);
                }
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final String descricao = _controladorCampoDescricao.text;
    final double valor = double.tryParse(_controladorCampoValor.text);

    _verificaDados(descricao, valor, context);
  }

  void _verificaDados(String descricao, double valor, BuildContext context) {
    if (descricao != null && valor != null) {
      final transferenciaCriada = Transferencia(descricao, valor);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(_mensagemDeSucesso),
          duration: const Duration(milliseconds: 1000),
          width: 300.0, // Width of the SnackBar.
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0, // Inner padding for SnackBar content.
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );

      Navigator.pop(context, transferenciaCriada);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(_mensagemDeFalha),
          duration: const Duration(milliseconds: 1000),
          width: 300.0, // Width of the SnackBar.
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0, // Inner padding for SnackBar content.
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
    }
  }
}