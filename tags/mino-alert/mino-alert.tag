<mino-alert>
  <div class="alert {type === 'dismiss'? 'alert-close': ''} {type === 'auto-dismiss'? 'alert-auto': ''}"
   onclick={type === 'dismiss' ? () => dismissAlert(e): ''}>{message}</div>  
  <style>
    .alert{
      border: 1px solid #555;
      border-radius: 0.15rem;
      padding: 0.45em 0.65rem;
      position: relative;
      display: inline;
    }

    .alert-close {
      cursor: pointer;  
    }
  </style>
  <script>  
    this.type = opts.type;
    this.message = opts.message;
    this.stay = opts.stay;
    var self = this;

    this.on('mount', function(){
      console.log('mounted');     
      
      if(this.type === "auto-dimiss"){
        this.autoDismiss();
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