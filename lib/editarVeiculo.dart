import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditarVeiculoPage extends StatelessWidget {
  final DocumentSnapshot document;

  const EditarVeiculoPage({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFfbae16),
        title: const Text(
          'Alterar Veículo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
          color: Colors.white,
        ),
      ),
      body: EditarVeiculoForm(document: document),
    );
  }
}

class EditarVeiculoForm extends StatefulWidget {
  final DocumentSnapshot document;

  const EditarVeiculoForm({Key? key, required this.document}) : super(key: key);

  @override
  _EditarVeiculoFormState createState() => _EditarVeiculoFormState();
}

class _EditarVeiculoFormState extends State<EditarVeiculoForm> {
  late TextEditingController _placaController;
  late TextEditingController _apelidoController;

  @override
  void initState() {
    super.initState();
    _placaController = TextEditingController(text: widget.document['placa']);
    _apelidoController = TextEditingController(text: widget.document['apelido']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Placa:',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: _placaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apelido:',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '(opcional - para facilitar a identificação do veículo)',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: _apelidoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                _buildRemoverButton(context),
                const SizedBox(width: 10.0),
                Expanded(child: _buildSalvarButton(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemoverButton(BuildContext context) {
    return Container(
      width: 175.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: Colors.red,
      ),
      child: TextButton(
        onPressed: () {
          _deletarVeiculo(context);
        },
        child: const Text(
          'REMOVER',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }

  Widget _buildSalvarButton(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        gradient: const LinearGradient(
          colors: [Color(0xFFfbae16), Color(0xFFfbae16)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: TextButton(
        onPressed: () {
          _editarVeiculo(context);
        },
        child: const Text(
          'SALVAR',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }

  void _editarVeiculo(BuildContext context) {
    final Map<String, dynamic> newData = {
      'placa': _placaController.text,
      'apelido': _apelidoController.text,
    };

    FirebaseFirestore.instance
        .collection('veiculos')
        .doc(widget.document.id)
        .update(newData)
        .then((value) {
      print('Veículo atualizado com sucesso!');
      Navigator.pop(context);
    }).catchError((error) {
      print('Erro ao atualizar o veículo: $error');
    });
  }

  void _deletarVeiculo(BuildContext context) {
    FirebaseFirestore.instance
        .collection('veiculos')
        .doc(widget.document.id)
        .delete()
        .then((value) {
      print('Veículo removido com sucesso!');
      Navigator.pop(context);
    }).catchError((error) {
      print('Erro ao remover o veículo: $error');
    });
  }

  @override
  void dispose() {
    _placaController.dispose();
    _apelidoController.dispose();
    super.dispose();
  }
}
