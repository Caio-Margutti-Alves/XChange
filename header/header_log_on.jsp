<%
    Object user = session.getAttribute("username");

%> 

   <div class="header-top">

          <div class="logo">
            <a href="index.jsp"><img src="img/logo.png" alt=""/></a>
          </div>
           <div class="h_menu4">
            <a class="toggleMenu" href="#">Menu</a>
              <ul class="nav">
                  <li><p>Hello, <% out.println(user.toString()); %></p></li><!-- start h_menu4 -->

                  <li 
                  <%  
                    if(request.getServletPath().contains("index")){
                     %>
                      class="active"
                     <% 
                    }
                  %>
                  ><a href="index.jsp">Home</a></li>
                  
                  <li 
                  <%  
                    if(request.getServletPath().contains("profile")){
                     %>
                      class="active"
                     <% 
                    }
                  %>
                  ><a href="./profile.jsp">Profile</a></li>
                 
                   <li 
                  <%  
                    if(request.getServletPath().contains("myitens")){
                     %>
                      class="active"
                     <% 
                    }
                    %>
                    ><a href="./myitens.jsp">My Itens</a></li>
                  
                  <li 
                  <%  
                    if(request.getServletPath().contains("mytransactions")){
                     %>
                      class="active"
                     <% 
                    }
                    %>
                    ><a href="./mytransactions.jsp">My Transactions</a></li>
                
                 <li><a href="./logout.jsp">Logout</a></li>
              </ul>
             <script type="text/javascript" src="js/nav.js"></script>
          </div><!-- end h_menu4 -->
          <div class="clear"></div>
    </div><!-- end header_main4 -->
