import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../constants.dart';
import '../../../data/RepositoryImpl.dart';
import '../../../main.dart';
import '../../widgets/designed_checkbox.dart';
import '../../widgets/designed_text_button.dart';
import '../../widgets/designed_text_field.dart';
import '../../widgets/link_button.dart';

class RegisterNewAccountTab extends StatefulWidget {
  const RegisterNewAccountTab({super.key});

  @override
  State<RegisterNewAccountTab> createState() => _RegisterNewAccountTabState();
}

class _RegisterNewAccountTabState extends State<RegisterNewAccountTab> {
  late final MaskTextInputFormatter phoneFormatter;

  late final MaskTextInputFormatter smsCodeFormatter;

  late bool canGoNext;

  @override
  void initState() {
    phoneFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      type: MaskAutoCompletionType.eager,
    );
    smsCodeFormatter = MaskTextInputFormatter(
      mask: '######',
      type: MaskAutoCompletionType.eager,
    );
    canGoNext = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Text(
            'Регистрация нового аккаунта',
            style: kTextStyle,
          ),
          DesignedTextField(
            labelText: 'Номер телефона',
            formatter: phoneFormatter,
            isPhone: true,
          ),
          DesignedTextButton(
            text: 'Выслать SMS-код',
            onPressCallback: () {
              print('masked phone is: ${phoneFormatter.getMaskedText()}');
              getIt<RepositoryImpl>()
                  .registerUserWithPhoneNumber(phoneFormatter.getMaskedText());
            },
          ),
          DesignedTextButton(
            text: 'Выслать повторно',
            onPressCallback: () {
              if (getIt<RepositoryImpl>().verificationId != null) {
                print('masked phone is: ${phoneFormatter.getMaskedText()}');
                getIt<RepositoryImpl>().registerUserWithPhoneNumber(
                    phoneFormatter.getMaskedText());
              }
            },
            backgroundColor: Colors.white,
            textColor: kRedColor,
          ),
          DesignedTextField(
            labelText: 'Код из SMS',
            formatter: smsCodeFormatter,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DesignedCheckbox(
                  checkedChangedCallback: (bool value) {
                    setState(() {
                      canGoNext = value;
                    });
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Ознакомлен с',
                          style: kGreyTextStyle,
                        ),
                        LinkButton(
                          text: 'Договором оферты',
                          onTapCallback: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'и согласен на',
                          style: kGreyTextStyle,
                        ),
                        LinkButton(
                          text: 'Рассылку',
                          onTapCallback: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          DesignedTextButton(
            text: 'Далее',
            onPressCallback: () async {
              if (canGoNext) {
                final repo = getIt<RepositoryImpl>();
                final String verificationId = repo.verificationId ?? '';
                final String smsCode = smsCodeFormatter.getMaskedText();
                final bool isUserCodeVerified =
                    await repo.isUserCodeVerified(verificationId, smsCode);
                if (isUserCodeVerified) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Регистрация завершена'),
                      content:
                          Text('Поздравляем! Вы успешно прошли регистрацию.'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Ок'))
                      ],
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Регистрация не пройдена'),
                      content: Text(
                          'Введенный код неверен. Попробуйте снова, используя кнопку \"Выслать повторно\".'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Ok'))
                      ],
                    ),
                  );
                }
                // go to the next page
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('В регистрации отказано'),
                    content: Text(
                        'Сначала поставте галочку о том, что вы согласны с договором оферты и согласны на рассылку.'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Ок'))
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
