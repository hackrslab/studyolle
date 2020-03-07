package com.studyolle.modules.account.form;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

@Data
public class Profile {

    @Length(max = 35)
    private String bio;

    @Length(max = 50)
    private String url;

    @Length(max = 50)
    private String occupation;

    @Length(max = 50)
    private String location;

    private String profileImage;
}
