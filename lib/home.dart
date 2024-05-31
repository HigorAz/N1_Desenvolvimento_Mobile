import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedVehicle = 'ONIX';
  String _selectedCity = 'Jaraguá do Sul';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fundo_home.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                _showVehicleDropdown();
                              },
                              child: _buildDropdownText(context, 'Veículo'),
                            ),
                          ),
                          const SizedBox(width: 120),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                _showCityDropdown();
                              },
                              child: _buildDropdownText(context, 'Cidade'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              _selectedVehicle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              _selectedCity,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildLogo(screenSize),
                        SizedBox(height: screenSize.height * 0.08),
                        _buildCredits(theme, screenSize),
                        SizedBox(height: screenSize.height * 0.02),
                        _buildAddCreditsButton(),
                        SizedBox(height: screenSize.height * 0.15),
                        _buildAdvertisement(),
                        SizedBox(height: screenSize.height * 0.04),
                        _buildMenu(context, screenSize),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showVehicleDropdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecionar Veículo'),
          content: DropdownButton<String>(
            value: _selectedVehicle,
            items: ['ONIX', 'MAREA', 'FIAT UNO'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedVehicle = newValue!;
                Navigator.of(context).pop();
              });
            },
          ),
        );
      },
    );
  }

  void _showCityDropdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecionar Cidade'),
          content: DropdownButton<String>(
            value: _selectedCity,
            items: ['Jaraguá do Sul', 'Blumenau', 'Uruguaiana'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedCity = newValue!;
                Navigator.of(context).pop();
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildDropdownText(BuildContext context, String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.arrow_drop_down, color: Color(0xFFfbae16), size: 30),
      ],
    );
  }

  Widget _buildLogo(Size screenSize) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 2,
            color: const Color(0xFFfbae16),
          ),
          SizedBox(height: screenSize.height * 0.04),
          Image.asset(
            'assets/images/logo_rekpay.png',
            width: 200,
          ),
        ],
      ),
    );
  }

  Widget _buildCredits(ThemeData theme, Size screenSize) {
    final credits = 9.50;
    final fontSizeMultiplier = screenSize.width * 0.01;
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: theme.textTheme.titleLarge!.copyWith(color: Colors.white),
          children: [
            TextSpan(
              text: 'Você tem ',
              style: TextStyle(fontSize: 4 * fontSizeMultiplier),
            ),
            TextSpan(
              text: 'R\$ ${credits.toStringAsFixed(2)}',
              style: TextStyle(color: Color(0xFFfbae16), fontSize: 7 * fontSizeMultiplier),
            ),
            TextSpan(
              text: ' em créditos',
              style: TextStyle(fontSize: 4 * fontSizeMultiplier),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddCreditsButton() {
    return GestureDetector(
      onTap: () {
        // Adicione a lógica aqui
      },
      child: const Padding(
        padding: EdgeInsets.all(3.0),
        child: Icon(Icons.add_circle, color: Color(0xFFfbae16), size: 30),
      ),
    );
  }

  Widget _buildAdvertisement() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/propaganda.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context, Size screenSize) {
    final iconSize = screenSize.width * 0.09;

    return Container(
      width: screenSize.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildMenuItem(context, Icons.home, 'Home', '/home', iconSize),
          _buildMenuItem(context, Icons.account_balance_wallet, 'Carteira', '/carteira', iconSize),
          _buildMenuItem(context, Icons.menu, 'Menu', '/login2', iconSize),
          _buildMenuItem(context, Icons.local_parking, 'Estacionar', '/park', iconSize),
          _buildMenuItem(context, Icons.toll, 'Veículos', '/veiculos', iconSize),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String text, String route, double iconSize) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.grey, size: iconSize),
          const SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(fontSize: iconSize * 0.4),
          ),
        ],
      ),
    );
  }
}
