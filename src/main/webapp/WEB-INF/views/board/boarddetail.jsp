<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/nav.jsp"%>

<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
	<h2>글상세보기</h2>
	<br />
	<form action="/action_page.php">
		<input type="hidden" value="${board.id }">
		<div class="form-group">
			<label for="title">글제목:</label> <input type="text"
				class="form-control" placeholder="글제목을 입력하세요." id="id"
				readonly="readonly" value="${board.title }" />
		</div>
		<div class="form-group">
			<label for="content">글내용:</label>
			<textarea rows="15" class="form-control" readonly="readonly">${board.content }</textarea>
		</div>
		<a href="/board/boarddelete/${board.productId }/${board.id }"
			class="btn btn-danger" style="float: right;"> 글삭제 </a> <a
			href="/board/boardupdate/${board.id }" type="submit"
			class="btn btn-warning" style="float: right;"> 글수정 </a> <a
			href="/product/productdetail/${board.productId }" type="submit"
			class="btn btn-primary" style="float: right;"> 상품보기 </a>
	</form>
</div>

<div class="container">
	<div class="card">
		<div class="form-group">
			<div class="card-body">
				<input type="hidden" id="boardId" value="${board.id}" /> <input
					type="hidden" id="userId" value="${sessionScope.principal.id}" />
				<textarea class="form-control" rows="4" id="content"></textarea>
			</div>
			<br />
			<div class="card-footer">
				<button id="comment--save--submit" type="button" class="btn btn-primary" style="float: right;">등록</button>
			</div>
		</div>
	</div>

	<br />

	<div class="card">
		<div class="form-group">
			<div class="card-header">
				<h4 class="card-title">댓글리스트</h4>
			</div>

			<ul id="comment--items" class="list-group">

				<c:forEach var="comment" items="${comments}">
					<li id="comment--item--${comment.id}"
						class="list-group-item d-flex justify-content-between align-items-center">
						<div class="font-italic">${comment.content}</div>
						<div class="badge badge-light badge-pill ml-auto">작성자:${comment.username}</div>

						<c:if test="${comment.userId eq principal.id }">
							<button onclick="commentDelete(${comment.id})"
								class="badge badge-danger badge-pill">삭제</button>
						</c:if>
					</li>
				</c:forEach>
			</ul>

		</div>
	</div>
</div>


<script src="/js/comment.js"></script>


<%@include file="../include/footer.jsp"%>
