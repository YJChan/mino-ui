<mino-date>
  <input type="text" ref="{rname}" onclick="{() => renderCalendar(this)}" value="{date}"/>
  <div if={render} class="{ type !== 'modal'? 'calendar': 'calendar-modal'}">
    <div class="dark title-wrapper">
      <button class="month-navigator" onclick={() => minodate.prevMonth()}>prev</button>
      <div class="month-title">{minodate.getMonthName(minodate.month)}</div>
      <button class="month-navigator" onclick={() => minodate.nextMonth()}>next</button>      
    </div>
    <div class="display-wrapper">
      <span ref="displayDate">
        {date === "" ? minodate.showDate.long : date}
      </span>
    </div>
    <div class="month-wrapper">
      <div class="week-wrapper" each={week in weeks}>
        <mino-week week={week} parentname={rname}></mino-week>        
      </div>
    </div>
  </div>
  <style>
    .calendar{
      border: 0.15em solid #ddd;
      display: inline-block;
      top: 40%;
      left: 40%;
      position: absolute;
    }

    .calendar-modal{
      border: 0.15em solid #ddd;
      box-shadow: 0px 0px 2px 2px #555;
      display: inline-block;
      top: 40%;
      left: 40%;
      position: absolute;
    }

    .title-wrapper{
      padding: 2%;
    }

    .display-wrapper{
      text-align: center;
    }

    .month-wrapper{      
      display:inline-block;
    }

    .week-wrapper{
      width: auto;
      height:auto;
      display:block;
    }

    .month-title{
      width: 61.5%;
      display: inline-block;
      text-align:center;
    }

    .month-navigator{
      width:18%;
    }

    .day-wrapper{
      cursor:pointer;
      width:35px; 
      height:35px;
      border: 0.1em solid #ddd; 
      display: inline-block; 
      text-align:center;
      vertical-align:middle;
    }

    .not-in-month{
      color: #bbb;
    }
  </style>
  <script type="text/javascript" src="./mino-date-observer.js"></script>
  <script>
    this.type = opts.type;
    this.day = opts.day !== undefined? opts.day: new Date().getDate();
    this.month = opts.month !== undefined ? opts.month: new Date().getMonth();
    this.year = opts.year !== undefined? opts.year: new Date().getFullYear();
    this.rname = opts.rname !== undefined? opts.rname: '';    
    this.date = opts.date !== undefined? opts.date: '';    
    this.format = opts.format !== undefined? opts.format : "long";
    this.daysOfMonth = 31;
    this.weeks = [];
    this.render = false;
    
    this.options = {
      weekStartDay: opts.weekStartDay === undefined? opts.weekStartDay: 'SUN',
      displayType: opts.displayType === undefined? opts.displayType: 'MONTH',
      format: opts.format !== undefined? opts.format : "long"
    };        
    
    riot.minoDateObserver = new minoDateObserver();
    var self = this;

    //weekday object
    const weekDay = function(){
      this.day = 0;
      this.month = 0;
      this.year = 1900;
      this.weekDay = 1;
      this.show = false;
      this.inMonth = true;
      this.init = false;
      this.setWeekDay = function(weekDay) {
        this.weekDay = weekDay;
      };
      this.setDate = function(day, month, year){
        this.day = day;        
        this.month = month;
        this.year = year;
      };
      this.setVisibility = function(show){
        this.show = show;
      };
      this.setInMonth = function(inMonth){
        this.inMonth = inMonth;
      };
      this.setInit = function(init){
        this.init = init;
      }
    };

    //before mount, compute the calendar view
    this.on('before-mount', function(){
      this.initMinoDate();
      this.computeCalendar();
    });

    this.on('mount', function(){
      // set date according to date format
      if(this.date === ""){
        this.minodate.setSelected(this.minodate.day, this.minodate.month, this.minodate.year);
      }else{
        var tmpDateObj = new Date(this.date);        
        this.minodate.setSelected(tmpDateObj.getDate(), tmpDateObj.getMonth(), tmpDateObj.getFullYear());        
      }
      
    });    

    this.on('update', function(){
      this.computeCalendar();       
    });
    
    initMinoDate(){
      var initDateType = 0;
      if(this.date !== ""){
        initDateType = 1;
      }
      this.minodate.init(this.day, this.month, this.year, this.options, initDateType, this.date);
    }
    
    renderCalendar(){      
      if(this.render){
        this.render = false;
      }else{
        this.render = true;        
      }
      this.update();
    }
    
    computeCalendar(){
      this.weeks = [];
      var visible = false;
      var dayCount = 0;
      var lastMthDayCount = 0;
      var nextMonthCount = 0;
      var firstDayFound = false;
      var lastDayFound = false;
      var lastMonthDayInWeek1 = this.minodate.getLastMonthRemainingDay();
      var dteObj = new Date(this.minodate.year, this.minodate.month - 1, lastMonthDayInWeek1);
      var day = 1;
      if(this.minodate.selectedDate !== null){
        day = this.minodate.selectedDate.getDate();
      }else{
        day = this.minodate.day;
      }
      lastMthDayCount = dteObj.getDate();
      //var weeksCount = this.minodate.getWeekCount();
      var weeksCount = 6;
      for(var w = 1; w <= weeksCount; w++){
        var week = [];
        for(var n = 0; n < 7; n++){                
          if(w === 1){
            if(n === this.minodate.getFirstDayOfTheMonth()){
              visible = true;
              firstDayFound = true;
            }
          }
          if(firstDayFound){
            dayCount++;          
            var wd = new weekDay();          
            if(dayCount <= this.minodate.getDaysOfMonth()){            
              wd.setVisibility(visible);          
              wd.setDate(dayCount, this.minodate.month, this.minodate.year);
              if(day === dayCount){
                wd.setInit(true);
              }
              week.push(wd);
            }else{
              lastDayFound = true;              
            }
          }else{
            lastMthDayCount++;          
            var wd = new weekDay();                      
            wd.setDate(lastMthDayCount, this.minodate.month - 1 , this.minodate.year);
            wd.setVisibility(true);
            wd.setInMonth(false);
            week.push(wd);            
          }

          if(lastDayFound){
            nextMonthCount++;
            var wd = new weekDay();                      
            wd.setVisibility(true);
            wd.setInMonth(false);
            wd.setDate(nextMonthCount, this.minodate.month + 1, this.minodate.year);
            week.push(wd); 
          }
        }
        this.weeks.push(week);
      }
      //console.log(this.weeks);
    }
    
    setSelectedDate(dtObj){
      this.minodate.setSelected(dtObj.day, dtObj.month, dtObj.year);
      this.renderCalendar();      
    }
    
    this.minodate = {
      day : new Date().getDate(),
      month: new Date().getMonth(),
      year: new Date().getFullYear(),
      todayDate: new Date(),
      dte: null,
      weekStartDay: 0,
      displayType: 'MONTH',
      daysOfMonth: 31,
      lastMthRemaiDays: 0,
      nextMonthBeginDay: 1,
      selectedDate : null,
      showDate: {
        iso: "",
        short: "",
        long: ""
      },
      format: "long",
      init: function(day, month, year, options, initDateType, date=null){
        this.day = day;
        this.month = month;
        this.year = year;
        this.todayDate = new Date();
        if(initDateType === 1){
          this.dte = new Date(date);
        }else{
          this.dte = new Date(year, month, day);       
        }
        this.weekStartDay = options.weekStartDay;
        this.displayType = options.displayType;
        this.daysOfMonth = this.dte.getDate();
        this.selectedDate = null;
        this.format = options.format;        
      },
      getDate: function(format){
        if(format === "iso"){
          return this.formatDate(this.todayDate, "iso");
        } else if (format === "short") {
          return this.formatDate(this.todayDate, "short");
        }else{        
          return this.formatDate(this.todayDate, "long");
        }
      },
      setDate: function(day, month, year){
        this.day = day;
        this.month = month;
        this.year = year;   
        this.dte = new Date(year, month, day); 
      },
      setSelected: function(day, month, year){
        this.selectedDate = new Date(year, month, day);
        this.day = day;
        this.month = month;
        this.year = year;         
        this.showDate.iso = this.formatDate(this.selectedDate, "iso");
        this.showDate.short = this.formatDate(this.selectedDate, "short");
        this.showDate.long = this.formatDate(this.selectedDate, "long");
        self.update();
        if(self.refs.displayDate !== undefined){
          self.refs.displayDate.innerHTML = this.showDate.long !== ""? this.showDate.long: this.getDate();
        }
        if(self.format === "iso"){
          self.date = this.showDate.iso;
        }else if(self.format === "short"){
          self.date = this.showDate.short;
        }else{
          self.date = this.showDate.long;
        }
        self.update();
        //observable
        riot.minoDateObserver.trigger('selectedActive', {day:day});
      },
      prevMonth: function(){        
        var year = parseInt(this.year);
        var month = parseInt(this.month);
        var day = parseInt(this.day);
        
        day = 1;      
        if(this.month - 1 < 0){
          month = 11;
          year = parseInt(this.year) - 1;
        }else{
          month = parseInt(this.month) - 1;
          year = parseInt(this.year);
        }
        this.setDate(1, month, year);
        if(this.selectedDate !== null){
          this.setSelected(this.selectedDate.getDate(), month, year);
        }        
        self.update();
      },
      nextMonth: function(){        
        var year = parseInt(this.year);
        var month = parseInt(this.month);
        var day = parseInt(this.day);

        day = 1;
        if(month + 1 > 11){
          month = 0;
          year = parseInt(this.year) + 1;
        }else{
          month = parseInt(this.month) + 1;
          year = parseInt(this.year);
        }
        this.setDate(day, month, year);   
        if(this.selectedDate !== null){
          this.setSelected(this.selectedDate.getDate(), month, year);     
        }
        
        self.update();
      },
      getMonthName: function(month){
        const monthNames = ["January", "February", "March", "April", "May", "June",
          "July", "August", "September", "October", "November", "December"
        ];
        return monthNames[month];
      },
      formatDate: function(date, format=null){
        var f = format === null? this.format: format;
        var month = date.getMonth();
        var day = date.getDate();
        var year = date.getFullYear();
        if(f === "iso"){
          month = parseInt(month) + 1;
          return year + "-" + month + "-" + day;
        }else if(f === "short"){
          month = parseInt(month) + 1;
          return month + "/" + day + "/" + year;
        }else{
          return this.getMonthName(month) + " " + day + " " + year;
        }
      },
      getFirstDayOfTheMonth: function(){
        var dtObj = new Date(this.year, this.month, 1);        
        return dtObj.getDay();
      },
      getDaysOfMonth: function(){
        return new Date(this.year, this.month + 1, 0).getDate();
      },
      getLastMonthRemainingDay: function(){
        var weekPos = this.getFirstDayOfTheMonth();        
        var lastMth = new Date(this.year, this.month, 0);
        this.lastMthRemaiDays = lastMth.getDate() - weekPos;
        return this.lastMthRemaiDays;
      },
      getNextMonthStartDays: function(){
        var nextMth = new Date(this.year, this.month + 1, 1);
        this.nextMonthBeginDay = nextMth.getDay() + 1;
        var weekDayRemain = 7 - this.nextMonthBeginDay;
        return weekDayRemain;
      },
      weeksCount : function() {
        var firstOfMonth = new Date(this.year, this.month, 1);
        var day = firstOfMonth.getDay() || 6;
        var day = firstOfMonth.getDay();
        day = day === 0 ? 1 : day;  //1
        if (day < 1) { day-- }
        var diff = 7 - day;
        console.log('diff: ' + diff);

        var lastOfMonth = new Date(this.year, this.month - 1, 0);
        var lastDate = lastOfMonth.getDate();
        if (lastOfMonth.getDay() === 1) {
          diff--;
        }
        console.log('lastDate: ' + lastDate);;
        var result = Math.ceil((lastDate - diff) / 7);
        console.log('result: ' + parseInt(result) + 1);
        return result + 1;
      },
      getWeekCount: function(){
        var firstOfMonth = new Date(this.year, this.month, 1);
        var day = firstOfMonth.getDay() || 6;
        day = day === 1 ? 0 : day;
        if (day) { day-- }
        var diff = 7 - day;
        var lastOfMonth = new Date(this.year, this.month + 1, 0);
        var lastDate = lastOfMonth.getDate();
        if (lastOfMonth.getDay() >= 0) {
            diff--;
        }
        var result = Math.ceil((lastDate - diff) / 7);
        return result + 1;
      },
      getWeekCount2: function(){
        var weekCount = 4;
        var firstOfMonth = new Date(this.year, this.month, 1);
        var day = firstOfMonth.getDay();
        if(day > 0){
          weekCount++;
        }
        
        var lastOfMonth = new Date(this.year, this.month, 0);
        var lastDate = lastOfMonth.getDate();
        if (lastOfMonth.getDay() >= 0 && lastOfMonth.getDay() <= 5) {
            weekCount++;
        }else if(lastOfMonth.getDay() === 6){
          weekCount--;
        }        
        return weekCount;
      }
    }
  </script>
</mino-date>