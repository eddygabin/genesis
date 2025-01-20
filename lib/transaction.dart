class Transaction {
  final int id;
  final String titre;
  final double montant;
  final DateTime date;

  Transaction({
    required this.id,
    required this.titre,
    required this.montant,
    required this.date,
  });
}
