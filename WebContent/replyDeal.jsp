<%@ page language="java" contentType="text/html" pageEncoding="GB18030"%>
<%@ page import ="com.slg.bbs.*,java.sql.*" %>
<%
request.setCharacterEncoding("GBK"); //如果不加这句不能处理中文的回复
//System.out.println(request.getParameter("pid"));获取参数值后一点要检查是否合理和为空
int pid = Integer.parseInt(request.getParameter("pid"));
int rootId = Integer.parseInt(request.getParameter("rootId"));
String title = request.getParameter("title");
String cont = request.getParameter("cont");
Connection con = DB.getCon();
//设置手动提交
boolean autoCommit = con.getAutoCommit();
con.setAutoCommit(false);

String sql = "insert into article values (null,?,?,?,?,now(),?)";
PreparedStatement pstmt = DB.prepareStatement(con, sql);
pstmt.setInt(1,pid);
pstmt.setInt(2,rootId);
pstmt.setString(3,title);
pstmt.setString(4,cont);
pstmt.setInt(5,0);
pstmt.executeUpdate();
//更新旧的叶子节点的属性，不再是叶子节点
Statement stmt = DB.createStmt(con);
stmt.executeUpdate("update article set isleaf = 1 where id = "+pid);

con.commit();
con.setAutoCommit(autoCommit);
DB.close(pstmt);
DB.close(con);
//response.sendRedirect("article.jsp");
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
<span id="time" style="background:red">3</span>秒后不自动跳转，请点击链接

<a href="article.jsp">主题列表</a>
<script type="text/javascript">
delyUrl("article.jsp");
</script>