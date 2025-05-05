class Employe {
  final String _nom;
  final double _salaire;

  Employe({required String nom, required double salaire})
      : _nom = nom,
        _salaire = salaire;

  String get nom => _nom;
  double get salaire => _salaire;

  void afficherInfos() {
    print('Employé: $_nom, Salaire: $_salaire');
  }
}

class Manager extends Employe {
  final double _prime;

  Manager({required String nom, required double salaire, required double prime})
      : _prime = prime,
        super(nom: nom, salaire: salaire);

  @override
  void afficherInfos() {
    print('Manager: $nom, Salaire: $salaire, Prime: $_prime');
  }
}

void main() {
  var emp = Employe(nom: 'Alice', salaire: 3000);
  var mgr = Manager(nom: 'Bob', salaire: 5000, prime: 1000);

  List<Employe> personnel = [emp, mgr];

  for (var e in personnel) {
    e.afficherInfos(); // Appelle la bonne méthode selon le type réel
  }
}
