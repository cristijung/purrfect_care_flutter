import 'package:flutter/material.dart';
import '../../models/pet_model.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final VoidCallback onAlimentarPressed;
  final VoidCallback onAguaPressed;

  const PetCard({
    super.key,
    required this.pet,
    required this.onAlimentarPressed,
    required this.onAguaPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal.shade50,
                  child: Text(pet.especie == 'Gato' ? '🐱' : '🐶'),
                ),
                const SizedBox(width: 16),
                Text(
                  pet.nome,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.restaurant,
                    color: pet.alimentado ? Colors.green : Colors.grey,
                  ),
                  tooltip: pet.alimentado ? 'Alimentado' : 'Precisa de ração',
                  onPressed: onAlimentarPressed,
                ),
                IconButton(
                  icon: Icon(
                    Icons.water_drop,
                    color: pet.aguaOk ? Colors.blue : Colors.grey,
                  ),
                  tooltip: pet.aguaOk ? 'Água limpa' : 'Trocar água',
                  onPressed: onAguaPressed,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}