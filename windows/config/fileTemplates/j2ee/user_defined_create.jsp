#parse("JSP File Header.jsp")
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Create ${entityInfo.name}</title>
    </head>
    <body>
        <f:view>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>Create ${entityInfo.name}</h1>
            <h:form>
                <h:commandLink action="${entityInfo.listAction}" value="Cancel"/>
            </h:form>
        </f:view>
    </body>
</html>
