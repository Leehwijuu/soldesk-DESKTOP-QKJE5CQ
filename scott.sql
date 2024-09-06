-- SQL 쿼리문은 대소문자를 구별하지 않음
-- 단, 비밀번호는 구별함
-- DML : 데이터 조작어(CRUD - Create / Read / Update / Delete)


-- 1) 조회
-- SELECT 컬럼명  --------------  5
-- FROM 테이블명  --------------- 1
-- WHERE 조건절  ---------------- 2
-- GROUP BY 컬럼명  ------------- 3
-- HAVING 집계함수 조건절  -------- 4
-- ORDER NY 컬럼명..  ----------- 6




-- EMP(employee - 사원테이블)
-- DEPT(department - 부서테이블)
-- SALGRADE (급여테이블)

-- 전체 조회
SELECT * FROM  EMP e;

-- 선택조회
-- 1) 컬럼 지정
SELECT
	EMPNO,
	ENAME,
	MGR
FROM
	EMP e;
	
-- 중복 죄회 : distinct
SELECT DISTINCT DEPTNO 
FROM EMP e;

-- 별칠
SELECT EMPNO as "사원번호"
FROM EMP e;

SELECT EMPNO "사원번호"
FROM EMP e;

SELECT EMPNO as "사원 번호"
FROM EMP e;

SELECT EMPNO, ENAME, SAL, COMM, SAL*12+COMM AS "연봉"
FROM EMP e;


-- 조회 후 정렬(오름차순-asc, 내림차순-desc)
-- sal 내림차순
SELECT
	EMPNO,
	SAL
FROM
	EMP e
ORDER BY
	SAL DESC;

-- sal 오름차순(asc 생략 가능)
SELECT
	EMPNO,
	SAL
FROM
	EMP e
ORDER BY
	SAL ASC;

-- empno
SELECT
	*
FROM
	EMP e
ORDER BY
	EMPNO DESC;

-- deptno 오름차순, sal 내림차순
SELECT
	*
FROM 
	EMP e
ORDER BY
	DEPTNO ASC,
	sal DESC;

SELECT
	EMPNO AS employee_no,
	ENAME employee_name,
	MGR AS manager,
	sal AS salary,
	comm AS commission,
	DEPTNO AS department_no
FROM 
	EMP e
ORDER BY
	DEPTNO DESC,
	sal ASC;

-- 선택 조회
-- 2) 조건 지정
-- SELECT 컬럼나열,... FROM 테이블명 WHERE 조건 나열;

-- 부서번호가 30번인 사원 전체 조회
-- = : 동일하다
SELECT
	*
FROM 
	EMP e
WHERE 
	DEPTNO  = 30;

-- 사원번호가 7839 인 사원 조회
-- 사원번호 중복되지 않음
-- where 조건으로 중복되지 않는 값이 사용된다면 결과는 하나만 조회됨
SELECT
	*
FROM 
	EMP e
WHERE
	EMPNO = 7839;
	
-- 부서번호가 30이고 직책이 salesman 인 사원 조회
-- 문자열은 홑따옴표만 사용
SELECT
	*
FROM 
	EMP e
WHERE
	DEPTNO = 30 AND JOB = 'SALESMAN';
	
-- 사원번호가 7698 이고 부서번호가 30인 사원조회
SELECT
	*
FROM 
	EMP e
WHERE
	DEPTNO = 30 AND EMPNO = 7698;
	
-- 부서번호가 30 이거나 직책이 CLERK 인 사원 조회
SELECT
	*
FROM 
	EMP e
WHERE
	DEPTNO = 30 OR JOB = 'CLERK';
	
-- 연봉이 36000 인 사원조회
SELECT
	*
FROM 
	EMP e
WHERE
	e.SAL * 12 = 36000;

-- 급여가 3000보다 큰 사원 조회
SELECT
	*
FROM 
	EMP e
WHERE
	e.SAL > 3000;

-- 급여가 3000이상인 사원 조회
SELECT
	*
FROM 
	EMP e
WHERE
	e.SAL >= 3000;

-- ename 이 f 이후의 문자열로 시작하는 사원 조회
SELECT
	*
FROM 
	EMP e
WHERE
	e.ENAME >= 'F';

-- 급여가 2500 이상이고 직업이 analyst 인 사원 조회
SELECT
	*
FROM 
	EMP e
WHERE
	e.SAL >= 2500 AND e.JOB = 'ANALYST' ;

-- job 이 manager, salesman, clerk 인 사원 조회
SELECT
	*
FROM 
	EMP e
WHERE
	 e.JOB = 'MANAGER' OR e.JOB = 'SALESMAN' OR e.JOB = 'CLERK' ;

-- SAL 이 3000 이 아닌 사원 조회
-- !=, <>, ^=
SELECT
	*
FROM 
	EMP e
WHERE
	e.SAL != 3000;

