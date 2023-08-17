import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:sweet_smash_app/config.dart';
import 'package:sweet_smash_app/modules/auth/models/register_request_model.dart';
import 'package:sweet_smash_app/modules/auth/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isAPICallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey();

  String? name;
  String? lastname;
  String? email;
  String? password;
  String? passwordConfirmation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 182, 78, 70),
        body: ProgressHUD(
          key: UniqueKey(),
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
          child: Form(
            key: globalFormKey,
            child: _registerUI(context),
          ),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/ShoppingAppLogo.png',
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20, top: 50),
            child: Text(
              'Regístrate',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),

          // NAME FIELD
          FormHelper.inputFieldWidget(
            context,
            'name',
            'Nombre',
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'El campo "nombre" no puede ser vacío';
              }

              return null;
            },
            (onSavedVal) {
              name = onSavedVal;
            },
            prefixIcon: const Icon(Icons.person),
            showPrefixIcon: true,
            borderFocusColor: Colors.white,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white,
            borderRadius: 15,
            validationColor: Colors.yellow,
            borderErrorColor: Colors.yellow,
          ),

          // LASTNAME FIELD
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              'lastname',
              'Apellido',
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'El campo "apellido" no puede ser vacío';
                }

                return null;
              },
              (onSavedVal) {
                lastname = onSavedVal;
              },
              prefixIcon: const Icon(Icons.person),
              showPrefixIcon: true,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white,
              borderRadius: 15,
              validationColor: Colors.yellow,
              borderErrorColor: Colors.yellow,
            ),
          ),

          // EMAIL FIELD
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              'email',
              'Correo Electrónico',
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'El campo "email" no puede ser vacío';
                }

                return null;
              },
              (onSavedVal) {
                email = onSavedVal;
              },
              prefixIcon: const Icon(Icons.email),
              showPrefixIcon: true,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white,
              borderRadius: 15,
              validationColor: Colors.yellow,
              borderErrorColor: Colors.yellow,
            ),
          ),

          // PASSWORD FIELD
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              'password',
              'Contraseña',
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'El campo contraseña no puede ser vacío';
                }

                return null;
              },
              (onSavedVal) {
                password = onSavedVal;
              },
              prefixIcon: const Icon(Icons.password),
              showPrefixIcon: true,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white,
              borderRadius: 15,
              obscureText: hidePassword,
              validationColor: Colors.yellow,
              borderErrorColor: Colors.yellow,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.white.withOpacity(0.7),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),

          // PASSWORD CONFIRMATION FIELD
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              'passwordConfirmation',
              'Confirmar contraseña',
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'El campo contraseña no puede ser vacío';
                }

                return null;
              },
              (onSavedVal) {
                passwordConfirmation = onSavedVal;
              },
              prefixIcon: const Icon(Icons.password),
              showPrefixIcon: true,
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white,
              borderRadius: 15,
              validationColor: Colors.yellow,
              borderErrorColor: Colors.yellow,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.white.withOpacity(0.7),
                icon: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text: '¿Olvidaste tu contraseña?',
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // ignore: avoid_print
                          print('forget password');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              'Regístrate',
              () {
                if (validateAndSave()) {
                  setState(() {
                    isAPICallProcess = true;
                  });

                  RegisterRequestModel model = RegisterRequestModel(
                    name: name!,
                    lastname: lastname!,
                    email: email!,
                    password: password!,
                    passwordConfirmation: passwordConfirmation!,
                  );

                  AuthService.register(model).then((response) {
                    setState(() {
                      isAPICallProcess = false;
                    });
                    if (response.success) {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        'Registro completado correctamente',
                        'Iniciar Sesión',
                        () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/login',
                          (route) => false,
                        ),
                      );
                    } else {
                      FormHelper.showSimpleAlertDialog(
                        context,
                        Config.appName,
                        response.message,
                        'OK',
                        () => Navigator.pop(context),
                      );
                    }
                  });
                }
              },
              btnColor: const Color.fromARGB(255, 182, 78, 70),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 15,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                      color: Color.fromARGB(255, 185, 185, 185), fontSize: 14),
                  children: <TextSpan>[
                    const TextSpan(text: '¿Ya tienes una cuenta? '),
                    TextSpan(
                      text: 'Inicia Sesión',
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }
}
