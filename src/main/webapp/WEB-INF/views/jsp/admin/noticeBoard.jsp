<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TeenCoder 관리자 공지글 관리</title>
<link rel="shortcut icon" href="/teen/resources/images/icon/icon_favicon.ico" type="image/x-icon"> <!-- favicon -->
<link rel="stylesheet" type="text/css" href="/teen/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/teen/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/teen/resources/css/board.css">
<link rel="stylesheet" type="text/css" href="/teen/resources/css/admin.css">
</head>
<body>
	<!-- Header -->
	<jsp:include page="../template/header.jsp" flush="false" />

    <!-- Contents -->
    <div id="contents">
        <div id="contents_title">
            <h1>공지글 관리</h1>
            <h2>공지글 리스트 조회 및 삭제</h2>
        </div>
        <div id="contents_detail">
            <div id="contents_wrap">
                <!-- Category -->
                <ul id="contents_category">
                	<li><a href="/teen/admin/memberList">회원 관리</a></li>
                    <li><a href="/teen/admin/noticeBoard" class="select">공지글 관리</a></li>
                    <li><a href="/teen/admin/adminBoard">게시글 관리</a></li>
                    <li><a href="/teen/admin/reportBoard">신고글 관리</a></li>
                    <li><a href="/teen/admin/reportCmtList">댓글 관리</a></li>
                </ul>
                <!-- Board -->
                <div id="board_list">
                    <!-- Title -->
                    <div id="board_list_title" class="admin_board_list_title">
                        <h2>공지글 관리</h2>
                        <ul id="board_list_menu" class="side_menu">
                            <li><a href="/teen/admin/noticeBoardWrite" class="btn_com btn_notice">공지글 작성</a></li>
                        </ul>
                    </div>
                    <!-- Search -->
                    <div id="board_list_search">
                        <select class="dropdown" id="selectBoxTest">
                            <option value="all" id="search" selected>전체</option>
                            <option value="title" id="search">제목</option>
                            <option value="content" id="search">내용</option>
                            <option value="nick" id="search">닉네임</option>
                        </select>
                        <div class="search">
                            <input type="text" id="keyword" onkeyup="enterkey()"  placeholder="검색">
                            <button class="btn_search" onclick="searchBoard()"></button>
                        </div>
                    </div>
                	<!-- List Row -->
                    <div id="admin_board_list">
                    	<form>
	                        <table>
	                            <thead>
	                                <tr class="row_title">
	                                    <td>번호</td>
	                                    <td>제목</td>
	                                    <td>내용</td>
	                                    <td>작성일</td>
	                                    <td>조회</td>
	                                    <td>첨부파일</td>
	                                    <td>글 관리</td>
	                                </tr>
	                            </thead>
	                            <br>
	                            <!-- List Row -->
	                            <tbody>
	                                <!-- Row1 -->
	                                <c:forEach items="${notice}" var="notice" varStatus="status">
		                                <tr class="row">
		                                   <td class="w5">${notice.noti_no}</td>
		                                   <td class="w20"><a href="/teen/board/notice/detail?noti_no=${notice.noti_no}">${notice.noti_title}</a></td>
		                                   <td class="w20">${notice.noti_content}</td>
		                                   <td class="w10"><fmt:formatDate value="${notice.noti_date}" pattern="yyyy.MM.dd"/></td>
		                                   <td class="w10">${notice.noti_hit_count}</td>
		                                   <td class="w10">${notice.noti_file_check}</td>
		                                   <td class="w10">
		                                   	    <a href="/teen/admin/noticeBoardModify?noti_no=${notice.noti_no}">수정</a> /
		                                   	    <a href="/teen/admin/noticeBoardDelete?noti_no=${notice.noti_no}" onClick="return noticeBoardDelete()">삭제</a>
	                                   	   </td>
		                                </tr>
	                                </c:forEach>
	                            </tbody>
	                        </table>
                        </form>
                    </div>
                    <!-- Pagination -->
                    <div id="board_list_pagination">
                        <ul>
                            <!-- 왼쪽 버튼 -->
							<!-- 시작페이지가 1이 아닐 때 -->
							<c:if test="${paging.nowPage != 1}">
								<li><a class="prev" href="/teen/admin/noticeBoard?sort=${sort}&search=${paging.search}&keyword=${paging.keyword}&nowPage=${paging.nowPage - 1}&cntPerPage=${paging.cntPerPage}"></a></li>
							</c:if>
							<!-- 페이징 숫자가 나오는 부분 -->
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage}">
										<li><a class="select">${p}</a></li>
									</c:when>
									<c:when test="${p != paging.nowPage}">
										<li><a href="/teen/admin/noticeBoard?sort=${sort}&search=${paging.search}&keyword=${paging.keyword}&nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<!-- 오른쪽 버튼 -->
							<c:if test="${paging.nowPage < paging.endPage}">
								<li><a class="next" href="/teen/admin/noticeBoard?sort=${sort}&search=${paging.search}&keyword=${paging.keyword}&nowPage=${paging.nowPage + 1}&cntPerPage=${paging.cntPerPage}"></a></li>
							</c:if>
						</ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
	<!-- Footer -->
	<jsp:include page="../template/footer.jsp" flush="false" />
	
	<!-- JS -->
	<script type="text/javascript" src="/teen/resources/js/admin/admin.js"></script>
	<script type="text/javascript" src="/teen/resources/js/admin/noticeBoard.js"></script>
</body>
</html>