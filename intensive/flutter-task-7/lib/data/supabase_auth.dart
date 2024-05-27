import 'package:supabase_flutter/supabase_flutter.dart';

class Utils {

static String supabaseUrl= "https://tjwezzopaibxudgqyuar.supabase.co";

static String supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRqd2V6em9wYWlieHVkZ3F5dWFyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMzODM5OTMsImV4cCI6MjAyODk1OTk5M30.FzsJ6agdscvQ9s8ZkrMfXd2uGIs8h1HEX3LWymy8Dls";

static SupabaseClient supabaseClient = SupabaseClient (supabaseUrl, supabaseKey);

}