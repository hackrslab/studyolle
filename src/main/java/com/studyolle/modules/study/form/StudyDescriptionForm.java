package com.studyolle.modules.study.form;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;

@Data
@NoArgsConstructor
public class StudyDescriptionForm {

    @NotBlank
    @Length(max = 100)
    private String shortDescription;

    @NotBlank
    private String fullDescription;

}
