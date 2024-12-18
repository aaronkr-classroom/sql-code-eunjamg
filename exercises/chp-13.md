#13장 연습문제

**01 몽고DB 에 관한 설명으로 옳지 않은 것은?**


4. 관계형 데이터베이스와 동일한 질의 기능을 지원한다.

**02 몽고DB 의 주요 특성으로 거 리가 먼 것은?**


2. 휘발성 (volatile)


**03 컬렉션(collection) 에 관한 설명으로 옳지 않은 것은?**

1. 컬렉션도 정해진 고정 스키마를 갖는다.

**04 몽고DB의 동적 스키마에 관한 설명으로 옳지 않은 것은?**


4. 스키마를 변경하거나 데이블을 추가하는 등 대웅이 복잡하고 어렵다.

**05 몽고OB의 '_id' 필드에 관한 설명으로 옳은 것은?**

1. 저장된 모든 문서는 '_id' 필드를 가진다.

**06 다음문장이 참이면 O, 거짓이면 X 를하시오.**

1. 몽고DB는 대표적 비관계형 DBMS로서 개발이 쉽고 유연하며 확장성이 높다. ( o)
2. 몽고DB는 JSON 형식의 문서를 사용하지만 데이터베이스 저장시에는 이진 포맷으로 인코딩한 BSON 형식의 문서로 변환되어 저장된다. ( o)
3. 몽고DB는 별도의 스키마 선언 없이도 릴레이션에 해당하는 컬렉션을 생성할 수 있다. ( o)
4. 몽고DB 쉘에 집속하기 위해서는 우선 mongod 인스턴스가 실행되어야 한다. (o )
5. find() 명령어 함수 뒤의 pretty() 명령어 함수는 배열과 내장 문서와 같이 복잡한 계층 문서들의 내용을 정돈해서 보기 쉽도록 표시해준다. ( o)
6. findOne() 명령어 함수는 커서 객체를 반환하며 여러 문서를 검색 결과를 통해 얻고자 할 경우 사용하며 커서를 활용하여 문서 처리 작업을 반복한다. ( x)
7. updateOne(), updateMany() 명령어 함수는 특정 필드값을 바꾸거나 필드 아름을 변경, 또는 필드를 삭제하는 등의 문서 수정을 수행한다. (o )
8. replaceOne() 명령어 함수는 문서 변경이 아니라 교체이기 때문에 기존 문서 내용은 전부 사라지지만 문서 고유의 값인 '_id' 필드값은 바뀌지 않는다. ( o)
9. 몽고DB는 관계형 DB처럼 색인 사용이 불가능하다. (x )

**07 다음 ( ) 안에 적당한 용어를 채워 완성하시오.**

1. 몽고DB에서 가용성을 향상시키기 위한 (샤딩 )은 데이터베이스의 데이터를 수평 분할(horizontal partitioning)하여 여러 서버에 분산 저장하는 방식이다.
2. 몽고DB의 기본 구성 요소중에서 (컬렉션 )은 문서의 모음으로 동적 스키마를 갖는 데이블과 같다.
3. 몽고DB (쉘 )은 문서에 대한 질의뿐만 아니라 관리나 실행중인 인스턴스를 점검하는데 유용한 도구로써 자바스크립트 해석 기능을 가지고 있어 자바스크립트 프로그램 작성과 실행이 가능하다.
4. (replaceOne )() 명령어 함수는 특정 문서를 찾아서 새로운 문서로 교체한다.
5. 몽고DB에서 컬렉션에 문서 하나를 추가하는 명령어는 ( insertOne)()이다.

