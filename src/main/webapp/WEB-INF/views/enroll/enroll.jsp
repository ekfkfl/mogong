<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page="/WEB-INF/views/main/header.jsp" />

	<form name="insert"
		action="${pageContext.request.contextPath}/enroll/insert"
		method="post">

		<table align="center" border="1">

			<tr >
				<td colspan="2"> <b> ���͵� ���</b></td>
			</tr>

			<tr>
				<td>���͵� �ڵ�</td>
				<td><input type="text" name="studyCode"></td>
			</tr>

			<tr>
				<td>ȸ�� ���̵�</td>
				<td><input type="text" name="id"></td>
			</tr>

			<tr>
				<td>ī�װ� �ڵ�</td>
				<td><input type="text" name="category"></td>
			</tr>

			<tr>
				<td>���� �ڵ�</td>
				<td><input type="text" name="cityCode"></td>
			</tr>

			<tr>
				<td>���͵� �̸�</td>
				<td><input type="text" name="name"></td>
			</tr>

			<tr>
				<td>�����</td>
				<td><input type="text" name="writeDate"></td>
			</tr>

			<tr>
				<td>������</td>
				<td><input type="text" name="startDate"></td>
			</tr>

			<tr>
				<td>������</td>
				<td><input type="text" name="endDate"></td>
			</tr>

			<tr>
				<td>����</td>
				<td><input type="text" name="day"></td>
			</tr>

			<tr>
				<td>���۽ð�</td>
				<td><input type="text" name="startTime"></td>
			</tr>

			<tr>
				<td>����ð�</td>
				<td><input type="text" name="endTime"></td>
			</tr>

			<tr>
				<td>�ο�</td>
				<td><input type="text" name="people"></td>
			</tr>

			<tr>
				<td>����</td>
				<td><input type="text" name="area"></td>
			</tr>

			<tr>
				<td>���͵� ����</td>
				<td><input type="text" name="description"></td>
			</tr>

			<tr>
				<td>��ȸ��</td>
				<td><input type="text" name="read"></td>
			</tr>

			<tr>
				<td>���͵� ����</td>
				<td><input type="text" name="studyStatus"></td>
			</tr>

			<tr>
				<td><input type=submit value=���͵����ϱ�> <input type=reset
					value=�ٽþ���></td>
			</tr>


		</table>

	</form>


<jsp:include page="/WEB-INF/views/main/footer.jsp" />