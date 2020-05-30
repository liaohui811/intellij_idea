#parse("JSP File Header.jsp")
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>${entityInfo.name} View</title>
    </head>
    <body>
        <f:view>
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            <h1>${entityInfo.name} View</h1>
            <h:form>
                <h:panelGrid columns="2">
                #foreach($attrInfo in ${entityInfo.attrs})
                    #if (${attrInfo.type} == "MANY_TO_MANY" || ${attrInfo.type} == "ONE_TO_MANY")

                    #else
                       <h:outputText value="${attrInfo.name}:"/>
                       #if (${attrInfo.type} == "MANY_TO_ONE" || ${attrInfo.type} == "ONE_TO_ONE")
                            <h:selectOneMenu value="${attrInfo.managedBeanReference}"  title="${attrInfo.name}">
                                <f:selectItems  value="#{${attrInfo.referencedManagedBeanName}.allEntitiesAsSelectedItems}"/>
                            </h:selectOneMenu>
                        #else
                            <h:outputText value="${attrInfo.managedBeanReference}" title="${attrInfo.name}" />
                        #end
                    #end
                #end
                </h:panelGrid>

                <h:commandButton action="${entityInfo.editAction}" value="Edit" />
                <br>
                <h:commandButton action="${entityInfo.listAction}" value="Show All"/>
                <br>
            </h:form>
        </f:view>
    </body>
</html>