**08 다음 릴레이션 관련 SQL 명령문에 대응하는 컬렉션 관련 몽고DB 명령문(1~2）을 작성하시오.**

```sql
#1
CREATE TABLE 회원(
_id INT NOT NULL AUTO_INCREMENT,
나이 INT NULL,
생성 성별 char(1) NULL,
메모 varchar(100) NULL,
PRIMARY KEY(_id)
);

#2
ALTER TABLE 회원
ADD 탈퇴 날짜 DATETIME;

#3
DROP TABLE 회원;
```

1. ___
2. ___
3. db.회원.drop()
답: #1
CREATE TABLE 회원(
_id INT NOT NULL AUTO_INCREMENT,
나이 INT NULL,
성별 char(1) NULL,
메모 varchar(100) NULL,
PRIMARY KEY(_id)
);

#2
ALTER TABLE 회원
ADD 탈퇴 날짜 DATETIME;

#3
DROP TABLE 회원;

**09 다음 투플 관련 SQL 명령문에 대응하는 문서 관련 몽고DB 명령문(1~9)을 작성하시오.**

```sql
#1
INSERT INTO 회원(_id, 나이, 성별, 메모)
VALUES ("m111" ,55, "남" , null);

#2
INSERT INTO 회원(_id, 나이, 성별, 메모)
VALUES ("m222", null, null, "임시 회원임");

#3
SELECT * FROM 회원;

#4
SELECT _id, 성별
FROM 회원 WHERE 성별 != "남";

#5
SELECT * FROM 회원 WHERE 성별 = "남" ORDER BY 나이 ASC;

#6
SELECT COUNT(_id) FROM 회원;

#7
UPDATE 회원
SET 성별="여"
WHERE 나이 > 25;

#8
DELETE FROM 회원;

#9
DELETE FROM 회원
WHERE 성별="여"
```

1. db.회원.insertOne({_id: "m111", 나이: 55, 성별: "남"});
2. ___
3. db.회원.find();
4. ___
5. ___
6. db.회원.find({_id:{$exist:true}}).count();
7. ___
8. db.회원.deleteMany({});
9. ___
    답: #1
INSERT INTO 회원(_id, 나이, 성별, 메모)
VALUES ("m111", 55, "남", null);

#2
INSERT INTO 회원(_id, 나이, 성별, 메모)
VALUES ("m222", null, null, "임시 회원임");

#3
SELECT * FROM 회원;

#4
SELECT _id, 성별 FROM 회원 WHERE 성별 != "남";

#5
SELECT * FROM 회원 WHERE 성별 = "남" ORDER BY 나이 ASC;

#6
SELECT COUNT(_id) FROM 회원;

#7
UPDATE 회원 SET 성별 = "여" WHERE 나이 > 25;

#8
DELETE FROM 회원;

#9
DELETE FROM 회원 WHERE 성별 = "여";

**10 4가지 NoSQL 데이터베이스 유형의 특성을 비교 • 요약하시오.**
1.문서 지향형 (Document-oriented DB)
특성: 데이터를 JSON, BSON 등의 형식으로 저장하는 데이터베이스입니다. 각 데이터는 '문서'라는 단위로 저장됩니다.
장점: 데이터 모델이 유연하고, 스키마가 동적입니다. 복잡한 계층 구조를 자연스럽게 표현할 수 있습니다.
예시: MongoDB, CouchDB.
용도: 복잡한 데이터 구조나 다양한 형식의 데이터를 저장할 때 유용합니다.
2.키-값 저장소 (Key-Value Store)
특성: 데이터는 단순한 키-값 쌍으로 저장됩니다. 키는 고유하고, 값은 어떠한 형식도 가능합니다.
장점: 매우 빠르고, 간단한 구조로 데이터 접근 속도가 빠릅니다.
예시: Redis, DynamoDB.
용도: 세션 관리, 캐시 시스템, 간단한 설정 저장 등 빠른 읽기/쓰기가 필요한 경우에 적합합니다.
3.열 지향형 (Column-family DB)
특성: 데이터를 테이블의 행 대신 열 단위로 저장합니다. 대량의 데이터를 효율적으로 처리하고 분석할 수 있습니다.
장점: 읽기 성능과 확장성이 뛰어나며, 대규모 데이터 분석에 적합합니다.
예시: Cassandra, HBase.
용도: 로그 분석, 대규모 데이터 처리, 실시간 분석 등에서 사용됩니다.
4.그래프형 (Graph DB)
특성: 데이터를 노드, 엣지, 속성의 형태로 모델링하여 관계를 저장하고 탐색하는 데 최적화된 데이터베이스입니다.
장점: 복잡한 관계를 자연스럽게 모델링하고 쿼리할 수 있으며, 관계 기반 탐색이 뛰어납니다.
예시: Neo4j, ArangoDB.
용도: 소셜 네트워크, 추천 시스템, 트랜잭션 네트워크 분석 등 관계를 중시하는 애플리케이션에서 유용합니다.
**11 몽고DB와 관계형 데이터베이스를 비교 • 설명하시오.**
몽고DB(MongoDB)와 관계형 데이터베이스(RDBMS, 예: MySQL, PostgreSQL)는 데이터 저장과 관리 방식에서 큰 차이를 보입니다. 두 시스템의 주요 차이점은 데이터 모델, 스키마, 확장성, 쿼리 방식 등에서 나타납니다.

