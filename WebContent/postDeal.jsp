<%@ page language="java" contentType="text/html" pageEncoding="GB18030"%>
<%@ page import ="com.slg.bbs.*,java.sql.*" %>
<% 
request.setCharacterEncoding("GBK");
String title = request.getParameter("title");
String cont  = request.getParameter("cont");
if(title.equals("")){
	// response.sendRedirect("article.jsp");
%>
<script type="text/javascript">
 alert("title is not allow viod!"); //����ʾ
  
</script>
<% 
response.sendRedirect("post.jsp");	 
}else{
Connection con = DB.getCon();
String sql = "insert into article values(null,0,1,?,?,now(),0)";
PreparedStatement pstmt = DB.prepareStatement(con, sql);
pstmt.setString(1,title);
pstmt.setString(2, cont);
pstmt.executeUpdate();

DB.close(pstmt);
DB.close(con);
%>
����ɹ���
<script type="text/javascript">
function delyUrl(url){
	var time = document.getElementById("time").innerHTML;
	if(time>0){
		time--;
		document.getElementById("time").innerHTML = time;
	}else{
		window.location.href = url;
		//response.sendRedirect("article.jsp");
	}
	setTimeout("delyUrl('"+url+"')",1000);
} 
</script>
<span id="time" style="background:red">3</span>����Զ���ת����������

<a href="article.jsp">�����б�</a>
<script type="text/javascript">
delyUrl("article.jsp");
</script>
<%}%>