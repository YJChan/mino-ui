<mino-alert>
  <div class="alert {type === 'dismiss'? 'alert-close': ''} {type === 'auto-dismiss'? 'alert-auto': ''} {class} {theme}"
   onclick={type === 'dismiss' ? () => dismissAlert(e): ''} ><yield></yield>{message}</div>  
  <style>    
    .alert{      
      border-radius: 0.2rem;
      padding: 0.5em 0.675rem;
      position: relative;      
      margin-bottom: 1rem;  
    }

    .alert-close {
      cursor: pointer;  
    }

    .alert-block{
      display:block;
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

  </style>
  <script>  
    this.type = opts.type !== undefined? opts.type: 'display'; //dismiss or display or auto-dismiss
    this.message = opts.message !== undefined? opts.message: ''; 
    this.stay = opts.stay !== undefined? opts.stay: ''; //stay on screen for how long
    this.class = opts.class;
    this.theme = opts.theme !== undefined? opts.theme: 'default';
    this.display = opts.display; 
    var self = this;

    this.on('mount', function(){
      console.log('mounted');     
      
      if(this.type === "auto-dismiss"){
        console.log('auto');
        this.autoDismiss();
      }

      if(this.display !== ""){
        this.root.childNodes[0].style.display = this.display;        
      }
    });      

    dismissAlert(){
      dismiss();
    }

    autoDismiss(){
      if(! isNaN(this.stay)){
        var timeout = parseInt(this.stay) * 1000;
        setInterval(dismiss, timeout);
      } 
    }

    function dismiss(){      
      self.unmount(true);
    }
  </script>
</mino-alert>