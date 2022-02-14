<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <link href="${path}/resources/css/Homeinfo.css" rel="stylesheet" >
<html>
<head>

   <title>Home</title>
</head>
<jsp:include page="header.jsp" />
<body>
<div id=div_body>
<video muted autoplay  id="video" >
<source type="video/mp4" src="resources/videos/videos.mp4">
</video>
</div>

</body>
<jsp:include page="footer.jsp" />
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script>

</script>
</html>