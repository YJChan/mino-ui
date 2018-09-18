<mino-alert>
  <div class="alert {type === 'dismiss'? 'alert-close': ''} {type === 'auto-dismiss'? 'alert-auto': ''} {class}"
   onclick={type === 'dismiss' ? () => dismissAlert(e): ''} ><yield></yield>{message}</div>  
  <style>    
    .alert{      
      border-radius: 0.2rem;
      padding: 0.5em 0.675rem;
      position: relative;
      display: inline;    
      margin-bottom: 1rem;  
    }

    .alert-close {
      cursor: pointer;  
    }

    .alert-block{
      display:block;
    }

    .light{
      background-color: #EEF9ED;
      color: #162115;
    }

    .warning {
      background-color: #F45B69;
      color: #EEF9ED;
    }

    .success{
      background-color: #268E47;
      color: #EEF9ED;
    }

    .primary{
      background-color: #456990;
      color: #EEF9ED;
    }

    .dark{
      background-color: #162115;
      color: #EEF9ED;
    }


  </style>
  <script>  
    this.type = opts.type;
    this.message = opts.message;
    this.stay = opts.stay;
    this.class = opts.class;
    this.display = opts.display;
    var self = this;

    this.on('mount', function(){
      console.log('mounted');     
      
      if(this.type === "auto-dimiss"){
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
      console.log('dismiss alert');
      self.unmount(true);
    }
  </script>
</mino-alert>