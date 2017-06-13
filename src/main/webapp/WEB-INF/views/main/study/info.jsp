<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/main/header.jsp" />
<h1> 스터디 상세보기 페이지입니다. </h1>


<form name="insert"
		action="${pageContext.request.contextPath}/enroll/insert"
		method="post">

		<table align="center" border="1">

			<tr >
				<td colspan="2"> <b> 스터디 등록</b></td>
			</tr>

			<tr>
				<td>스터디 코드</td>
				<td><input type="text" name="studyCode"></td>
			</tr>

			<tr>
				<td>회원 아이디</td>
				<td><input type="text" name="id"></td>
			</tr>

			<tr>
				<td>카테고리 코드</td>
				<td><input type="text" name="category"></td>
			</tr>

			<tr>
				<td>도시 코드</td>
				<td><input type="text" name="cityCode"></td>
			</tr>

			<tr>
				<td>스터디 이름</td>
				<td><input type="text" name="name"></td>
			</tr>

			<tr>
				<td>등록일</td>
				<td><input type="text" name="writeDate"></td>
			</tr>

			<tr>
				<td>시작일</td>
				<td><input type="text" name="startDate"></td>
			</tr>

			<tr>
				<td>종료일</td>
				<td><input type="text" name="endDate"></td>
			</tr>

			<tr>
				<td>요일</td>
				<td><input type="text" name="day"></td>
			</tr>

			<tr>
				<td>시작시간</td>
				<td><input type="text" name="startTime"></td>
			</tr>

			<tr>
				<td>종료시간</td>
				<td><input type="text" name="endTime"></td>
			</tr>

			<tr>
				<td>인원</td>
				<td><input type="text" name="people"></td>
			</tr>

			<tr>
				<td>지역</td>
				<td><input type="text" name="area"></td>
			</tr>

			<tr>
				<td>스터디 설명</td>
				<td><input type="text" name="description"></td>
			</tr>

			<tr>
				<td>조회수</td>
				<td><input type="text" name="read"></td>
			</tr>

			<tr>
				<td>스터디 상태</td>
				<td><input type="text" name="studyStatus"></td>
			</tr>

			<tr>
				<td><input type=submit value=스터디등록하기> <input type=reset
					value=다시쓰기></td>
			</tr>


		</table>

	</form>





<jsp:include page="/WEB-INF/views/main/footer.jsp" />