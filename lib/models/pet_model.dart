class Pet {
  final String id;
  final String nome;
  final String especie;
  final bool alimentado;
  final bool aguaOk;

  const Pet({
    required this.id,
    required this.nome,
    required this.especie,
    this.alimentado = false,
    this.aguaOk = false,
  });

  // método auxiliar para atualizar o estado de forma imutável
  Pet copyWith({bool? alimentado, bool? aguaOk}) {
    return Pet(
      id: id,
      nome: nome,
      especie: especie,
      alimentado: alimentado ?? this.alimentado,
      aguaOk: aguaOk ?? this.aguaOk,
    );
  }
}