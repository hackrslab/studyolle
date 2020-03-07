package com.studyolle.modules.tag;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Getter @Setter @EqualsAndHashCode(of = "id")
@Builder @AllArgsConstructor @NoArgsConstructor
public class Tag {

    @Id @GeneratedValue
    private Long id;

    @Column(unique = true, nullable = false)
    private String title;

}
