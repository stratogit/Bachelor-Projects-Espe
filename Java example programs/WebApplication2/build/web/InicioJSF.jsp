<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>
<f:view>
    <f:loadBundle var="msn" basename ="tec2a.recursos.localemsg"/>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Proyecto Tercer Parcial de Tecnologias de software II</title>
        </head>
        <body background="imagenes/thespot1.jpg">
            <center> <h1><h:outputText  value="#{msn.titulo1}"/></h1> </center>
            <h:form id="loginForm">
                <center> <h:panelGrid columns="2">
                        <f:facet name="header">
                            <h:outputText value="#{msn.titulo}"/>
                        </f:facet>
                        <h:outputText value="#{msn.usuario}"/>
                        <h:inputText id="userLogin" value="#{UserBean.user}"/>

                        <h:outputText value="#{msn.contraseña}"/>
                        <h:inputText  id="password" value="#{UserBean.password}"/> 
                        <P></P>

                        <h:commandButton id="submitBtn" value=" #{msn.ingresar}" action="#{UserBean.getValidar}"/>


                    </h:panelGrid> </center>
                <P></P>
                <P></P>


                <P></P>
                <h:commandLink action="#{LocaleChanger.englishAction}">
                    <h:outputText value=" #{msn.ingles}"/>
                </h:commandLink>
                <h:commandLink action="#{LocaleChanger.spanishAction}">
                    <h:outputText value=" #{msn.español}"/>
                </h:commandLink>
            </h:form>

        </body>
    </html>
</f:view>
