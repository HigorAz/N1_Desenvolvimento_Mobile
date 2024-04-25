import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true, // Estende a imagem de fundo para a barra de aplicativos
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fundo_login.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Alinha o conteúdo no topo da tela
                children: [
                  // Logotipo
                  Image.asset(
                    'assets/images/logo_rekpay.png',
                    width: screenWidth * 0.3,
                  ),
                  SizedBox(height: screenHeight * 0.01),

                  // Subtítulo
                  Text(
                    'Rápido, prático e fácil',
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      color: Color(0xFF5CE1E6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.015),

                  // Botões
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.orangeAccent, // Cor do texto
                              minimumSize: Size(screenWidth * 0.43, screenHeight * 0.17), // Tamanho mínimo do botão
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Altere o valor conforme necessário
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/estacionamento.png',
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  'Estacionamento',
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.purple, // Cor do texto
                              minimumSize: Size(screenWidth * 0.43, screenHeight * 0.17), // Tamanho mínimo do botão
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Altere o valor conforme necessário
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icons/pedagio.png',
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  'Pedágio',
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pinkAccent, // Cor do texto
                      minimumSize: Size(screenWidth * 1, screenHeight * 0.07), // Tamanho mínimo do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Ajuste o valor conforme necessário
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/ipva.png',
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(width: screenWidth * 0.1),
                        Expanded(
                          child: Text(
                            'IPVA & Multas',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.25),

                  // Botão ENTRAR
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login2');
                      },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF5CE1E6), // Cor do texto
                      minimumSize: Size(screenWidth * 1, screenHeight * 0.07), // Tamanho mínimo do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Bordas não arredondadas
                      ),
                    ),
                    child: Text('ENTRAR',
                      style: TextStyle(fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.01),

                  // Botão CADASTRAR
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent, // Cor do texto
                      minimumSize: Size(screenWidth * 1, screenHeight * 0.07), // Tamanho mínimo do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Bordas não arredondadas
                      ),
                    ),
                    child: Text('CADASTRAR',
                      style: TextStyle(fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.010),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.help_outline_outlined),
                      color: Colors.white,
                    ),
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