SELECT
	*
FROM 
	EMP e
WHERE
	e.SAL <> 3000;

SELECT
	*
FROM 
	EMP e
WHERE
	e.SAL ^= 3000;

-- IN
SELECT
	*
FROM 
	EMP e
WHERE
	e.JOB IN ('MANAGER','SALESMAN','CLERK');

-- job 이 manager, salesman, clerk 이 아닌 사원 조회
SELECT
	*
FROM 
	EMP e
WHERE
	e.JOB != 'MANAGER' AND e.JOB <> 'SALESMAN' AND e.JOB ^= 'CLERK' ;

SELECT
	*
FROM 
	EMP e
WHERE
	e.JOB NOT IN ('MANAGER','SALESMAN','CLERK');

-- 부서번호가 10이거나 20번인 사원조회
SELECT
	*
FROM 
	EMP e
WHERE
	e.DEPTNO = 20 OR e.DEPTNO = 10;

SELECT
	*
FROM 
	EMP e
WHERE
	e.DEPTNO IN (10, 20);

-- BETWEEN A AND B : 일정 범위 내의 데이터 조회 시 사용
-- 급여가 2000 이상이고 3000 이하인 조회
SELECT 
	*
FROM 
	EMP e 
WHERE 
	e.SAL >= 2000 AND e.SAL <= 3000;


SELECT 
	*
FROM 
	EMP e
WHERE 
	e.SAL BETWEEN 2000 AND 3000;

-- NOT BETWEEN A AND B : 일정 범위가 아닌 데이터 조회 시 사용
-- 급여가 2000 이상 3000 이하가 아닌 직원 조회
SELECT 
	*
FROM 
	EMP e
WHERE 
	e.SAL NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드(%, _)
-- ENAME = 'JONES' : 전체일치 
-- ENAME 이 J 로 시작하는 OR A 가 들어간 : 부분 일치(LIKE)

-- J% : J 로 시작하면 그 뒤에 어떤 문자가 몇 개가 오던지 상관없음
SELECT 
	*
FROM 
	EMP e 
WHERE 
	ENAME LIKE 'J%';

-- _J% : 어떤 문자로 시작해도 상관없으나 개수는 하나 / 두번째 문자는 J / 그 뒤에 어떤 문자가 몇 개가 오던지 상관없음
SELECT 
	*
FROM 
	EMP e 
WHERE 
	ENAME LIKE '_J%';

-- 사원명에 AM 문자가 포함된 사원 조회
SELECT 
	*
FROM 
	EMP e
WHERE 
	ENAME LIKE '%AM%';

-- 사원명에 AM 문자가 포함되지 않는 사원 조회
SELECT 
	*
FROM 
	EMP e 
WHERE 
	ENAME NOT LIKE '%AM%';

-- IS NULL
--*SELECT 
	*
--FROM 
--	EMP e 
--WHERE 
--	COMM = NULL; (X)*/
	
SELECT 
	*
FROM 
	EMP e 
WHERE 
	COMM IS NULL;
SELECT 
	*
FROM 
	EMP e
WHERE 
	COMM IS NOT NULL;

-- 집합 연산자
-- UNION : 합집합(결과 값의 중복 제거)
-- UNION ALL : 합집합(중복)
-- MINUS : 차집합
-- INTERSECT : 교집합

-- UNION
-- 부서번호가 10번인 사원 조회(사,이름,급여,부서번호) 
-- 부서번호가 10번인 사원 조회(사,이름,급여) 

SELECT 
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.DEPTNO
FROM 
	EMP e
WHERE
	e.DEPTNO = 10
UNION
SELECT 
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.DEPTNO
FROM 
	EMP e
WHERE
	e.DEPTNO = 20;





SELECT 
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.DEPTNO
FROM 
	EMP e
WHERE
	e.DEPTNO = 10
UNION ALL
SELECT 
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.DEPTNO
FROM 
	EMP e
WHERE
	e.DEPTNO = 10;





SELECT 
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.DEPTNO
FROM 
	EMP e
MINUS
SELECT 
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.DEPTNO
FROM 
	EMP e
WHERE
	e.DEPTNO = 10;




SELECT 
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.DEPTNO
FROM 
	EMP e
INTERSECT
SELECT 
	e.EMPNO,
	e.ENAME,
	e.SAL,
	e.DEPTNO
FROM 
	EMP e
WHERE
	e.DEPTNO = 10;

--##############################
--함수
--1. 오라클 내장 함수
--2. 사용자 정희 함수(PL/SQL)

-- 오라클 내장 함수
-- 1. 단일행 함수 : 데이터가 한 행 씩 입력되고 입력된 한 행당 결과가 하나씩 나오는 함수
-- 2. 다중행 함수 : 여러 행이 입력되고 결과가 하나의 행으로 반환되는 함수

