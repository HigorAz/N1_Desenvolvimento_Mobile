import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.pushNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        setState(() {
          _errorMessage = e.message!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: SafeArea(
        child: Stack(
          children: [
            _buildTopBar(size, context),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08,
                vertical: size.height * 0.1,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEstacionamento(size),
                    const SizedBox(height: 40),
                    _buildForm(size, theme),
                    const SizedBox(height: 48),
                    _buildCadastroButton(size, theme, context),
                    const SizedBox(height: 16),
                    if (_errorMessage.isNotEmpty)
                      Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(Size size, BuildContext context) {
    return Container(
      height: size.height * 0.065,
      width: size.width,
      color: const Color(0xFFfbae16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close_sharp, color: Colors.white),
          ),
          Text(
            'Cadastrar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline_outlined),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildEstacionamento(Size size) {
    return Container(
      alignment: Alignment.center,
      width: size.width,
      padding: EdgeInsets.symmetric(vertical: size.height * 0),
      child: Image.asset(
        'assets/icons/estacionamento_yellow.png',
        width: size.width * 0.12,
      ),
    );
  }

  Widget _buildForm(Size size, ThemeData theme) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: _buildEmailInput(theme),
          ),
          const Divider(color: Colors.grey),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: _buildPasswordInput(theme),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailInput(ThemeData theme) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'E-mail',
        labelStyle: theme.textTheme.bodyMedium!.copyWith(
          color: Colors.grey,
          fontSize: 15,
        ),
        border: InputBorder.none,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira um e-mail';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordInput(ThemeData theme) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Senha',
        labelStyle: theme.textTheme.bodyMedium!.copyWith(
          color: Colors.grey,
          fontSize: 15,
        ),
        border: InputBorder.none,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira uma senha';
        }
        return null;
      },
    );
  }

  Widget _buildCadastroButton(Size size, ThemeData theme, BuildContext context) {
    return SizedBox(
      width: size.width,
      child: ElevatedButton(
        onPressed: _register,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFfbae16),
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: theme.textTheme.labelLarge!.copyWith(
            color: Colors.white,
            fontSize: 18,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 15),
            Icon(Icons.vpn_key_outlined, color: Colors.white),
            SizedBox(width: 30),
            Text(
              'CADASTRAR',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
