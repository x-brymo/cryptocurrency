import 'package:cryptocurrency/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/blocs/sliderbar/index.dart';

class SliderBarWidget extends StatelessWidget {
  const SliderBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: context.screenHeight * 0.9,
      decoration: BoxDecoration(
        // color: Colors.white,
        // borderRadius: BorderRadius.circular(35),
        // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 38.0),
            child: GestureDetector(
              //onTap: () => context.read<SidebarBloc>().changeScreen(0), 
              onTap: () {
               showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Add New Item"),
                    content: const Text("This is a placeholder for adding new items."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Close"),
                      ),
                    ],
                  ),
                );
                print("Add button tapped!");
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent,
                      blurRadius: 15.2,
                      offset: const Offset(5, 5),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 30),
              ),
            ),
          ),
          SidebarButton(icon: Icons.home, index: 0),
          SidebarButton(icon: Icons.grid_view, index: 1),
          SidebarButton(icon: Icons.people, index: 2),
          SidebarButton(icon: Icons.settings, index: 3),
        ],
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  final IconData icon;
  final int index;

  const SidebarButton({super.key, required this.icon, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SidebarBloc, SidebarState>(
      builder: (context, selectedIndex) {
        bool isSelected = selectedIndex == index;

        return Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 40),
          child: GestureDetector(
            onTap: () => context.read<SidebarBloc>().changeScreen(index),
            child: Icon(
              icon,
              color: selectedIndex == index ? Colors.blue : Colors.black,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
