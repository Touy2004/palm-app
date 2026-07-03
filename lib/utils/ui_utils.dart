
import 'package:palm_app/package.dart';

class UIUtils {
  static void showErrorDialog(BuildContext context, String message, {String title = 'Error'}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.error_outline, color: context.errorColor),
            const SizedBox(width: 8),
            Text(title, style: TextStyle(color: context.errorColor)),
          ],
        ),
        content: Text(
          message,
          style: TextStyle(fontSize: 16, color: context.textPrimary),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: context.surfaceColor,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              foregroundColor: context.primaryColor,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
