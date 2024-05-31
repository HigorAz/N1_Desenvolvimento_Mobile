import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login2Page extends StatelessWidget {
  const Login2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEstacionamento(size),
                    const SizedBox(height: 40),
                    _buildForm(size, theme),
                    const SizedBox(height: 48),
                    _buildLoginButton(size, theme, context),
                    const SizedBox(height: 16),
                    _buildForgotPasswordButton(theme),
                    const SizedBox(height: 48),
                    _buildSocialLoginButtons(size, theme),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
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
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.close_sharp, color: Colors.white),
            ),
          ),
          Text(
            'Entrar',
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
      decoration: InputDecoration(
        labelText: 'E-mail / CPF / CNPJ',
        labelStyle: theme.textTheme.bodyMedium!.copyWith(
          color: Colors.grey,
          fontSize: 15,
        ),
        border: InputBorder.none,
      ),
    );
  }

  Widget _buildPasswordInput(ThemeData theme) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Senha',
        labelStyle: theme.textTheme.bodyMedium!.copyWith(
          color: Colors.grey,
          fontSize: 15,
        ),
        border: InputBorder.none,
      ),
    );
  }

  Widget _buildLoginButton(Size size, ThemeData theme, BuildContext context) {
    return SizedBox(
      width: size.width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
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
              'Entrar com Usuário e Senha',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton(ThemeData theme) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Esqueceu a sua senha?',
        style: TextStyle(
          color: const Color(0xFFfbae16),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSocialLoginButtons(Size size, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SizedBox(
              width: size.width * 0.8,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icons/apple_logo.png',
                  width: 25,
                  height: 25,
                ),
                label: const Text(
                  'Iniciar sessão com a Apple',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: SizedBox(
              width: size.width * 0.8,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icons/facebook_logo.png',
                  width: 25,
                  height: 25,
                ),
                label: const Text(
                  'Iniciar sessão com o Facebook',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF475a96),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.8,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/google_logo.png',
                width: 25,
                height: 25,
              ),
              label: const Text(
                'Iniciar sessão com a Google',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: theme.textTheme.labelLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
