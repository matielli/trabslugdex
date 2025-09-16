// lib/pages/search_page.dart
import 'package:flutter/material.dart';
import '../models/slug_model.dart';
import '../services/api_service.dart';
import '../widgets/theme_appbar.dart';
import '../widgets/search_bar.dart';
import '../widgets/slug_card.dart';
import 'detail_page.dart';
import '../utils/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ApiService _apiService = ApiService();
  List<Slug> _allSlugs = [];
  List<Slug> _filteredSlugs = [];
  String _searchQuery = '';
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadSlugs();
  }

  Future<void> _loadSlugs() async {
    try {
      final slugs = await _apiService.getSlugs();
      setState(() {
        _allSlugs = slugs;
        _filteredSlugs = slugs;
        _isLoading = false;
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Erro ao carregar dados: ${e.toString()}';
      });
      print('Erro ao carregar slugs: $e');
    }
  }

  void _searchSlugs(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredSlugs = _allSlugs;
      } else {
        _filteredSlugs = _allSlugs.where((slug) => 
          slug.name.toLowerCase().contains(query.toLowerCase()) ||
          slug.element.toLowerCase().contains(query.toLowerCase()) ||
          slug.abilities.toLowerCase().contains(query.toLowerCase())
        ).toList();
      }
    });
  }

  void _navigateToDetail(Slug slug) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(slug: slug),
      ),
    );
  }

  void _retryLoading() {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    _loadSlugs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: ThemeAppBar(
        title: 'Buscar Slugs',
        showBackButton: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimensions.defaultPadding),
            child: CustomSearchBar(
              onSearchChanged: _searchSlugs,
              onSearchSubmitted: () {},
            ),
          ),
          Expanded(
            child: _isLoading
                ? _buildLoadingWidget()
                : _errorMessage.isNotEmpty
                    ? _buildErrorWidget()
                    : _buildSlugsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentOrange),
          ),
          const SizedBox(height: 16),
          Text(
            'Carregando slugs...',
            style: TextStyles.bodyText,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.accentOrange,
          ),
          const SizedBox(height: 16),
          Text(
            _errorMessage,
            textAlign: TextAlign.center,
            style: TextStyles.bodyText,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _retryLoading,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
            ),
            child: const Text('Tentar Novamente'),
          ),
        ],
      ),
    );
  }

  Widget _buildSlugsList() {
    if (_filteredSlugs.isEmpty) {
      return Center(
        child: Text(
          _searchQuery.isEmpty
              ? 'Nenhum slug disponível'
              : 'Nenhum slug encontrado para "$_searchQuery"',
          style: TextStyles.bodyText,
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.defaultPadding
      ),
      itemCount: _filteredSlugs.length,
      itemBuilder: (context, index) {
        final slug = _filteredSlugs[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SlugCard(
            slug: slug,
            onTap: () => _navigateToDetail(slug),
          ),
        );
      },
    );
  }
}