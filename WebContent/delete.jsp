<%@ page pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.slg.bbs.*,java.io.*,java.util.*" %>

<%
String login = String.valueOf(session.getAttribute("login"));
if(login==null || !login.equals("true")){
	PrintWriter pout = response.getWriter();
	pout.println("please login!");
	response.sendRedirect("login.jsp");
	return;
}
//输出tomcat自动生成的session内的值
Enumeration e=session.getAttributeNames();
      String temp;
      System.out.println("下面循环输出Session所有属性及其值：");
      for (;e.hasMoreElements();){
           temp=(String)e.nextElement();
           System.out.println(temp);
           System.out.print(session.getAttribute(temp));
      }
      
      
int id = Integer.parseInt(request.getParameter("id"));
String sql = "delete from article where id = "+id;
Connection con = DB.getCon();
Statement stmt = DB.createStmt(con);
//stmt.executeUpdate(sql);
DB.close(stmt);
DB.close(con);
//response.sendRedirect("articleFlat.jsp");

%>
<script type="text/javascript">

function delyUrl(url){
	var dely = document.getElementById("time").innerHTML;	 
	if(dely>0){
		dely--;
		document.getElementById("time").innerHTML = dely;
	}else{
		window.location.href = url;
	} 
		
	setTimeout("delyUrl('"+url+"')",1000);
}
</script>
<p>删除成功！</p>
<span id="time" style="background:red">3</span>秒后不自动跳转，请点击链接

<a href="article.jsp">主题列表</a>
<script type="text/javascript">
//delyUrl("articleFlat.jsp");
</script>