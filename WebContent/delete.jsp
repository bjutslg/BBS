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
//���tomcat�Զ����ɵ�session�ڵ�ֵ
Enumeration e=session.getAttributeNames();
      String temp;
      System.out.println("����ѭ�����Session�������Լ���ֵ��");
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
<p>ɾ���ɹ���</p>
<span id="time" style="background:red">3</span>����Զ���ת����������

<a href="article.jsp">�����б�</a>
<script type="text/javascript">
//delyUrl("articleFlat.jsp");
</script>