-- 1. 문자함수
-- UPPER(문자열) : 괄호 안 문자열을 모두 대문자로
-- LOWER(문자열) : 괄호 안 문자열을 모두 소문자로
-- INITCAP(문자열) : 괄호 안 문자 데이터 중 첫문자만 대문자, 나머지는 소문자
-- LENGTH(문자열) : 문자열 길이
-- LENGTHB(문자열) : 문자열 바이트 수
-- SUBSTR(문자열/시작위치) / SUBSTR(문자열,시작위치,추출길이) : 문자열 일부 추출
-- INSTR(문자열,찾으려는문자) : 특정 문자나 문자열이 어디에 포함되어 있는지
-- INSTR(문자열,찾으려는문자,위치 찾기를 시작할 대상 문자열 데이터 위치, 시작위치에서 찾으려는 문자가 몇 번째인지)
-- REPLACE(문자열, 찾는문자, 대체문자)
-- CONCAT(문자열1, 문자열2) : 문자열 연결
-- TRIM / LTRIM / RTRIM : 특정 문자를 제거(주로 공백 제거 사용)


-- 데이터는 대소문자 구분 함
SELECT
	e.ENAME, UPPER(e.ENAME), 
	LOWER(e.ENAME), 
	INITCAP(e.ENAME) 
FROM
	EMP e;

SELECT 
	*
FROM 
	EMP e;

-- smith
SELECT 
	*
FROM 
	EMP e
WHERE 
	UPPER(ENAME) = UPPER('smith'); 

SELECT 
	*
FROM 
	EMP e
WHERE 
	UPPER(ENAME) = UPPER('%smith%'); 

-- DUAL : 오라클에서 제공하는 기본 테이블(함수 적용 결과 보기)
-- LENGTH / LENGTHB
SELECT
	LENGTH('한글'), 
	LENGTHB('한글'), 
	LENGTH('AB'),
	LENGTHB('AB')
FROM
	DUAL;

SELECT 
	JOB,
	SUBSTR(JOB,1,2),
	SUBSTR(JOB,3,2),
	SUBSTR(JOB,5)
FROM
	EMP;

-- - : 오른쪽 끝을 의미
SELECT 
	JOB,
	SUBSTR(JOB,-1,-2),
	SUBSTR(JOB,-3,-2),
	SUBSTR(JOB,-5)
FROM
	EMP;

SELECT 
	INSTR('HELLO, ORACLE!','L') AS INSTR_1,
	INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
	INSTR('HELLO, ORACLE!','L',2,2) AS INSTR_3
FROM
	DUAL;

-- 사원 이름에 S 가 있는 행 구하기
-- LIKE
SELECT 
	*
FROM
	EMP e
WHERE 
	ENAME LIKE '%S%'; 

-- INSRT 
SELECT 
	*
FROM
	EMP
WHERE 
	INSTR(ENAME,'S') > 0; 

-- 010-1234-1535
SELECT 
	'010-1234-1535' AS REPLACE_BEFORE,
	REPLACE('010-1234-1535','-',' ') AS REPLACE_1,
	REPLACE('010-1234-1535','-',) AS REPLACE_2
FROM 
	DUAL;

