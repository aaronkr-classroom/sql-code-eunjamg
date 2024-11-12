# 10장 연습문제

**01 데이터베이스 설계 단계 중 다음 ( ) 안의 내 용 순서로 옳은 것은?**

`요구사항분석 → ( ) → ( ) → ( )`


3. 개념적 설계 → 논리적 설계 → 물리적 설계


**02 데이터베이스 물리적 설계 단계에 대한 설명으로 옳은 것은?**


2. 사용할 DBMS에 맞는 스키마를 설계한다.


**03 물리적 데이터베이스 설계를 위해 고려해야 하는 요소가 아닌 것은?**


2. 종속성

**04 정규호壇 적용할 수 있는 설계 단계는?**


3. 논리적 설계


**05 E-R 모델에서의 〈관계 타입〉 혹은 〈개체 타입〉의 예로 가장 옳은 것은?**


3. 관계 타입: 〈상담〉,〈수강〉,〈과목〉


**06 다음 E-R 다이어그램을 릴레이션 스키마로 가장 올바르게 변환한 것은?**

376쪽의 그림도 보세요.

1. A(al, a2, bl, cl) B(bl, b2)


**07 다음문장이 참이면 O, 거짓이면 X 를하시오.**

1. 데이터베이스 모델링은 분석을, 데이터베이스 설계는 구현에 초점을 맞춘 것이다. (o )
2. E-R 다이어그램을 작성하기 위한 가장 중요한 요소는 관계이다. (x )
3. 관계는 적어도 둘 이상의 개체를 대상으로 연관성을 갖는다. (o )
4. 속성은 실세계에서 종속적 존재이므로 반드시 상위 개념이 필요하다. (x )
5. E-R 다이어그램의 개체는 기본적으로 하나의 독립된 릴레이션으로 변환된다. (o )
6. E-R 다이어그램에서 다중값 속성은 하나의 릴레이션으로 분리하여 변환한다. ( o)
7. ER-win 모델링 도구에서는 논리적 모델링과 물리적 모델링의 작업 내용을 서로 연계하여 두 작업 과정을 상호 전환하면서 진행할 수 있다. (o )
8. ER-win에서 식별 관계는 관계선을 점선으로 표시하며 약 엔터티는 둥근 사각형으로 구별된다. (x)
9. ER-win에서 엔터티를 표현하는 사각형 안의 위쪽 영역에는 기본키에 해당하는 키 속성을 입력한다. (o )

**08 다음 ( ) 안에 적당한 용어를 채워 완성하시오.**

1. 데이터베이스 설계의 핵심은 작성된 E-R 다이아고램을 ( 관계형) 데이터 모델로 변환하는 논리적 데이터 설계 과정이다.
2. 요구사항 명세서에서 고유한 명칭(이름, 번호)을 보유하는 존재는 (개체 ）로 표현하는 것이 바람직하다.
3. E-R 다이어그램의 관계는 관계 (타입 )에 따라서 관계형 데이터 모델로의 변환 과정이 다르다.
4. ( 물리적) 설계는 릴레이션 스키마들을 실제 DBMS 안에 물리적인 저장 구조를 생성하는 SQL 명령어 문장으로 변환한다.
5. E-R 다이아그램에서 일대다 관계는 하나의 ( 외래）키 속성으로 변환한다.
6. ERwin에서 결국 대다다 관계선은 새로운 ( 연결) 엔터티와의 2개의 일대다 관계선으로 변환되어야만 한다.
7. ERwin에서 식별 관계는 자식 엔터티를 약 엔터티 즉, (둥근 ) 사각형으로 표시하고 비식별 관계는 자식 엔터티를 강 엔터티 즉, ( 각진）사각형으로 표시한다.
   **09 다음 E-R 다이아그램을 관계형 데이터베이스 스키마로 변환하여 릴레이션 구조로 표현하시오.**

377쪽의 그림도 보세요.
학생 (Student) 개체
속성: 학번(StudentID, 기본키), 이름(Name), 전공(Major)
릴레이션:

sql
코드 복사
Student(StudentID PRIMARY KEY, Name, Major)
과목 (Course) 개체
속성: 과목코드(CourseID, 기본키), 과목명(CourseName), 학점(Credit)
릴레이션:

sql
코드 복사
Course(CourseID PRIMARY KEY, CourseName, Credit)
수강 (Enrollment) 관계
다대다 관계이므로 학생(Student)과 과목(Course)을 연결하는 별도의 테이블을 만듭니다.
속성: 학번(StudentID, 외래키), 과목코드(CourseID, 외래키), 성적(Grade)
릴레이션:

sql
코드 복사
Enrollment(StudentID FOREIGN KEY REFERENCES Student(StudentID), 
           CourseID FOREIGN KEY REFERENCES Course(CourseID), 
           Grade, 
           PRIMARY KEY (StudentID, CourseID))
교수 (Professor) 개체
속성: 교수번호(ProfessorID, 기본키), 이름(Name), 학과(Department)
릴레이션:

sql
코드 복사
Professor(ProfessorID PRIMARY KEY, Name, Department)
강의 (Teaches) 관계
교수가 과목을 가르치는 관계로, 교수와 과목을 연결합니다.
속성: 교수번호(ProfessorID, 외래키), 과목코드(CourseID, 외래키)
릴레이션:

sql
코드 복사
Teaches(ProfessorID FOREIGN KEY REFERENCES Professor(ProfessorID), 
        CourseID FOREIGN KEY REFERENCES Course(CourseID), 
        PRIMARY KEY (ProfessorID, CourseID))