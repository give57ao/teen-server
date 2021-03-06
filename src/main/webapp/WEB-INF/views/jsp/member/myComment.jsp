<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>TeenCoder 내가 작성한 댓글</title>
<link rel="shortcut icon" href="/teen/resources/images/icon/icon_favicon.ico" type="image/x-icon"> <!-- favicon -->
<link rel="stylesheet" type="text/css" href="/teen/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/teen/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/teen/resources/css/board.css">
<link rel="stylesheet" type="text/css" href="/teen/resources/css/myPage.css">
</head>
<body>
	<!-- Header -->
	<jsp:include page="../template/header.jsp" flush="false" />

	<!-- Contents -->
	<div id="contents">
		<div id="contents_title">
			<h1>내가 작성한 댓글</h1>
			<h2>내가 작성한 댓글 목록을 확인할 수 있습니다.</h2>
		</div>
		<div id="contents_detail">
			<div id="contents_wrap">
				<!-- Category -->
				<ul id="contents_category">
					<li><a href="/teen/member/">마이페이지</a></li>
					<li><a href="/teen/member/boardList">내가 작성한 게시글</a></li>
					<li><a href="/teen/member/commentList" class="select">내가 작성한 댓글</a></li>
					<li><a href="#">나의 포인트</a></li>
					<li><a href="/teen/follow/myFollowPage">팔로잉</a></li>
					<li><a href="/teen/scrap/scrapList">스크랩</a></li>
				</ul>
				<!-- Board -->
				<div id="board_list">
					<!-- Title -->
					<div id="board_list_title">
						<h2>내가 작성한 댓글</h2>
						<ul id="board_list_menu" class="side_menu">
							<li><a href="commentList?sort=recent&search=${paging.search}&keyword=${paging.keyword}">최신순</a></li>
							<li><a href="commentList?sort=recommend&search=${paging.search}&keyword=${paging.keyword}">추천순</a></li>
						</ul>
					</div>
					<!-- Search -->
					<div id="board_list_search">
						<select class="dropdown" id="selectBoxTest">
							<option value="" id="search" disabled>선택</option>
							<option value="all" id="search" selected>전체</option>
							<option value="content" id="search">내용</option>
							<option value="title" id="search">제목</option>
						</select>
						<div class="search">
							<input type="text" id="keyword" onkeyup="enterkey()" placeholder="검색">
							<button class="btn_search" onClick ="searchBoard()"></button>
						</div>
					</div>
					<!-- List Row -->
					<div id="board_list_row">
						<!-- Row1 -->
						<c:choose>
							<c:when test="${paging.total > 0}">
								<c:forEach items="${comment}" var="comment">
									<div class="row">
										<div class="row_info">
											<div class="row_top member">
												<h4>
													<a class="overtext" href="/teen/board/detail?board_no=${comment.board_no}"> <!-- 링크확인필요 -->
														<span class="tag_hit">[추천]</span> ${comment.board_title}
														<c:if test="${comment.board_file_check eq 'Y'}">
															<img src="/teen/resources/images/icon/icon_file.svg" class="i_file">
														</c:if>
													</a>
												</h4>
											</div>
											<span class="row_top date"><fmt:formatDate value="${comment.bcomment_date}" pattern="yyyy.MM.dd"/></span>
											<ul class="row_top number">
												<li><img src="/teen/resources/images/icon/icon_like.svg" class="i_like">${comment.bcomment_like_count}</li>
											</ul>
										</div>
										<div class="row_title">
											<h3 class="comment_contents">
												<a class="overtext" href="/teen/board/detail?board_no=${comment.board_no}"> <!-- 링크확인필요 -->
		 											${comment.bcomment_content}
												</a>
											</h3>
											<input type="button" value="삭제" class="btn_com btn_del_list" onclick="deleteComment(${comment.board_no}, ${comment.ref_step}, ${comment.ref_level })" />
											<input type="hidden" id="board_no" value="${comment.board_no }"/>
											<input type="hidden" id="bcomment_no" value="${comment.bcomment_no }"/>
											<input type="hidden" id="ref_step" value="${comment.ref_step }"/>
											<input type="hidden" id="ref_level" value="${comment.ref_level }"/>
										</div>
									</div>
									<hr>
								</c:forEach>
							</c:when>
							
							<c:otherwise>
								<p>해당 내용이 없습니다.</p>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- Pagination -->
					<div id="board_list_pagination">
						<ul>
							<!-- 왼쪽 버튼 -->
							<!-- 시작페이지가 1이 아닐 때 -->
							<c:if test="${paging.nowPage != 1}">
								<li><a class="prev" href="/teen/member/commmentList?sort=${sort}&search=${paging.search}&keyword=${paging.keyword}&nowPage=${paging.nowPage - 1}&cntPerPage=${paging.cntPerPage}"></a></li>
							</c:if>
							<!-- 페이징 숫자가 나오는 부분 -->
							<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage}">
										<li><a class="select">${p }</a></li>
									</c:when>
									<c:when test="${p != paging.nowPage}">
										<li><a href="/teen/member/commmentList?sort=${sort}&search=${paging.search}&keyword=${paging.keyword}&nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<!-- 오른쪽 버튼 -->
							<c:if test="${paging.startPage < paging.endPage}">
								<li><a class="next" href="/teen/member/commmentList?sort=${sort}&search=${paging.search}&keyword=${paging.keyword}&nowPage=${paging.nowPage + 1}&cntPerPage=${paging.cntPerPage}"></a></li>
							</c:if>
						</ul>
					</div>
				</div>
				<!-- Member Info -->
				<div id="member_info">
                    <a href="/teen/board/boardWrite" class="btn_com btn_main">게시글 작성</a>
					<!-- My Card -->
						<jsp:include page="../template/myCard.jsp" flush="false" />
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<jsp:include page="../template/footer.jsp" flush="false" />
	
	<!-- JS -->
	<script type="text/javascript" src="/teen/resources/js/member/myPage/myComment.js"></script>
	<script>
	function deleteComment(board_no, ref_step, ref_level) {
		var board_no = document.getElementById('board_no').value;
		var ref_step = document.getElementById('ref_step').value;
		var ref_level = document.getElementById('ref_level').value;
		if(confirm("해당 댓글을 삭제하시겠습니까?")) {
			alert("해당 댓글을 삭제하였습니다.");
			location.href='/teen/board/deleteComment?board_no='+board_no+'&ref_step='+ref_step+'&ref_level='+ref_level
		}else{
			return false;
		}
	}
	</script>
</body>
</html>