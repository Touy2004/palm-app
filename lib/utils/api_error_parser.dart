
import 'package:palm_app/package.dart';
class ApiErrorParser {
  static String parse(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        final statusCode = error.response?.statusCode;
        
        // Handle 5xx Server Errors
        if (statusCode != null && statusCode >= 500 && statusCode < 600) {
          return "Server error ($statusCode). Please try again later.";
        }
        
        // Extract JSON message from API response
        final data = error.response?.data;
        if (data is Map && data['message'] != null) {
          return data['message'].toString();
        }
        
        // Fallback for other HTTP errors
        return "An error occurred ($statusCode). Please try again.";
      }
      
      // Handle connection/timeout errors
      if (error.type == DioExceptionType.connectionTimeout || 
          error.type == DioExceptionType.receiveTimeout || 
          error.type == DioExceptionType.sendTimeout) {
        return "Connection timed out. Please check your internet connection.";
      }
      
      if (error.type == DioExceptionType.connectionError) {
        return "No internet connection or server is unreachable.";
      }
      
      return "Network error. Please try again.";
    }
    
    // Generic fallback for non-Dio errors
    return "An unexpected error occurred.";
  }
}
