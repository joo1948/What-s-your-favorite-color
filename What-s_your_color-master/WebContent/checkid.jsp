<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="DB.databases"%>
<%@ page import="DB.DBvar"%>
<%@ page import="DB.DBlist"%>
<!DOCTYPE html>
<html>
<head>
<style>
.center1 {
	text-align: center;
}
</style>
<meta charset="EUC-KR">
<title>id check</title>
</head>
<body>


	<%
		request.setCharacterEncoding("euc-kr");

		databases databases = new databases();
		DBvar dv = new DBvar();
		DBlist dl = new DBlist();
		Connection con = databases.getCon();
		System.out.println("checkid���� db���� Ȯ��");
		String msg, url;

		String id = request.getParameter("id");
		System.out.println("@@@@@");
		dv.setId(id);
		int check = dl.checkid(dv);
		System.out.println("check --> " + check);

		if (check == 1) {
	%>

	<b onload="ckid(0)"><font color="red"><%=id%></font>�� �̹� �������
		���̵��Դϴ�.</b>
	<form name="checkForm" method="post" action="checkid.jsp">
		<b>�ٸ� ���̵� �����ϼ���.</b><br> <br> <input type="text" name="id">
		<input type="submit" value="ID�ߺ�Ȯ��">
	</form>
	<%
		} else {
	%>
	<div class="center1">
		<b>�Է��Ͻ�<font color="red"><%=id%></font>��<br> ����Ͻ� �� �ִ� ID�Դϴ�.
		</b><br> <br>
		<button id="close_popup">�ݱ�</button>
	</div>
	<%
		}
	%>
	
	<script>
	document.getElementById("close_popup").addEventListener("click", function() {
		opener.document.getElementById("id").value = "<%=id%>";
		opener.document.idchk = true;
		//debugger;
		// alert(idchk);
		window.close();
		
	});
		
	</script>
	<script src="signup.js" type="text/javascript"></script>
</body>
</html>