-- EMPNOM ENAME 연결 조회
-- CONCAT(EMPNO,CONCAT(':',ENAME)
SELECT 
	CONCAT(EMPNO, ENAME),
	CONCAT(EMPNO,CONCAT(' : ',ENAME))
FROM
	EMP e;

-- || == CONCAT
SELECT 
	EMPNO || ENAME, 
	EMPNO || ' : ' || ENAME
FROM
	EMP e;


SELECT 
	'[' || TRIM(' _ORACLE_' ) || ']' AS TRIM, 
	'[' || LTRIM(' _ORACLE_ ') || ']' AS LTRIM, 
	'[' || LTRIM('<_ORACLE_>','_<') || ']' AS LTRIM2, 
	'[' || RTRIM(' _ORACLE_ ') || ']' AS RTRIM, 
	'[' || RTRIM('<_ORACLE_>','>_') || ']' AS RTRIM2
FROM 
	DUAL;

-- 숫자함수
-- ROUND(숫자,[반올림위치])
-- TRUNC(숫자,[버림위치])
-- CEIL(숫자) : 지정한 숫자와 가장 가까운 큰 정수 찾기
-- FLOOR(숫자) : 지정한 숫자와 가장 가까운 작은 정수 찾기
-- MOD(숫자,나눌숫자) = %

SELECT
	ROUND(1234.5678) AS ROUND,
	ROUND(1234.5678, 0) AS ROUND_0,
	ROUND(1234.5678, 1) AS ROUND_1,
	ROUND(1234.5678, 2) AS ROUND_2,
	ROUND(1234.5678, -1) AS ROUND_MINUS1,
	ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM 
	DUAL;

SELECT
	TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS TRUNC_0,
	TRUNC(1234.5678, 1) AS TRUNC_1,
	TRUNC(1234.5678, 2) AS TRUNC_2,
	TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
	TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM 
	DUAL;

SELECT 
	CEIL(3.14), 
	FLOOR(3.14), 
	CEIL(-3.14), 
	FLOOR(-3.14)
FROM
	DUAL;

SELECT 
	MOD(15,6)
FROM
	DUAL;

-- 날짜함수
-- SYSDATE : 오라클 서버가 설치된 OS 의 현재날짜와 시간 사용
-- 날짜데이터 + 숫자 : 날짜 데이터봐 숫자만큼 일수 이후의 날짜
-- 날짜데이터 - 날짜 데이터 : 일수차이
-- 날짜데이터 + 날짜 데이터 : 안됨
-- ADD_MONTHS(날짜데이터, 더할 개월수)
-- MONTHS_BETWEEN(날짜데이터, 날짜데이터) : 두 날짜 데이터 간의 차이를 개월 수로 계산
-- NEXT_DAY(날짜데이터, 요일문자) : 날짜 데이터에서 돌아오는 요일의 날짜 반환
-- LAST_DAY() : 특정 날짜가 속한 달의 마지막 날짜 조회


SELECT  SYSDATE
FROM DUAL;

SELECT SYSDATE, SYSDATE-1, SYSDATE+1
FROM DUAL;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

-- 입사 20주년 조회
SELECT 
	E.EMPNO ,E.ENAME ,E.HIREDATE, ADD_MONTHS(E.HIREDATE, 240) 
FROM
	EMP e;

SELECT 
	EMPNO,
	ENAME,
	HIREDATE,
	SYSDATE,
	MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1,
	MONTHS_BETWEEN(SYSDATE , HIREDATE) AS MONTH2,
	TRUNC(MONTHS_BETWEEN(SYSDATE , HIREDATE)) AS MONTH3
FROM EMP;

SELECT SYSDATE, NEXT_DAY(SYSDATE,'월요일'), LAST_DAY(SYSDATE)
FROM DUAL;

-- 형변환 함수
-- TO_CHAR(날짜데이터, '출력되길 원하는 문자형태')
-- TO_NUMBER(문자데이터, '인식되길 원하는 숫자형태')
-- TO_DATE(문자데이터, '인식되길 원하는 날짜형태')

-- NUMBER + '문자숫자' : 연산해줌
SELECT E.EMPNO, E.ENAME, E.EMPNO + '500'
FROM EMP e;

-- 수치가 부적합합니다
--SELECT E.EMPNO, E.ENAME, E.EMPNO + 'ABCD'
--FROM EMP e;

-- 날짜데이터 => 문자데이터
-- 자바 월 mm / 분 MM
-- 오라클 월 MM / 분 MI
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS 현재날짜 
FROM DUAL;

SELECT
	TO_CHAR(SYSDATE, 'MM') AS 현재월,
	TO_CHAR(SYSDATE, 'MON') AS 현재월2,
	TO_CHAR(SYSDATE, 'MONTH') AS 현재월3
FROM
	DUAL;

-- DD, DDD, DAY
SELECT
	TO_CHAR(SYSDATE, 'DD') AS 일자,
	TO_CHAR(SYSDATE, 'DDD') AS 일자2,
	TO_CHAR(SYSDATE, 'DAY') AS 일자3
FROM
	DUAL;

SELECT
	SYSDATE,
	TO_CHAR(SYSDATE, 'HH:MI:SS') AS 현재시간,
	TO_CHAR(SYSDATE, 'HH12:MI:SS') AS 현재시간2,
	TO_CHAR(SYSDATE, 'HH24:MI:SS') AS 현재시간3,
	TO_CHAR(SYSDATE, 'HH24:MI:SS AM') AS 현재시간4
FROM
	DUAL;

-- 문자데이터 => 숫자데이터
SELECT 1300 - '1500', '1300' + 1500
FROM DUAL;

SELECT '1300' + '1500'
FROM DUAL;

-- 수치가 부적합합니다(, 가 포함되면 문자로 처리)
--SELECT '1,300' + '1,500'
--FROM DUAL;

-- 9(숫자 한자리를 의미: 빈자리는 채우지 않음) OR 0(숫자 한자리를: 빈자리를 채움)

SELECT TO_NUMBER('1,300','999,9999') + TO_NUMBER('1,500','999,999') AS 계산
FROM DUAL;

-- 문자데이터 => 날짜데이터
SELECT 
	TO_DATE('2024-09-05', 'YYYY-MM-DD') AS TODATE1, 
	TO_DATE('20240905', 'YYYY-MM-DD') AS TODATE2
FROM DUAL;

-- EMP 테이블에서 1981-06-01 이후에 입사한 사원 조회
SELECT 
	*
FROM
	EMP e
WHERE 
	E.HIREDATE >= '1981-06-01';

SELECT 
	*
FROM 
	EMP e 
WHERE 
	E.HIREDATE >= TO_DATE('1981-06-01','YYYY-MM-DD'); 

-- 날짜데이터 + 날짜데이터
-- 수치가 부적합합니다
--SELECT '2024-09-05' + '2024-01-02'
--FROM DUAL;

-- 날짜와 날짜의 가산은 할 수 없습니다
--SELECT
	--TO_DATE('2024-09-05') + TO_DATE('2024-01-02')
--FROM
	--DUAL;

SELECT
	TO_DATE('2024-09-05') - TO_DATE('2024-01-02')
FROM
	DUAL;

-- NULL 처리 함수
-- NULL 과 산술연산이 안됨 => NULL 을 다른 값으로 변경
-- NVL(널값,대체할값)
-- NVL2(널값,널이아닌경우,널인경우)
-- SAL = NULL (X) IS(O)

SELECT E.EMPNO, E.ENAME, E.SAL, E.COMM, E.SAL + E.COMM, E.SAL + NVL(E.COMM,0)
FROM EMP e 

-- 널이 아니면 SAL*12+COMM
-- 널이면 SAL*12
SELECT
	E.EMPNO,
	E.ENAME,
	E.SAL,
	E.COMM,
	NVL2(E.COMM, 'O', 'X'),
	NVL2(E.COMM, E.SAL * 12 + E.COMM , E.SAL * 12)
FROM
	EMP e;

-- DECODE 함수 / CASE 문
--DECODE (데이터,	
		--조건1, 조건1을 만족할때 해야할것,
		--조건2, 조건2을 만족할때 해야할것,
		--) AS 별칭

-- JOB 이 MANAGER 라면 * 1.1
-- JOB 이 SALEMAN 라면 * 1.5
-- JOB 이 ALALYST 라면
-- 		  그 외 라면 SAL * 1.03

SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB,
	E.SAL,
	DECODE(JOB,
	'MANAGER', E.SAL * 1.1,
	'SALEMAN', E.SAL * 1.5,
	'ALALYST', E.SAL,
	E.SAL * 1.03) AS UPSAL
FROM
	EMP e;

SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB,
	E.SAL,
	CASE JOB
	 WHEN 'MANAGER' THEN E.SAL * 1.1
	 WHEN 'SALEMAN' THEN E.SAL * 1.5
	 WHEN 'ALALYST' THEN E.SAL
	ELSE E.SAL * 1.03 
	END AS UPSAL
FROM
	EMP e;

-- COMM 널일때 '해당사항없음'
-- COMM = 0 '수당없음'
-- COMM > 0 '수당 : COMM'

SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB,
	E.SAL,
	CASE 
		WHEN E.COMM IS NULL THEN '해당사항없음'
		WHEN E.COMM = 0 THEN '수당없음'
		WHEN E.COMM > 0 THEN '수당 : ' || E.COMM 
	END AS COMM_TEXT
FROM
	EMP e;

-- EMP 테이블에서 사원들의 월 평균 근무일수는 21.5일입니다. 하루 근무시간을 8시간으로 봤을때
-- 사원들의 하루급여(DAY_PAY)와 시급(TIME_PAY)를 계산하여 결과를 출력한다
-- 사번,이름,SAL,DAY_PAY,TIME_PAY 출력
-- 단, 하루급여는 소수점 세째자리에서 버리고, 시급은 두번째 소수점에서 반올림하기

SELECT 
	E.EMPNO,
	E.ENAME,
	E.SAL,
	TRUNC(E.SAL / 21.5, 2) AS DAY_PAY,
	ROUND(E.SAL / 21.5 / 8, 1) AS TIME_PAY
FROM
	EMP e;


-- EMP 테이블에서 사원들은 입사일 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다. 사월들의
-- 정직원이 되는 날짜(R_JOB) 를 YYYY-MM-DD 형식으로 출력한다.
-- 사번,이름,고용일,R_JOB 출력
SELECT
	E.EMPNO,
	E.ENAME,
	E.HIREDATE,
	NEXT_DAY(ADD_MONTHS(E.HIREDATE, 3),'월요일') AS R_JOB
FROM
	EMP e;
-- + 추가수당
-- COMM 이 없으면 'N/A', 있으면 COMM 출력
SELECT
	E.EMPNO,
	E.ENAME,
	E.HIREDATE,
	NEXT_DAY(ADD_MONTHS(E.HIREDATE, 3),'월요일') AS R_JOB,
	CASE 
		WHEN E.COMM IS NULL THEN 'N/A'
		WHEN E.COMM IS NOT NULL THEN E.COMM || ''
	END AS COMM
FROM
	EMP e;
	


-- NVL
SELECT
	E.EMPNO,
	E.ENAME,
	E.HIREDATE,
	NEXT_DAY(ADD_MONTHS(E.HIREDATE, 3),'월요일') AS R_JOB,
	NVL(TO_CHAR(E.COMM, 'N/A')) AS COMM
FROM
	EMP e;



-- EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원번호(MGR)를 변환해서 CHGGR 에 출력
-- 사번,이름,MGR,CHG_MGR 출력
-- 조건
-- MGR이 널이면 '0000'/MGR 의 앞 두자리가 75 이면 '5555'/ 76이면 '6666'/ 77이면 '7777'/ 78 이면 '8888' CNFFUP
SELECT
	E.EMPNO,
	E.ENAME,
	E.MGR,
	DECODE(SUBSTR(TO_CHAR(E.MGR),1,2),
		NULL , '0000',
		'75', '5555',
		'76', '6666',
		'77', '7777',
		'78', '8888',
		SUBSTR(TO_CHAR(E.MGR),1)
	) AS CHG_MGR
FROM
	EMP e;

-- 다중행
-- SUM(합계를 낼 열), COUNT(), MAX(), MIN(), AVG()
-- DISTINCT : 중복제거

SELECT SUM(SAL) 
FROM EMP;

SELECT SUM(DISTINCT SAL), SUM(ALL SAL), SUM(SAL) 
FROM EMP;

SELECT COUNT(DISTINCT SAL), COUNT(ALL SAL), COUNT(SAL) 
FROM EMP;

SELECT MAX(SAL), MIN(SAL) 
FROM EMP;

SELECT MAX(SAL), MIN(SAL) 
FROM EMP
WHERE DEPTNO = 10;

-- 부서번호가 20번인 사원의 최근 입사일 조회
SELECT MAX(HIREDATE) 
FROM EMP
WHERE DEPTNO = 20;

SELECT MIN(HIREDATE) 
FROM EMP
WHERE DEPTNO = 20;

SELECT AVG(DISTINCT SAL), AVG(ALL SAL), AVG(SAL) 
FROM EMP;

-- 부서번호가 30번인 사원들의 평균 추가 수당
SELECT AVG(COMM) 
FROM EMP
WHERE DEPTNO = 30;

-- GROUP BY : 결과 값을 원하는 열로 묶어 출력
-- GROUP BY 그룹화할 열

-- 각 부서별 평균 급여 출력
SELECT DEPTNO, AVG(SAL) 
FROM EMP
GROUP BY DEPTNO 
ORDER BY DEPTNO;

-- 각부서별, 직책별 평균 급여 출력
SELECT DEPTNO, JOB, AVG(SAL) 
FROM EMP
GROUP BY DEPTNO, JOB 
ORDER BY DEPTNO, JOB;

-- GROUP BY 표현식이 아닙니다.(GROUP BY 절을 사용할 때에는 SELECT 절에서 사용할 수 있는 열이 제한됨)
-- SELECT 가능 : GROUP BY 쓰여진 열, 다중행함수
--SELECT ENAME, AVG(SAL) 
--FROM EMP
--GROUP BY DEPTNO;


-- GROUP BY ~ HAVING : 그룹바이 절에 조건을 줄 때 사용
-- 각 부서의 직책별 평균 급여(평균 급여가 2000 이상인 그룹만 조회)
SELECT
	DEPTNO,
	JOB,
	AVG(SAL)
FROM
	EMP
GROUP BY
	DEPTNO,
	JOB
HAVING
	AVG(SAL) >= 2000
ORDER BY
	DEPTNO,
	JOB;

-- ORA-00934: 그룹 함수는 허가되지 않습니다
SELECT 
	DEPTNO, JOB, AVG(SAL) 
FROM
	EMP
WHERE 
	;


-- 부서별, 평균급여, 최고급여, 최저급여, 사원 수 출력
-- 평균급여 출력시 소수점을 제외하고 출력
SELECT
	DEPTNO,
	FLOOR(AVG(SAL)),
	MAX(SAL),
	MIN(SAL),
	COUNT(DEPTNO)
FROM
	EMP
GROUP BY
	DEPTNO
ORDER BY
	DEPTNO;



-- 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력
SELECT
	JOB,
	COUNT(*)
FROM
	EMP
GROUP BY
	JOB
HAVING
	COUNT(*) >= 3; 


-- 사원들의 입사년도를 기준으로 부서별로 몇 명의 입사인원이 있는지 출력
-- 1987 20 2(1987년도 20번 부서에 2명 입사)
SELECT
	TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
	DEPTNO,
	COUNT(*) AS CNT
FROM
	EMP
GROUP BY
	TO_CHAR(HIREDATE, 'YYYY') ,
	DEPTNO
ORDER BY
	HIRE_YEAR,
	DEPTNO;



-- JOIN(조인) : 두 개이상의 테이블을 연결하여 하나의 테이블처럼 출력
-- 내부조인
-- 	 등가조인(*) : 테이블 연결 후 출력 행을 각 테이블의 특정 열에 일치한 데이터를 기준으로 선정
--   비등가조인
-- 외부조인(OUTER JOIN)
--  왼쪽외부조인(LEFT OUTER JOIN) : 오른쪽 테이블에 + 기호
--  오른쪽외부조인(RIGHT OUTER JOIN) : 왼쪽 테이블에 +기호
--  전체외부조인(FULL OUTER JOIN) : X

--SELECT * FROM EMP, DEPT;

-- 1) 내부조인
-- 등가조인 : EMP 테이블의 DEPTNO와 DEPT 테이블의 DEPTNO 가 일치 시 연결

