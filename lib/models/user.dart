class User {
  final String id;
  final String username;
  final String email;
  final String? avatarUrl;
  final int elo;
  final String division;
  final int wins;
  final int losses;
  final int draws;
  final DateTime createdAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.avatarUrl,
    required this.elo,
    required this.division,
    required this.wins,
    required this.losses,
    required this.draws,
    required this.createdAt,
  });

  int get totalMatches => wins + losses + draws;
  
  double get winRate {
    if (totalMatches == 0) return 0.0;
    return wins / totalMatches;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'avatarUrl': avatarUrl,
      'elo': elo,
      'division': division,
      'wins': wins,
      'losses': losses,
      'draws': draws,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      elo: json['elo'] as int,
      division: json['division'] as String,
      wins: json['wins'] as int,
      losses: json['losses'] as int,
      draws: json['draws'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}

