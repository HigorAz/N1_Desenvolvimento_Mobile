import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'veiculo.dart';

class AdicionarVeiculoPage extends StatelessWidget {
  AdicionarVeiculoPage({Key? key}) : super(key: key);

  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _apelidoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFfbae16),
        title: const Text(
          'Novo Veículo',
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
            _buildSalvarButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSalvarButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
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
          _cadastrarVeiculo(context);
        },
        child: const Text(
          'SALVAR',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }

  void _cadastrarVeiculo(BuildContext context) {
    final veiculo = Veiculo(
      _placaController.text,
      _apelidoController.text,
    );
    FirebaseFirestore.instance
        .collection('veiculos')
        .add(veiculo.toMap())
        .then((result) {
      print('Veículo cadastrado com sucesso!');
      Navigator.pop(context);
    }).catchError((error) {
      print('Erro ao cadastrar o veículo: $error');
    });
  }
}
