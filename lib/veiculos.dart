import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'adicionarVeiculo.dart';
import 'editarVeiculo.dart';

class VeiculosPage extends StatefulWidget {
  const VeiculosPage({Key? key}) : super(key: key);

  @override
  State<VeiculosPage> createState() => _VeiculosPageState();
}

class _VeiculosPageState extends State<VeiculosPage> {
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _apelidoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildTopBar(context),
      body: Column(
        children: [
          Expanded(
            child: _buildVeiculosList(context),
          ),
          _buildAddVeiculoButton(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildTopBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFfbae16),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.close_rounded),
        color: Colors.white,
      ),
      title: const Text(
        'Meus Veículos',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }

  Widget _buildVeiculosList(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('veiculos').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

            final apelido = data['apelido'] ?? 'Apelido não definido';
            final placa = data['placa'] ?? 'Placa não definida';

            return ListTile(
              leading: const Icon(Icons.directions_car, color: Colors.grey),
              title: Text(apelido),
              subtitle: Text(placa),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditarVeiculoPage(document: document),
                    ),
                  );
                },
                icon: const Icon(Icons.edit, color: Colors.amber),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildAddVeiculoButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        gradient: const LinearGradient(
          colors: [Color(0xFFfbae16), Color(0xFFF7D024)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarVeiculoPage()),
          );
        },
        child: const Text(
          'ADICIONAR VEÍCULO',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }
}