-- 열의 정의가 애매합니다(조인 시 동일한 필드명을 가지고 있을 때)
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC 
FROM EMP e ,DEPT d
WHERE E.DEPTNO = D.DEPTNO;


-- + SAL 3000 이상인 사원 조회
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC 
FROM EMP e ,DEPT d
WHERE E.SAL >= 3000;

-- 비등가조인 : 등가조인 이외의 방식
-- EMP / SALGRADE
SELECT *
FROM EMP e , SALGRADE s 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- 자체조인
-- MGR 의 이름 조회
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP e1, EMP e2
WHERE E1.MGR = E2.EMPNO;

-- 외부조인
-- LEFT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP e1, EMP e2
WHERE E1.MGR = E2.EMPNO(+);

-- RIGHT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP e1, EMP e2
WHERE E1.MGR(+) = E2.EMPNO;

-- 쿼리문 변화
-- 내부조인 : JOIN ~ ON
-- 외부조인 : (LEFT) OUTER JOIN ~ ON / RIGHT OUTER JOIN ~ ON

SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC 
FROM EMP e JOIN DEPT d
ON E.DEPTNO = D.DEPTNO
WHERE E.SAL >= 3000;


SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP e1 LEFT OUTER JOIN EMP e2
ON E1.MGR = E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP e1 RIGHT OUTER JOIN EMP e2
ON E1.MGR = E2.EMPNO;

