import 'package:palm_app/package.dart';

class HomeHeader extends StatelessWidget {
  final User? user;
  final String greeting;

  const HomeHeader({
    super.key,
    required this.user,
    required this.greeting,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greeting,
              style: TextStyle(
                color: context.textSecondary,
                fontSize: 14.sp,
              ),
            ),
            Text(
              user?.fullName.replaceFirst(' ', '\n') ?? 'User',
              style: TextStyle(
                color: context.primaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 20.r,
          backgroundColor: context.borderColor,
          child: Text(
            user?.initials ?? 'U',
            style: TextStyle(
              color: context.textSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
