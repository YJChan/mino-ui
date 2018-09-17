<mino-day>
  <div class="day-wrapper {! inMonth? 'not-in-month': ''} {selected? theme: ''}" 
    onclick={() => setCalendarDate(day, month, year)}>
    {show === true? day: 'N/A'}
  </div>     
  <style>
  @media (min-width: 1025px) and (max-width: 1920px) {
    .day-wrapper{
      cursor:pointer;
      width:49px; 
      height:35px;    
      display: inline-block; 
      text-align:center;
      vertical-align:middle;
      line-height:2;
    }

    .not-in-month{
      color: #bbb;  
    }

    .active{
      background-color: #456990;
    }
  }

  @media (min-width: 768px) and (max-width: 1024px) {
    .day-wrapper{
      cursor:pointer;
      width:14%;
      height:35px;    
      display: inline-block; 
      text-align:center;
      vertical-align:middle;
      line-height:2;
    }

    .not-in-month{
      color: #bbb;  
    }

    .active{
      background-color: #456990;
    }
  }

  @media (min-width: 320px) and (max-width: 480px) { 
    .day-wrapper{
      cursor:pointer;
      width:14%;
      height:35px;    
      display: inline-block; 
      text-align:center;
      vertical-align:middle;
      line-height:2.1;
    }

    .not-in-month{
      color: #bbb;  
    }

    .active{
      background-color: #456990;
    }
  }

  .day-wrapper:hover{
    background-color:#ccc;
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
    this.week = opts.week;
    this.day = opts.day;
    this.month = opts.month;
    this.year = opts.year;
    this.inMonth = opts.inmonth;    
    this.selected = opts.init? opts.init: false;    
    this.fullDate = new Date(this.year, this.month, this.year);
    this.theme = opts.theme;

    var self = this;    

    setCalendarDate(){
      this.selected = true;
      this.update();      
      this.parent.setMonthDay({
        year: this.year,
        month: this.month,
        day: this.day
      });
    }
    
    //observable
    riot.minoDateObserver.on('selectedActive', function(day){
      if(self.day !== day.day){
        self.selected = false;
        self.update();
      }    
    });    
    
    
  </script>
</mino-day>