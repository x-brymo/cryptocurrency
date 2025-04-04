import 'package:cryptocurrency/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/blocs/Portfolio/index.dart';
import 'PortfolioItemWidget.dart';

class PortfolioCardWidget extends StatelessWidget {
  const PortfolioCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        if (state is PortfolioLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PortfolioError) {
          return const Center(child: Text('Failed to load portfolio data'));
        }

        if (state is PortfolioLoaded) {
          return Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: context.screenWidth * 0.470,
              height: context.screenHeight * 0.40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Portfolio',
                        style: TextStyle(
                          
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.assets.length,
                      itemBuilder: (context, index) {
                        final asset = state.assets[index];
                        return PortfolioItem(asset: asset);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Center(child: Text('Failed to load portfolio data'));
      },
    );
  }
}