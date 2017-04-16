<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="model.TestEntity" %>
<%@ page import="javax.persistence.Query" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: lh
  Date: 2017/4/11
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    Configuration configuration = new Configuration().configure();
    SessionFactory sessionFactory = configuration.buildSessionFactory();
    Session session1 = sessionFactory.openSession();
    Transaction transaction = session1.beginTransaction();
    /*利用hibernate保存数据
    TestEntity t1 = new TestEntity();
    t1.setName("liu");
    t1.setGender("男");
    t1.setFavorite("吃");
    t1.setEmail("15165165");
    t1.setContent("hahha");
    session1.save(t1);*/
    /*查询数据*/
    Query query = session1.createQuery("from TestEntity ");
    java.util.List list = query.getResultList();
    transaction.commit();
    session1.close();
    sessionFactory.close();
    TestEntity test;
    Iterator it = list.iterator();
    while (it.hasNext()){
        test = (TestEntity)it.next();
        out.print(test.getName()+" "+test.getGender()+" "+test.getFavorite()+"<br>");
    }
%>
</body>
</html>