-- TABLE 3개 조인
--SELECT *
--FROM EMP E1 JOIN EMP E2 ON E1.MGR = E2.EMPNO JOIN EMP E3 ON E1.MGR = E3.EMPNO;

-- 각 부서별 평균급여, 최대급여, 최소급여, 사원수를 조회
-- 부서번호, 부서명, 평균급여(AVG_SAL), 최대급여(MAX_SAL), 최소급여(MIN_SAL), 사원수(CNT)
SELECT
	E.DEPTNO,
	D.DNAME,
	AVG(E.SAL) AS AVG_SAL,
	MAX(E.SAL) AS MAX_SAL,
	MIN(E.SAL) AS MIN_SAL,
	COUNT(*) AS CNT
FROM EMP e JOIN DEPT d ON E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME 
ORDER BY E.DEPTNO;

-- 모든 부서정보와 사원 정보를 조회
-- 부서번호, 부서명, 사원번호, 사원명, 직무(JOB), 급여
SELECT D.DEPTNO, D.DNAME ,E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM DEPT d LEFT OUTER JOIN EMP e ON D.DEPTNO = E.DEPTNO
ORDER BY D.DEPTNO, E.EMPNO ;

-- 서브쿼리 : 쿼리문 안에 또 다른 쿼리문(SELECT,UPDATE,DELETE,INSERT)이 포함
--SELECT (SELECT FROM WHERE)
--FROM
--WHERE 

