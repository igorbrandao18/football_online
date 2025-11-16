/// Constantes relacionadas a API e endpoints
class ApiConstants {
  ApiConstants._();

  // Supabase (será configurado via environment)
  static const String supabaseUrlKey = 'SUPABASE_URL';
  static const String supabaseAnonKeyKey = 'SUPABASE_ANON_KEY';
  
  // Endpoints
  static const String authEndpoint = '/auth/v1';
  static const String restEndpoint = '/rest/v1';
  static const String realtimeEndpoint = '/realtime/v1';
  
  // Tables
  static const String profilesTable = 'profiles';
  static const String matchesTable = 'matches';
  static const String rankingsTable = 'rankings';
  static const String tournamentsTable = 'tournaments';
  static const String friendshipsTable = 'friendships';
  
  // WebSocket Events
  static const String wsJoinMatch = 'join_match';
  static const String wsPlayerAction = 'player_action';
  static const String wsPauseMatch = 'pause_match';
  static const String wsLeaveMatch = 'leave_match';
  static const String wsMatchStarted = 'match_started';
  static const String wsGameStateUpdate = 'game_state_update';
  static const String wsPlayerScored = 'player_scored';
  static const String wsMatchEnded = 'match_ended';
  
  // Timeouts
  static const Duration requestTimeout = Duration(seconds: 30);
  static const Duration connectionTimeout = Duration(seconds: 10);
}

