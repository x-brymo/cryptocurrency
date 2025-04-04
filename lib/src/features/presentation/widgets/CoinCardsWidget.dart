import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/blocs/Market/index.dart';
import 'CryptoCardWidget.dart';

class CoinCardsWidget extends StatelessWidget {
  final AnimationController animationController;
  const CoinCardsWidget({
    super.key,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<MarketBloc, MarketState>(
      builder: (context, state) {
        if (state is MarketLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MarketError) {
          return const Center(child: Text('Failed to load market data'));
        }
        if (state is MarketLoaded) {
          return SizedBox(
            height: 70,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.cryptoData.length,
                  itemBuilder: (context, index) {
                    final coin = state.cryptoData[index];
                    final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController,
                        curve: Interval(
                          index * 0.2,
                          index * 0.2 + 0.6,
                          curve: Curves.easeOut,
                        ),
                      ),
                    );
                    
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.2, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: CryptoCardWidget(
                            coin: coin,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        }

        return const Center(child: Text('Failed to load market data'));
      },
    );
  }
}
