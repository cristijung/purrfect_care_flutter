import 'package:flutter/material.dart';
import '../models/pet_model.dart';

class PurrfectHomeViewModel {
  // o ValueNotifier encapsula o estado da nossa lista de pets
  final ValueNotifier<List<Pet>> petsNotifier = ValueNotifier<List<Pet>>([]);

  // inicializa com os dados (simulando uma busca de repositório/banco)
  void carregarPets() {
    petsNotifier.value = [
      const Pet(id: '1', nome: 'Seth', especie: 'Gato', alimentado: true, aguaOk: true),
      const Pet(id: '2', nome: 'Grogu', especie: 'Gato', alimentado: false, aguaOk: true),
      const Pet(id: '3', nome: 'Mina', especie: 'Gato', alimentado: true, aguaOk: false),
      const Pet(id: '4', nome: 'Kirara', especie: 'Gato', alimentado: false, aguaOk: false),
    ];
  }

  // regra de negócio --> alternar o status de alimentação
  void alternarAlimentacao(String id) {
    petsNotifier.value = [
      for (final pet in petsNotifier.value)
        if (pet.id == id) pet.copyWith(alimentado: !pet.alimentado) else pet
    ];
  }

  // regra de negócio --> alternar o status da água
  void alternarAgua(String id) {
    petsNotifier.value = [
      for (final pet in petsNotifier.value)
        if (pet.id == id) pet.copyWith(aguaOk: !pet.aguaOk) else pet
    ];
  }
}