--SELECT
--FROM  (SELECT FROM WHERE)
--WHERE 

--SELECT
--FROM 
--WHERE (SELECT FROM WHERE)

-- JONES 의 월급보다 많은 월급을 받는 사원 조회
SELECT * 
FROM EMP e 
WHERE E.SAL > 2975;

SELECT
	*
FROM
	EMP e
WHERE
	E.SAL > (
	SELECT
		E2.SAL
	FROM
		EMP e2
	WHERE
		ENAME = 'JONES')

-- 실행 결과가가 하나인 단일행 서브쿼리
-- >, >=, =, <, <=, <>, !=, ^=

-- KING 보다 빠른 입사자 조회
SELECT
	*
FROM
	EMP e
WHERE
	E.HIREDATE < '1981-11-17';


SELECT
	*
FROM
	EMP e
WHERE
	E.HIREDATE < (
	SELECT
		E2.HIREDATE
	FROM
		EMP e2
	WHERE
		ENAME = 'KING');

-- ALLEN 보다 추가수당 많이 받는 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	E.COMM > (
	SELECT
		E2.COMM
	FROM
		EMP e2
	WHERE
		ENAME = 'ALLEN')

-- 20번 부서에 근무하는 사원 중 전체 사원의 평균 급여보다 높은 급여를 받은 사원 조회
SELECT *
FROM EMP E 
WHERE E.DEPTNO = 20 AND E.SAL > (
	SELECT
		AVG(E2.SAL)
	FROM
		EMP e2);

