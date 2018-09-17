<mino-day>
  <div class="day-wrapper {! inMonth? 'not-in-month': ''} {selected? 'active': ''}" 
    onclick={() => setCalendarDate(day, month, year)}>
    {show === true? day: 'N/A'}
  </div>     
  <style>
  .day-wrapper{
    cursor:pointer;
    width:35px; 
    height:35px;
    border: 0.15em solid #ddd; 
    display: inline-block; 
    text-align:center;
    vertical-align:middle;
  }

  .not-in-month{
    color: #bbb;  
  }

  .active{
    background-color: #456990;
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