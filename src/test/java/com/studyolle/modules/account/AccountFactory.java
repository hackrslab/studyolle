package com.studyolle.modules.account;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.swing.plaf.SpinnerUI;

@Component
@RequiredArgsConstructor
public class AccountFactory {

    @Autowired AccountRepository accountRepository;

    public Account createAccount(String nickname) {
        Account whiteship = new Account();
        whiteship.setNickname(nickname);
        whiteship.setEmail(nickname + "@email.com");
        accountRepository.save(whiteship);
        return whiteship;
    }

}
