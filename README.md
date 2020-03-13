# StudyOlle

스터디 모임 관리 서비스

# 실행 방법

## IDE에서 실행 방법

IDE에서 프로젝트로 로딩한 다음에 메이븐으로 컴파일 빌드를 하고 App.java 클래스를 실행합니다.

### 메이븐으로 컴파일 빌드 하는 방법

```
mvn compile
```

메이븐으로 컴파일을 해야 프론트엔드 라이브러리를 받아오며 QueryDSL 관련 코드를 생성합니다.

## 콘솔에서 실행 방법

JAR 패키징을 한 뒤 java -jar로 실행합니다.

```
mvn clean compile package
```

```
java -jar target/*.jar
```
