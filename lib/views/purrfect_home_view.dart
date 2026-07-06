import 'package:flutter/material.dart';
import '../viewmodels/purrfect_home_viewmodel.dart';
import '../models/pet_model.dart';
import 'widgets/pet_card.dart';

class PurrfectHomeView extends StatefulWidget {
  const PurrfectHomeView({super.key});

  @override
  State<PurrfectHomeView> createState() => _PurrfectHomeViewState();
}

class _PurrfectHomeViewState extends State<PurrfectHomeView> {
  // a View instancia a sua respectiva ViewModel
  final PurrfectHomeViewModel _viewModel = PurrfectHomeViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.carregarPets(); // busca os dados ao iniciar a tela
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🐾 PurrfectCare (MVVM)'),
        backgroundColor: Colors.teal.shade200,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Status de Hoje:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
            ),
            Expanded(
              // reatividade pura: reconstrói apenas esta lista quando a ViewModel notificar mudanças
              child: ValueListenableBuilder<List<Pet>>(
                valueListenable: _viewModel.petsNotifier,
                builder: (context, listaDePets, child) {
                  if (listaDePets.isEmpty) {
                    return const Center(child: Text('Nenhum pet cadastrado.'));
                  }

                  return ListView.builder(
                    itemCount: listaDePets.length,
                    itemBuilder: (context, index) {
                      final pet = listaDePets[index];
                      return PetCard(
                        pet: pet,
                        onAlimentarPressed: () => _viewModel.alternarAlimentacao(pet.id),
                        onAguaPressed: () => _viewModel.alternarAgua(pet.id),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}