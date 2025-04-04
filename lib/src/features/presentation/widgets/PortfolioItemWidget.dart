import 'package:flutter/material.dart';

import '../../data/models/Asset/AssetModel.dart';

class PortfolioItem extends StatelessWidget {
  final AssetModel asset;

  const PortfolioItem({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor:
                asset.symbol == 'BTC' ? Colors.orange : asset.symbol == 'ETH' ? Colors.purple : Colors.blue,
            child: Icon(
              asset.symbol == 'BTC'
                  ? Icons.currency_bitcoin
                  : asset.symbol == 'ETH'
                      ? Icons.currency_bitcoin // Replace with a valid icon or use a package for Ethereum icon
                      : Icons.attach_money,
              color: Colors.white,
              
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '${asset.amount}',
            style: const TextStyle(
              
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Text(
              '${asset.price}',
              style: const TextStyle(
                
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 80,
            alignment: Alignment.center,
            child: Text(
              '${asset.value}',
              style: const TextStyle(
               
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Icon(
                  asset.change1h > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                  color: asset.change1h > 0 ? Colors.green : Colors.red,
                 
                ),
                Text(
                  '${asset.change1h.abs()}%',
                  style: TextStyle(
                    color: asset.change1h > 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Icon(
                  asset.change24h > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                  color: asset.change24h > 0 ? Colors.green : Colors.red,
                 
                ),
                Text(
                  '${asset.change24h.abs()}%',
                  style: TextStyle(
                    color: asset.change24h > 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 2.5),
          IconButton(
            icon: const Icon(
              Icons.lock,
             size: 16,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}