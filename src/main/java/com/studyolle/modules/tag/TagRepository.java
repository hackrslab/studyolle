package com.studyolle.modules.tag;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface TagRepository extends JpaRepository<Tag, Long> {
    Tag findByTitle(String title);
}
