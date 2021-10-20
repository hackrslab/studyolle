package com.studyolle.infra;

import org.testcontainers.containers.PostgreSQLContainer;

public abstract class ContainerBaseTest {

    static final PostgreSQLContainer POSTGRE_SQL_CONTAINER;

    static {
        POSTGRE_SQL_CONTAINER = new PostgreSQLContainer<>("postgres:latest");
        POSTGRE_SQL_CONTAINER.start();
    }

}
