<%@ page language="java" contentType="text/html" pageEncoding="GB18030"%>
<%@ page import ="com.slg.bbs.*,java.sql.*" %>
<%
request.setCharacterEncoding("GBK"); //���������䲻�ܴ������ĵĻظ�
//System.out.println(request.getParameter("pid"));��ȡ����ֵ��һ��Ҫ����Ƿ�����Ϊ��
int pid = Integer.parseInt(request.getParameter("pid"));
int rootId = Integer.parseInt(request.getParameter("rootId"));
String title = request.getParameter("title");
String cont = request.getParameter("cont");
Connection con = DB.getCon();
//�����ֶ��ύ
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
//���¾ɵ�Ҷ�ӽڵ�����ԣ�������Ҷ�ӽڵ�
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
<span id="time" style="background:red">3</span>����Զ���ת����������

<a href="article.jsp">�����б�</a>
<script type="text/javascript">
delyUrl("article.jsp");
</script>