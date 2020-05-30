#parse("JSP File Header.jsp")
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<html>
<head><title>Generated Entities</title></head>
<body>

<h1>Generated Entities</h1>
<br/>
<f:view>
    <h:form>
        #foreach($entityInfo in ${Entities})
        <h:commandLink action="${entityInfo.listAction}" value="${entityInfo.name}"/>
        <br/>
        #end
    </h:form>
</f:view>

</body>
</html>
