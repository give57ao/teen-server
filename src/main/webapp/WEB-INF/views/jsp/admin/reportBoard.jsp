<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TeenCoder 관리자 신고글 관리</title>
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
            <h1>신고글 관리</h1>
            <h2>신고된 게시글 리스트 조회 및 삭제</h2>
        </div>
        <div id="contents_detail">
            <div id="contents_wrap">
                <!-- Category -->
                <ul id="contents_category">
                    <li><a href="/teen/admin/memberList">회원 관리</a></li>
                    <li><a href="/teen/admin/noticeBoard">공지글 관리</a></li>
                    <li><a href="/teen/admin/adminBoard">게시글 관리</a></li>
                    <li><a href="/teen/admin/reportBoard" class="select">신고글 관리</a></li>
                    <li><a href="/teen/admin/reportCmtList">댓글 관리</a></li>
                </ul>
                <!-- Board -->
                <div id="board_list">
                    <!-- Title -->
                    <div id="board_list_title">
                        <h2>신고글 관리</h2>
                        <ul id="board_list_menu" class="side_menu">
                            <li><a href="?sort=recent&search=${paging.search}&keyword=${paging.keyword}">최신순</a></li>
                            <li><a href="?sort=report&search=${paging.search}&keyword=${paging.keyword}">신고순</a></li>
                        </ul>
                    </div>
                    <!-- Search -->
                    <div id="board_list_search">
                       	<select class="dropdown" id="selectBoxTest" >
                            <option value="all" id="search" selected>전체</option>
                            <option value="title" id="search">제목</option>
                            <option value="id" id="search">아이디</option>
                            <option value="nick" id="search">닉네임</option>
                        </select>
                        <div class="search">
                            <input type="text" id="keyword" onkeyup="enterkey()"  placeholder="검색">
                            <button class="btn_search" onclick="searchBoard()" ></button>
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
	                                    <td>작성자</td>
	                                    <td>작성일</td>
	                                    <td>신고</td>
	                                    <td>글 관리</td>
	                                </tr>
	                            </thead>
	                            <br>
	                            <!-- List Row -->
	                            <tbody>
	                            <c:forEach items="${reportList}" var="reportList">
	                                <!-- Row1 -->
	                                <tr class="row">
	                                   <td class="w5">${reportList.board_no}</td>
	                                   <td class="w20">${reportList.board_title}</td>
	                                   <td class="w20">${reportList.board_content}</td>
	                                   <td class="w10">${reportList.member_nick}</td>
	                                   <td class="w10"><fmt:formatDate value="${reportList.board_date}" pattern="yyyy.MM.dd"/></td>
	                                   <td class="w5">${reportList.board_report_count}</td>
	                                     <td><a href="/teen/admin/deleteReportBoard?board_no=${reportList.board_no}" onclick="return deleteReportBoard();">삭제</a></td>
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
								<li><a class="prev" href="/teen/admin/reportBoard?sort=${sort}&search=${paging.search}&keyword=${paging.keyword}&nowPage=${paging.nowPage - 1}&cntPerPage=${paging.cntPerPage}"></a></li>
							</c:if>
							<!-- 페이징 숫자가 나오는 부분 -->
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage}">
										<li><a class="select">${p}</a></li>
									</c:when>
									<c:when test="${p != paging.nowPage}">
										<li><a href="/teen/admin/reportBoard?sort=${sort}&search=${paging.search}&keyword=${paging.keyword}&nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<!-- 오른쪽 버튼 -->
							<c:if test="${paging.nowPage < paging.endPage}">
								<li><a class="next" href="/teen/admin/reportBoard?sort=${sort}&search=${paging.search}&keyword=${paging.keyword}&nowPage=${paging.nowPage + 1}&cntPerPage=${paging.cntPerPage}"></a></li>
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
	<script type="text/javascript" src="/teen/resources/js/admin/reportBoard.js"></script>
	<script type="text/javascript">
	function deleteReportBoard(){
		if(confirm("해당 게시글을 삭제하시겠습니까?")){
			alert("삭제되었습니다.");
			return true;
		} else {
			alert("잘못된 로직입니다.");
			return false;
		}
	}
	</script>
</body>
</html>