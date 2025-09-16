// lib/utils/constants.dart

import 'package:flutter/material.dart';

// Cores do tema Slugterra
class AppColors {
  static const Color primaryBlue = Color(0xFF0066CC);
  static const Color accentOrange = Color(0xFFFF6600);
  static const Color darkBackground = Color(0xFF111111);
  static const Color cardBackground = Color(0xFF1E1E1E);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textGrey = Color(0xFFBBBBBB);
  
  // Cores dos elementos
  static const Color fireElement = Color(0xFFFF3D00);
  static const Color waterElement = Color(0xFF00B0FF);
  static const Color earthElement = Color(0xFF8BC34A);
  static const Color energyElement = Color(0xFFFFEA00);
  static const Color airElement = Color(0xFF80DEEA);
  static const Color iceElement = Color(0xFF80DEEA);
}

// Estilos de texto
class TextStyles {
  static const TextStyle appTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.accentOrange,
    fontFamily: 'Orbitron',
  );
  
  static const TextStyle pageTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.accentOrange,
    fontFamily: 'Orbitron',
  );
  
  static const TextStyle slugName = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.accentOrange,
    fontFamily: 'Orbitron',
  );
  
  static const TextStyle slugDetailTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.accentOrange,
    fontFamily: 'Orbitron',
  );
  
  static const TextStyle slugDetailContent = TextStyle(
    fontSize: 16,
    color: AppColors.textGrey,
  );
  
  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.textWhite,
  );
  
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
    fontFamily: 'Orbitron',
  );
}

// Strings da aplicação
class AppStrings {
  static const String appName = 'Slugterra Slugdex';
  static const String welcomeTitle = 'Bem-vindo à Slugdex!';
  static const String welcomeMessage = 
      'Este dispositivo cataloga todos os slugs das cavernas de Slugterra. '
      'Use a busca para encontrar informações sobre qualquer slug.';
  static const String startSearch = 'Iniciar Busca';
  static const String searchHint = 'Digite o nome de um slug...';
  static const String noSlugsFound = 'Nenhum slug encontrado';
  static const String elementLabel = 'Elemento';
  static const String shotTypeLabel = 'Tipo de Tiro';
  static const String abilitiesLabel = 'Habilidades';
  static const String speedLabel = 'Velocidade';
  static const String strengthLabel = 'Força';
  static const String strategyLabel = 'Estratégia';
  static const String triviaLabel = 'Curiosidade';
  static const String errorLoading = 'Erro ao carregar slugs';
  static const String searchError = 'Falha na busca';
}

// Configurações da API
// lib/utils/constants.dart
// Atualize a configuração da API para refletir que é local
class ApiConfig {
  static const String baseUrl = 'local_data';
  static const String slugsEndpoint = '/slugs';
  static const int connectionTimeout = 5000;
  static const int receiveTimeout = 3000;

}

// Assets paths
class AssetPaths {
  static const String logo = 'assets/images/slugterra_logo.png';
  static const String placeholder = 'assets/images/placeholder_slug.png';
}

// Tamanhos e dimensões
// lib/utils/constants.dart - Adicione estas dimensões
class AppDimensions {
  static const double defaultPadding = 16.0;
  static const double cardBorderRadius = 12.0;
  static const double imageBorderRadius = 8.0;
  static const double buttonBorderRadius = 24.0;
  static const double appBarHeight = 64.0;
  
  // ✅ NOVAS DIMENSÕES PARA CENTRALIZAÇÃO
  static const double homeLogoSize = 150.0;
  static const double homeButtonWidth = 200.0;
  static const double homeButtonHeight = 50.0;
  static const double homeSpacingLarge = 40.0;
  static const double homeSpacingMedium = 20.0;

}

// Chaves para testes
class TestKeys {
  static const String searchField = 'search_field';
  static const String slugCard = 'slug_card';
  static const String slugImage = 'slug_image';
  static const String slugName = 'slug_name';
}