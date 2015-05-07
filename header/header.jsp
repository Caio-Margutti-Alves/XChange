
   <div class="header-top">

          <div class="logo">
            <a href="index.jsp"><img src="img/logo.png" alt=""/></a>
          </div>
           <div class="h_menu4"><!-- start h_menu4 -->
              <a class="toggleMenu" href="#">Menu</a>
              <ul class="nav">
                 
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
                    if(request.getServletPath().contains("register")){
                     %>
                      class="active"
                     <% 
                    }
                  %>
                  ><a href="register.jsp">Register</a></li>

                 <li 
                  <%  
                    if(request.getServletPath().contains("contact")){
                     %>
                      class="active"
                     <% 
                    }
                  %>
                  ><a href="contact.jsp">Contact</a></li>

              </ul>
             <script type="text/javascript" src="js/nav.js"></script>
          </div><!-- end h_menu4 -->
          <div class="clear"></div>
    </div><!-- end header_main4 -->

