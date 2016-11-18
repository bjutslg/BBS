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
 alert("title is not allow viod!"); //不显示
  
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
发表成功！
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
<span id="time" style="background:red">3</span>秒后不自动跳转，请点击链接

<a href="article.jsp">主题列表</a>
<script type="text/javascript">
delyUrl("article.jsp");
</script>
<%}%>