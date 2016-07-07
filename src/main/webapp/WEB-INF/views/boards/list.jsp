<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<script type="text/javascript">
	var bno = ${bno};	
</script>


	  <div class="content-wrapper">
        <div class="container">
        
          <div class="col-xs-12 col-sm-12">
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">${map.name }</h3>             
              </div>
              <!-- /.box-header -->
              
              <div class="box-body no-padding">
                <div class="mailbox-controls">
                  <!-- Check all button -->
                </div>
                <div class="table-responsive mailbox-messages">
                  <table class="table table-hover table-striped">
                    <thead>
                      <tr>
                        <th width="10%">글번호</th>
                        <th width="55%">제목</th>
                        <th width="10%">작성자</th>
                        <th width="15%">날짜</th>
                        <th width="10%">조회수</th>
                      </tr>
                    </thead>
                    
                    <tbody>
						<c:forEach items="${map.notice }" var="article">
							<tr>
								<td>공지</td>
								<td class="title"><a
									href='/boards/${article.bno}/${article.ano}${pageMaker.makeSearch(pageMaker.cri.page)}'>
										${article.title }</a><span class="badge">${article.replycnt}</span>
								</td>
								<td>${article.writer }</td>
								<td><fmt:formatDate pattern="yy-MM-dd HH:mm"
										value="${article.regdate }" /></td>
								<td><span class="badge">${article.hit }</span></td>
							</tr>
						</c:forEach>
						<c:forEach items="${map.list }" var="article">
							<tr>
								<td>${article.ano }</td>
								<td class="title"><a
									href='/boards/${article.bno}/${article.ano}${pageMaker.makeSearch(pageMaker.cri.page)}'>
										${article.title }</a><span class="badge">${article.replycnt}</span>
								</td>
								<td>${article.writer }</td>
								<td><fmt:formatDate pattern="yy-MM-dd HH:mm"
										value="${article.regdate }" /></td>
								<td><span class="badge">${article.hit }</span></td>
							</tr>
						</c:forEach>
					</tbody>
							
                  </table>
                  <!-- /.table -->
                </div>
                <!-- /.mail-box-messages -->
              </div>
              <!-- /.box-body -->
              
              <div class="box-footer no-padding">
                <div class="mailbox-controls">
					
					<div class="row">
						<div align="center">
							<ul class="pagination">
		
								<c:if test="${pageMaker.prev }">
									<li><a href="${bno }${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>
		
								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li	<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="${bno }${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>
		
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a href="${bno }${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
								</c:if>

							</ul>
						</div>
					</div>
					
					<div class="row">
	                  <div class="col-sm-2 col-xs-3">
	                  	<button id="write" class="btn btn-primary btn-sm">글쓰기</button>
	                  </div>
	                  
					  <div class="col-sm-offset-6 col-sm-4 col-md-offset-7 col-md-3 col-xs-9">
					  
						<select id="searchType" name="searchType">
							<option value="tcw"
								<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
								전체</option>
							<%-- <option value="n"
							<c:out value="${criteria.searchType == null?'selected':''}"/>>
							없음</option> --%>
							<option value="t"
								<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
								제목</option>
							<option value="c"
								<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
								내용</option>
							<option value="w"
								<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
								작성자</option>
							<option value="tc"
								<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
								제목 및 내용</option>
							<option value="cw"
								<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
								내용 및 작성자</option>
						</select>
						
						<div class="input-group input-group-sm">
	                		<input type="text" class="form-control" id="keywordInput" value="${cri.keyword}">
	                    	<span class="input-group-btn">
	                      		<button id="search" type="button" class="btn btn-info btn-flat">검색</button>
	                    	</span>
	             		</div>
	             		
	              	  </div>
			      </div>
					
                </div>
              </div>
            </div>
  
          </div>
        </div>
      </div>

<script type="text/javascript">
	var result = '${result}';

	if (result === 'success') {
		alert('작업이 성공적으로 진행되었습니다.');
	}else if(result ==='loginSuccess'){
		alert('로그인이 성공적으로 되었습니다.');
	}
</script>

<script type="text/javascript">
	/* 글쓰기 버튼 클릭 */
	$('#write').click(function() {
		location.href = bno + '/new';
	});
	
	/* 검색 버튼 클릭 */
	$('#search').on("click", function(event) {
		self.location = '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("#searchType option:selected").val()
						+ "&keyword=" + $('#keywordInput').val();
	});
</script>


<jsp:include page="../include/footer.jsp"></jsp:include>