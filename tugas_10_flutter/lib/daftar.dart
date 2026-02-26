import 'package:flutter/material.dart';
import 'package:tugas_10_flutter/beranda.dart';

class DaftarDay15 extends StatefulWidget {
  const DaftarDay15({super.key});

  @override
  State<DaftarDay15> createState() => _DaftarDay15State();
}

class _DaftarDay15State extends State<DaftarDay15> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas 10 Ella")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Lengkap",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade600,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  hintText: "Nama Lengkap",
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                ),
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16),
              Text(
                "Nomor Telepon",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade600,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  hintText: "081234567890",
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(Icons.phone, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Asal Kota",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade600,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  hintText: "Nama Kota",
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(Icons.phone, color: Colors.white),
                ),
                controller: cityController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Kota tidak boleh kosong";
                  } else {
                    return null;
                  }
                },
              ),

              SizedBox(height: 16),
              Text(
                "Email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade600,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  hintText: "nama@gmail.com",
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(Icons.mail, color: Colors.white),
                ),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email tidak boleh kosong";
                  } else if (!value.contains("@gmail.com")) {
                    return "Email tidak valid";
                  } else {
                    return null;
                  }
                },
              ),

              SizedBox(height: 16),
              Text(
                "Password",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade600,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade900),
                  ),
                  hintText: "password",
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(Icons.password, color: Colors.white),
                ),
                controller: passwordController,
                validator: (value) {
                  final password = value ?? '';
                  if (password.isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  if (password.length < 6) {
                    return "Password minimal 6 karakter";
                  }

                  final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
                  final hasLowercase = RegExp(r'[a-z]').hasMatch(password);
                  final hasNumber = RegExp(r'\d').hasMatch(password);
                  final hasSpecialChar = RegExp(
                    r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\];\`~+=]',
                  ).hasMatch(password);

                  if (!hasUppercase) {
                    return "Password harus mengandung minimal 1 huruf besar";
                  }
                  if (!hasLowercase) {
                    return "Password harus mengandung minimal 1 huruf kecil";
                  }
                  if (!hasNumber) {
                    return "Password harus mengandung minimal 1 angka";
                  }
                  if (!hasSpecialChar) {
                    return "Password harus mengandung minimal 1 karakter spesial";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8, // 👈 shadow
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final name = nameController.text;
                      final email = emailController.text;
                      final phone = phoneController.text;
                      final city = cityController.text;

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            title: Text(
                              "Pendaftaran Berhasil",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              "Nama: $name\nEmail: $email\nNo HP: $phone\nAsal Kota: $city",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Future.microtask(() {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BerandaDay15(
                                          name: name,
                                          city: city,
                                        ),
                                      ),
                                    );
                                  });
                                },
                                child: Text("Lanjut"),
                              ),
                            ],
                          );
                        },
                      );

                      _formKey.currentState!.reset();
                    }
                  },
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
