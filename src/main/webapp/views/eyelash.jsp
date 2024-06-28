<%@ page import="homepage.dao.ProductDAO" %>
<%@ page import="homepage.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%
    String loginId = (String) session.getAttribute("loginId");
    ProductDAO dao = ProductDAO.getInstance();

    String sortBy = request.getParameter("sortBy");

    if (sortBy == null) {
        sortBy = "created_date";
    }

    ArrayList<Product> productList = dao.productListEyelash(sortBy);

    request.setAttribute("loginId", loginId);
    request.setAttribute("productList", productList);
%>
<jsp:include page="header.jsp"/>
<main>
    <section>
        <h2>전체</h2><br><br>
        <span>총<b style="color: #504EB3"><%=productList.size()%></b>건</span>
        <div style="text-align: right">
            <a href="${pageContext.request.contextPath}/views/eyelash.jsp?sortBy=sales">판매량순</a> |
            <a href="${pageContext.request.contextPath}/views/eyelash.jsp?sortBy=discount">할인율순</a> |
            <a href="${pageContext.request.contextPath}/views/eyelash.jsp?sortBy=priceAsc">낮은가격순</a> |
            <a href="${pageContext.request.contextPath}/views/eyelash.jsp?sortBy=price">높은가격순</a> |
            <a href="${pageContext.request.contextPath}/views/eyelash.jsp?sortBy=created_date">신상품순</a>
        </div>
        <div>
            <c:choose>
                <c:when test="${not empty productList}">
                    <table align="center">
                        <c:forEach var="p" varStatus="status" items="${productList}">
                            <c:if test="${status.index % 4 ==0}">
                                <tr>
                            </c:if>
                            <td>
                                <img src="${p.imgURL}" alt="대체사진" class="tbImg"
                                <c:if test="${loginId != null && !loginId.equals('admin')}">
                                     onclick="cart(${p.productNo})"
                                </c:if>
                                >
                                <br>
                                <span class="bold">${p.productName}</span><br>
                                <span class="discount">${p.discount}%</span>
                                <span class="price">₩${p.price}</span>
                                <span class="original">₩${p.originalPrice}</span>
                            </td>
                            <c:if test="${status.index % 4 ==3 || status.last}">
                                </tr>
                            </c:if>
                        </c:forEach>

                    </table>
                </c:when>
                <c:otherwise>
                    <h1 align="center">등록된 상품이 없습니다.</h1>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
</main>
<jsp:include page="footer.jsp"/>