<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- pageging start -->
<table>
   <tr>
      <td>
         <c:choose>
            <c:when test="${pu.pageNum!=1}">
               <a href="${ctx}/${restOfTheUrl}?pageNum=${pu.pageNum-1}" style="color:black;" >prev</a>
            </c:when>
            <c:otherwise>
               <a style="color: blue"> prev</a>
            </c:otherwise>
         </c:choose>
         <c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum}">
            <c:choose>
               <c:when test="${pu.pageNum==i}">
                  <a style="color: red">[${i}]</a>
               </c:when>
               <c:otherwise>
                  <a href="${ctx}/${restOfTheUrl}?pageNum=${i}" style="color:black;" >
                  [${i}]
                  </a>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="">
         </c:if>
         <c:choose>
            <c:when test="${pu.pageNum!=pu.totalPageCount}">
               <a href="${ctx}/${restOfTheUrl}?pageNum=${pu.pageNum+1}" style="color:black;" >
               next	
               </a>
            </c:when>
            <c:otherwise>
               <a style="color: blue">next</a>	
            </c:otherwise>
         </c:choose>
      </td>
   </tr>
</table>
<table>
   <tr>
      <td> 총페이지:${pu.totalPageCount} ; 총 게시물수 ${pu.totalRowCount }</td>
   </tr>
</table>
<!-- pageging End -->