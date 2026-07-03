
import 'package:palm_app/package.dart';
import '../view_models/change_password_view_model.dart';

class ChangePasswordView extends ConsumerStatefulWidget {
  const ChangePasswordView({super.key});

  @override
  ConsumerState<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends ConsumerState<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final oldPassword = _oldPasswordController.text;
      final newPassword = _newPasswordController.text;

      final scaffoldMessenger = ScaffoldMessenger.of(context);
      final router = GoRouter.of(context);

      final errorMessage = await ref.read(changePasswordViewModelProvider.notifier).changePassword(oldPassword, newPassword);

      if (!mounted) return;

      if (errorMessage == null) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: const Text('Password changed successfully'),
            backgroundColor: context.presentColor,
          ),
        );
        router.pop();
      } else {
        UIUtils.showErrorDialog(context, ApiErrorParser.parse(errorMessage), title: 'Change Password Failed');
      }
    }
  }

  InputDecoration _buildInputDecoration(String label, IconData icon, bool isPassword, bool isVisible, VoidCallback onVisibilityToggle) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: context.primaryColor),
      suffixIcon: isPassword
          ? IconButton(
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: onVisibilityToggle,
            )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: context.primaryColor, width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changePasswordViewModelProvider);
    final isLoading = state.isLoading;

    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        title: Text('Change Password', style: TextStyle(color: context.primaryColor, fontWeight: FontWeight.bold)),
        backgroundColor: context.backgroundColor,
        iconTheme: IconThemeData(color: context.primaryColor),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Create a new strong password for your account.',
                  style: TextStyle(
                    fontSize: 16,
                    color: context.textSecondary,
                  ),
                ),
                const SizedBox(height: 32),

                // Old Password
                TextFormField(
                  controller: _oldPasswordController,
                  obscureText: !_isOldPasswordVisible,
                  decoration: _buildInputDecoration(
                    'Current Password',
                    Icons.lock_outline,
                    true,
                    _isOldPasswordVisible,
                    () => setState(() => _isOldPasswordVisible = !_isOldPasswordVisible),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // New Password
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: !_isNewPasswordVisible,
                  decoration: _buildInputDecoration(
                    'New Password',
                    Icons.lock,
                    true,
                    _isNewPasswordVisible,
                    () => setState(() => _isNewPasswordVisible = !_isNewPasswordVisible),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Confirm Password
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: _buildInputDecoration(
                    'Confirm New Password',
                    Icons.check_circle_outline,
                    true,
                    _isConfirmPasswordVisible,
                    () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your new password';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),

                // Submit Button
                ElevatedButton(
                  onPressed: isLoading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: context.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                  ),
                  child: isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: SkeletonLoader(child: SkeletonBox(width: 24, height: 24, borderRadius: 12)),
                        )
                      : const Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
