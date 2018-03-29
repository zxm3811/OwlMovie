<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--搜索框开始-->
  <div id="db-nav-movie" class="nav">
    <div class="nav-wrap">
      <div class="nav-primary">
        <div class="nav-logo"> <a href="#">MT</a> </div>
        <div class="nav-search">
          <form action="SearchMovieServlet" method="get">
            <fieldset>
              <legend>搜索：</legend>
              <label for="inp-query"></label>
              <div class="inp">
                <input id="inp-query" name="search_text" size="16px" maxlength="60" placeholder="试试输入一些东西吧..." value="${name}" autocomplete="off">
              </div>
              <div class="inp-btn">
                <input type="submit" value="搜索">
              </div>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!--搜索框结束-->