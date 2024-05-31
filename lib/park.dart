import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ParkPage extends StatefulWidget {
  const ParkPage({Key? key}) : super(key: key);

  @override
  _ParkPageState createState() => _ParkPageState();
}

class _ParkPageState extends State<ParkPage> {
  String selectedCity = 'Cidade';
  String selectedVehicle = 'ONIX';
  String selectedVehicleType = 'Carro';
  int selectedTime = 30;
  String? parkingSpot;

  final List<String> cities = ['Jaraguá do Sul', 'Blumenau', 'Uruguaiana'];
  final List<String> vehiclesModels = ['ONIX', 'MAREA', 'FIAT UNO'];

  void onCitySelected(String city) {
    setState(() {
      selectedCity = city;
    });
  }

  void onVehicleTypeSelected(String type) {
    setState(() {
      selectedVehicleType = type;
    });
  }

  void onVehicleSelected(String vehicle) {
    setState(() {
      selectedVehicle = vehicle;
    });
  }

  void onTimeSelected(int time) {
    setState(() {
      selectedTime = time;
    });
  }

  void startParking() {
    if (selectedCity == 'Cidade') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione uma cidade')),
      );
      return;
    }
    if (selectedVehicleType == 'Carro' && selectedVehicle == 'ONIX' && parkingSpot == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite o número da vaga')),
      );
      return;
    }

    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Color(0xFFf3f3f3),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(size),
              SizedBox(height: size.height * 0.02),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSelectionSection(size, theme),
                        SizedBox(height: size.height * 0.01),
                        _buildOptionsSection(size, theme),
                        SizedBox(height: size.height * 0.02),
                        _buildActionButton(size, theme),
                        SizedBox(height: size.height * 0.18),
                        _buildMenu(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(Size size) {
    return Container(
      width: size.width,
      color: const Color(0xFFfbae16),
      padding: EdgeInsets.symmetric(vertical: size.height * 0.005, horizontal: size.width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          Text(
            'Estacionar',
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.04,
            ),
          ),
          SizedBox(width: 48.0),
        ],
      ),
    );
  }

  Widget _buildSelectionSection(Size size, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionLabel('Cidade:', size),
        _buildCityDropdown(size, theme),
        SizedBox(height: size.height * 0.01),
        _buildSectionLabel('Veículo:', size),
        _buildVehicleDropdown(size, theme),
        SizedBox(height: size.height * 0.01),
        _buildSectionLabel('Tipo de Veículo:', size),
        _buildVehicleTypeButtons(size, theme),
      ],
    );
  }

  Widget _buildSectionLabel(String text, Size size) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xFFfbae16),
        fontSize: size.width * 0.04,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildCityDropdown(Size size, ThemeData theme) {
    if (!cities.contains(selectedCity)) {
      selectedCity = cities.first;
    }

    return DropdownButtonFormField<String>(
      value: selectedCity,
      items: cities.map((city) => DropdownMenuItem<String>(
        value: city,
        child: Text(city),
      )).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          onCitySelected(newValue);
        }
      },
      decoration: _buildInputDecoration(),
      style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black),
    );
  }

  Widget _buildVehicleDropdown(Size size, ThemeData theme) {
    List<String> vehicleModels = selectedVehicleType == 'Carro' ? vehiclesModels : vehiclesModels;

    if (!vehicleModels.contains(selectedVehicle)) {
      selectedVehicle = vehicleModels.first;
    }

    return DropdownButtonFormField<String>(
      value: selectedVehicle,
      items: vehicleModels.map((model) => DropdownMenuItem<String>(
        value: model,
        child: Text(model),
      )).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          onVehicleSelected(newValue);
        }
      },
      decoration: _buildInputDecoration(),
      style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide.none,
      ),
      suffixIcon: const Icon(Icons.map_outlined, color: Color(0xFFfbae16)),
    );
  }

  Widget _buildVehicleTypeButtons(Size size, ThemeData theme) {
    return Row(
      children: [
        _buildVehicleTypeButton('Carro', Icons.directions_car, size),
        SizedBox(width: size.width * 0.005),
        _buildVehicleTypeButton('Moto', Icons.motorcycle, size),
      ],
    );
  }

  Widget _buildVehicleTypeButton(String type, IconData icon, Size size) {
    bool isSelected = selectedVehicleType == type;

    return Expanded(
      child: ElevatedButton(
        onPressed: () => onVehicleTypeSelected(type),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFFfbae16) : Color(0xff8b8b8b),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 35),
            Text(
              type.toUpperCase(),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionsSection(Size size, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionLabel('Tempo (em minutos):', size),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTimeButton(size, theme, 30, 'R\$2,00'),
            _buildTimeButton(size, theme, 60, 'R\$2,50'),
            _buildTimeButton(size, theme, 90, 'R\$3,00'),
            _buildTimeButton(size, theme, 120, 'R\$3,50'),
          ],
        ),
        SizedBox(height: size.height * 0.02),
        _buildParkingSpotInput(size, theme),
      ],
    );
  }

  Widget _buildTimeButton(Size size, ThemeData theme, int time, String price) {
    bool isSelected = selectedTime == time;

    return ElevatedButton(
      onPressed: () => onTimeSelected(time),
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black,
        backgroundColor: isSelected ? const Color(0xFFfbae16) : Color(0xff8b8b8b),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: Column(
        children: [
          Text(
            '$time',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.045,
            ),
          ),
          SizedBox(height: size.height * 0.0),
          Text(
            price,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.03,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParkingSpotInput(Size size, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionLabel('Vaga (opcional):', size),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: 'Digite o número da vaga',
          ),
          onChanged: (value) => parkingSpot = value,
        ),
      ],
    );
  }

  Widget _buildActionButton(Size size, ThemeData theme) {
    return Container(
      width: size.width,
      height: size.height * 0.055,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: const LinearGradient(
          colors: [Color(0xFFfbae16), Color(0xFFF7D024)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: TextButton(
        onPressed: startParking,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 18),
        ),
        child: const Text('INICIAR'),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    final iconSize = MediaQuery.of(context).size.width * 0.09;

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
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
          SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(fontSize: iconSize * 0.4),
          ),
        ],
      ),
    );
  }
}
