class Match {
  final String id;
  final String player1Id;
  final String player2Id;
  final String? player1Team;
  final String? player2Team;
  final int player1Score;
  final int player2Score;
  final MatchStatus status;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? finishedAt;
  final String? winnerId;
  final MatchType type;

  Match({
    required this.id,
    required this.player1Id,
    required this.player2Id,
    this.player1Team,
    this.player2Team,
    required this.player1Score,
    required this.player2Score,
    required this.status,
    required this.createdAt,
    this.startedAt,
    this.finishedAt,
    this.winnerId,
    required this.type,
  });

  bool get isFinished => status == MatchStatus.finished;
  bool get isInProgress => status == MatchStatus.inProgress;
  bool get isWaiting => status == MatchStatus.waiting;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'player1Id': player1Id,
      'player2Id': player2Id,
      'player1Team': player1Team,
      'player2Team': player2Team,
      'player1Score': player1Score,
      'player2Score': player2Score,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'startedAt': startedAt?.toIso8601String(),
      'finishedAt': finishedAt?.toIso8601String(),
      'winnerId': winnerId,
      'type': type.name,
    };
  }

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'] as String,
      player1Id: json['player1Id'] as String,
      player2Id: json['player2Id'] as String,
      player1Team: json['player1Team'] as String?,
      player2Team: json['player2Team'] as String?,
      player1Score: json['player1Score'] as int,
      player2Score: json['player2Score'] as int,
      status: MatchStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => MatchStatus.waiting,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      startedAt: json['startedAt'] != null
          ? DateTime.parse(json['startedAt'] as String)
          : null,
      finishedAt: json['finishedAt'] != null
          ? DateTime.parse(json['finishedAt'] as String)
          : null,
      winnerId: json['winnerId'] as String?,
      type: MatchType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => MatchType.quick,
      ),
    );
  }
}

enum MatchStatus {
  waiting,
  inProgress,
  finished,
  cancelled,
}

enum MatchType {
  quick,
  ranked,
  tournament,
  friendly,
}

