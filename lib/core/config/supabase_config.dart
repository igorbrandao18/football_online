/// Configuração do Supabase
class SupabaseConfig {
  SupabaseConfig._();

  // Credenciais do projeto Supabase
  static const String supabaseUrl = 'https://ildcipkeqegghjduazvn.supabase.co';
  static const String supabaseAnonKey = 
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlsZGNpcGtlcWVnZ2hqZHVhenZuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMzMTE5MzgsImV4cCI6MjA3ODg4NzkzOH0.lbBCUx-DBeSB1826MkRerMixzhRpRecxkC4c2rI1awY';

  // Configurações
  static const Duration authTimeout = Duration(seconds: 30);
  static const Duration realtimeTimeout = Duration(seconds: 30);
}