-- 20번 부서에 근무하는 사원 중 전체 사원의 평균 급여보다 높은 급여를 받은 사원 조회 + 부서명, 부서위치
SELECT
	E.*,
	D.DNAME,
	D.LOC
FROM
	EMP E
JOIN DEPT d ON
	E.DEPTNO = D.DEPTNO
WHERE
	E.DEPTNO = 20
	AND E.SAL > (
	SELECT
		AVG(E2.SAL)
	FROM
		EMP e2);

-- 실행 결과가 여러 개인 다중행 서브쿼리
-- IN : 메인 쿼리의 데이터 가 서브 쿼리의 결과 중 하나라도 일치한 데이터가 있다면 TRUE
-- ANY(SOME) : 메인 쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE
-- ALL : 메인 쿼리의 조건식을 서브 쿼리의 결과 모두가 만족하면 TRUE
-- EXISTS : 서브 쿼리의 결과가 존재하면(즉, 행이 1개 이상일 경우) TRUE

-- 각 부서별 최고 급여와 동일하거나 큰 급여를 받는 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	E.SAL IN (
	SELECT
		MAX(E2.SAL)
	FROM
		EMP e2
	GROUP BY
		E2.DEPTNO);

-- IN == =ANY	
SELECT
	*
FROM
	EMP e
WHERE
	E.SAL = ANY (
	SELECT
		MAX(E2.SAL)
	FROM
		EMP e2
	GROUP BY
		E2.DEPTNO);

SELECT
	*
FROM
	EMP e
WHERE
	E.SAL = SOME (
	SELECT
		MAX(E2.SAL)
	FROM
		EMP e2
	GROUP BY
		E2.DEPTNO);
	
	
	
-- 30 번부서의 급여보다 적은 급여를 받는 사원 조회
-- 30 번 부서의 최대급여보다 적은 사원 조회하는 결과와 같아짐
SELECT
	*
FROM
	EMP e
WHERE
	E.SAL < ANY (
	SELECT
		E2.SAL
	FROM
		EMP e2
	WHERE 
		E2.DEPTNO = 30)
ORDER BY E.SAL, E.EMPNO;

-- 단일행 서브쿼리로 할때
SELECT
	*
FROM
	EMP e
WHERE
	E.SAL < (
	SELECT
		MAX(E2.SAL)
	FROM
		EMP e2
	WHERE
		E2.DEPTNO = 30)
ORDER BY E.SAL, E.EMPNO;

-- 30 번부서의 급여보다 많은 급여를 받는 사원 조회
-- 30 번 부서의 최대급여보다 많은 사원 조회하는 결과와 같아짐
-- 다중행 서브쿼리로 할때
SELECT
	*
FROM
	EMP e
WHERE
	E.SAL > ANY (
	SELECT
		E2.SAL
	FROM
		EMP e2
	WHERE
		E2.DEPTNO = 30)
ORDER BY E.SAL, E.EMPNO;
	
-- 단일행 서브쿼리로 할 때
SELECT
	*
FROM
	EMP e
WHERE
	E.SAL > (
	SELECT
		MIN(E2.SAL)
	FROM
		EMP e2
	WHERE
		E2.DEPTNO = 30)
ORDER BY E.SAL, E.EMPNO;
	
-- 부서번호가 30번인 사원들의 최소 급여보다 더 적은 사원 조회
-- ALL
SELECT
	*
FROM
	EMP e
WHERE
	E.SAL < ALL (
	SELECT
		E2.SAL
	FROM
		EMP e2
	WHERE
		E2.DEPTNO = 30)
ORDER BY E.SAL, E.EMPNO;

-- EXISTS

SELECT *
FROM EMP e 
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 10);

SELECT *
FROM EMP e 
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 50);

-- 비교할 열리 여러 개인 다중열 서브쿼리
SELECT
	*
FROM
	EMP e
WHERE
	(DEPTNO,
	SAL) IN (
	SELECT
		DEPTNO,
		MAX(SAL)
	FROM
		EMP e2
	GROUP BY
		DEPTNO);

-- FROM 절에 작성하는 서브쿼리(== 인라인뷰) 작성

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10, (SELECT * FROM DEPT) D
WHERE  E10.DEPTNO = D.DEPTNO;

-- SELECT 절에 작성하는 서브쿼리(== 스칼라 서브쿼리)
SELECT
	E.EMPNO,
	E.JOB,
	E.SAL,
	(
	SELECT
		GRADE
	FROM
		SALGRADE s
	WHERE
		E.SAL BETWEEN S.LOSAL AND S.HISAL) AS SALGRADE,
	E.DEPTNO ,
	(SELECT DNAME FROM DEPT D WHERE E.DEPTNO = D.DEPTNO) AS DNAME
FROM
	EMP e;

SELECT * FROM emp










