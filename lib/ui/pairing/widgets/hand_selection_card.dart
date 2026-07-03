import 'package:palm_app/package.dart';

class HandSelectionCard extends StatelessWidget {
  final String title;
  final String side;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const HandSelectionCard({
    super.key,
    required this.title,
    required this.side,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? context.primaryColor.withValues(alpha: 0.1) : context.surfaceColor,
          border: Border.all(
            color: isSelected ? context.primaryColor : context.borderColor,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected 
            ? [BoxShadow(color: context.primaryColor.withValues(alpha: 0.15), blurRadius: 12, offset: const Offset(0, 4))] 
            : [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: isSelected ? context.primaryColor : Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? context.primaryColor : context.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
