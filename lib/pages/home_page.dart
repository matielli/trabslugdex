import 'package:flutter/material.dart';
import '../widgets/theme_appbar.dart';
import '../utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: ThemeAppBar(
        title: AppStrings.appName,
        showBackButton: false,
      ),
      body: Center( // ✅ ADICIONE ESTE WIDGET Center
        child: SingleChildScrollView( // ✅ PARA GARANTIR RESPONSIVIDADE
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // ✅ CENTRALIZA VERTICALMENTE
              crossAxisAlignment: CrossAxisAlignment.center, // ✅ CENTRALIZA HORIZONTALMENTE
              children: [
                // Logo
                
                
                // Título
                Text(
                  AppStrings.welcomeTitle,
                  style: TextStyles.appTitle,
                  textAlign: TextAlign.center, // ✅ CENTRALIZA TEXTO
                ),
                const SizedBox(height: 20),
                
                // Mensagem de boas-vindas
                Text(
                  AppStrings.welcomeMessage,
                  style: TextStyles.bodyText,
                  textAlign: TextAlign.center, // ✅ CENTRALIZA TEXTO
                ),
                const SizedBox(height: 40),
                
                // Botão de iniciar busca
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32, 
                      vertical: AppDimensions.defaultPadding,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.buttonBorderRadius,
                      ),
                    ),
                    minimumSize: const Size(200, 50), // ✅ TAMANHO MÍNIMO DO BOTÃO
                  ),
                  child: Text(
                    AppStrings.startSearch,
                    style: TextStyles.buttonText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}