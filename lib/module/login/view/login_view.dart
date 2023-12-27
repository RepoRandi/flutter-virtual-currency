import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_currency/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(controller.backgroundImagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black
                  .withOpacity(0.2), // Sesuaikan opasitas sesuai kebutuhan
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${controller.greeting},',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Team rekrutmen PT Jagat Teknologi Indonesia.',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25.0),
            Row(
              children: [
                Text(
                  'Silahkan untuk',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 12.0),
                SizedBox(
                  width: 111,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () => controller.handleLogin(),
                    child: controller.isLoading
                        ? const CircularProgressIndicator(
                            color: vibrantBlueColor,
                          )
                        : Text(
                            'Masuk',
                            style: GoogleFonts.roboto(
                              color: blueColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
