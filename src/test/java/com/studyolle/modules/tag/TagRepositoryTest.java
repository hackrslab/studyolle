package com.studyolle.modules.tag;

import com.studyolle.infra.ContainerBaseTest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

@DataJpaTest
class TagRepositoryTest extends ContainerBaseTest {

    @Autowired TagRepository tagRepository;

    @Test
    void findAll() {
        Tag spring = Tag.builder().title("spring").build();
        tagRepository.save(spring);

        Tag hibernate = Tag.builder().title("hibernate").build();
        tagRepository.save(hibernate);

        List<Tag> tags = tagRepository.findAll();
        assertEquals(2, tags.size());
    }

}