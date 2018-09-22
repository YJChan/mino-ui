<mino-navbar>  
  <div class="navbar {theme}">
    <mino-nav class="navbar-link navbar-link-brand" highlight="true">
        Mino      
    </mino-nav>
    <div class="navbar-link navbar-link-toggle" onclick="{() => showMenu()}">
      <mino-navburger class="{burger}"></mino-navburger>    
    </div>
    <nav class="navbar-items" ref="left_navbar">
      <mino-nav class="navbar-link" highlight="true">
          about        
      </mino-nav>
      <mino-nav class="navbar-link" highlight="true">
          documentation        
      </mino-nav>
      <mino-nav class="navbar-link" highlight="true">        
          contact        
      </mino-nav>
      <mino-nav class="navbar-link" highlight="true">test</mino-nav>
    </nav>
    <nav class="navbar-items navbar-items-right" ref="right_navbar">
      <mino-nav class="navbar-link" highlight="true">        
          search        
      </mino-nav>
      <mino-nav class="navbar-link" highlight="true">        
          <i class='bx bx-bolt'></i>        
      </mino-nav>      
    </nav>
  </div>  
  <style>
        
    :scope{
      font-family: 'Lato', Helvetica, sans-serif;      
      line-height: 1.5;
      margin: 0;
    }      

    .navbar {      
      display: flex;
      padding: 16px;
      font-family: sans-serif;      
    }

    .navbar-link {
      padding-right: 8px;
      cursor: pointer;
    }

    .navbar-items {
      display: flex;
    }

    .navbar-items-right {
      margin-left:auto;
    }

    .navbar-link-toggle {
      display: none;
    }

    @media only screen and (max-width: 768px) {
      .navbar-items,
      .navbar {
        flex-direction: column;
      }
      .navbar-items {
        display:none;
      }
      .navbar-items-right {
        margin-left:0;
      }
      .navbar-toggleshow {
        display: flex;
      }
      .navbar-link-toggle {
        align-self: flex-end;
        display: initial;
        position: absolute;
        cursor: pointer;
      } 
    }

    .bar{
      position: relative;      
      text-decoration: none;      
    }

    .bar:before {
      content: "";
      position: absolute;
      width: 100%;
      height: 2px;
      bottom: 0;
      left: 0;
      background-color: #1D2F3A;
      visibility: hidden;
      -webkit-transform: scaleX(0);
      transform: scaleX(0);
      -webkit-transition: all 0.3s ease-in-out 0s;
      transition: all 0.3s ease-in-out 0s;
    }

    .bar:hover:before {
      visibility: visible;
      -webkit-transform: scaleX(1);
      transform: scaleX(1);
    }

    .light{
      background-color: #f4f4f4;
      color: #1D2F3A;
    }

    .warning {
      background-color: #F32260;
      color: #FCF7FA;
    }

    .success{
      background-color: #1ECE80;
      color: #FCF7FA;
    }

    .primary{
      background-color: #456990;
      color: #FCF7FA;
    }

    .dark{
      background-color: #323C46;
      color: #FCF7FA;
    }

    .note{
      background-color: #FFD011;
      color: #1D2F3A;
    }

    .default{
      background-color: #989898;
      color: #FCF7FA;
    }

    .transparent{
      background-color:transparent;
      color: #1D2F3A;
    }
  </style>
  <script>
    this.theme = opts.theme !== undefined? opts.theme: 'transparent';
    this.burger = opts.burger !== undefined? opts.burger: 'dark';    

    showMenu() {
      var l_navbar = this.refs.left_navbar;      
      var r_navbar = this.refs.right_navbar;      
      if(l_navbar.className.indexOf("navbar-toggleshow") > -1){
        l_navbar.classList.remove('navbar-toggleshow');
      }else{
        l_navbar.classList.add('navbar-toggleshow');      
      }   
      if(r_navbar.className.indexOf("navbar-toggleshow") > -1){
        r_navbar.classList.remove('navbar-toggleshow');
      }else{
        r_navbar.classList.add('navbar-toggleshow');      
      }      
    }

    /**
    * init with routing
    */
    
  </script>
</mino-navbar>