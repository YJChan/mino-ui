<mino-date>
  <input type="text" ref="{rname}" class="cal" onclick="{() => renderCalendar()}" value="{date}"/><br/>
  <div class="{(render || mRender || yRender) && type=== 'modal' ? 'modal-back': '' }"></div>
  <div if={render} class="{ type !== 'modal'? 'calendar': 'calendar-modal'}">
    <div class="title-wrapper">      
      <div class="t-year-title" onclick="{() => monthYearSelection('year')}">
        {minodate.year}
      </div>
      <div class="month-title" onclick="{() => monthYearSelection('month')}">
        {minodate.getMonthName(minodate.month)}
      </div>      
      <button class="month-navigator" onclick="{() => minodate.prevMonth()}">&#8249;</button>
      <button class="month-navigator" onclick="{() => minodate.nextMonth()}">&#8250;</button>      
    </div>
    <div>
      <div class="week-title">S</div>
      <div class="week-title">M</div>
      <div class="week-title">T</div>
      <div class="week-title">W</div>
      <div class="week-title">T</div>
      <div class="week-title">F</div>
      <div class="week-title">S</div>
    </div>
    <div class="month-wrapper">
      <div class="week-wrapper" each={week in weeks}>
        <mino-week week={week} parentname={rname} theme={theme}></mino-week>        
      </div>
    </div>
    <div class="bottom-action">
      <div class="action-wrapper" onclick="{() => clearSelection()}">
        clear        
      </div>      
      <div class="action-wrapper" onclick="{() => todaySelection()}">
        TODAY
      </div>
      <div class="action-wrapper" onclick="{() => renderCalendar()}">        
        close
      </div>           
    </div>
  </div>
  <div if={mRender} class="{ type !== 'modal'? 'calendar': 'calendar-modal'}" style="overflow: hidden;">
    <div class="year-title" onclick="{() => monthYearSelection('year')}">{minodate.year}</div>
    <div style="display:flex;">
      <div class="month-year-selection">
        <div class="month-selection" each={month, m in minodate.getMonthNames()}
         onclick="{() => monthSelection(m)}">
          { month }
        </div>      
      </div>
      <!--  <div class="month-year-selection">
        <div style="height:25px; padding: 20px;" each={year, y in minodate.getYearSelection(numOfYears)} id="{year}">
          { year }
        </div>      
      </div>  -->
    </div>
    <div style="text-align:center;" class="{theme} monthyear-close" onclick="{() => monthYearClose()}">&times; close</div>
  </div>
  <div if={yRender} class="{ type !== 'modal'? 'calendar': 'calendar-modal'}" style="overflow: hidden;">
    <div style="display:flex;">
      <div class="month-year-selection">
        <div class="year-selection" each={year, y in minodate.getYearSelection(numOfYears)} 
         onclick="{() => yearSelection(year)}">
          { year }          
        </div>      
      </div>
    </div>
    <div style="text-align:center;" class="{theme} monthyear-close" onclick="{() => monthYearClose()}">&times; close</div>
  </div>
  <style>
    @media (min-width: 320px) and (max-width: 480px) { 
      .calendar-modal{
        border: 0.15em solid #b9b5b5;
        display: inline-block;     
        position: absolute;
        background: #f3f3f3;        
        border-radius: 0.25em;
        height: auto;
        margin: 16px;        
        top: 10%;
        left: 0;
        width: 90%;
        box-shadow: 2px 2px 2px 2px #5a5858;
      }

      .calendar{
        border: 0.15em solid #b9b5b5;
        display: inline-block;     
        position: absolute;
        background: #f3f3f3;        
        border-radius: 0.25em;
        height: auto;
        margin: -5px -25px 20px 0px;             
        width: 80%;        
      }

      .month-title{
        width: 53.5%;
        display: inline-block;
        text-align:left;
        font-weight: 600;
        font-size: x-large;
        cursor:pointer;
      }

      .t-year-title{
        width: 20%;
        display: inline-block;
        text-align:center;
        font-size: large;
        cursor:pointer;
      }

      .week-title{
        width:11.25%; 
        text-align: center;
        display:inline-block;
        padding:1%;
      }
    }
    
    @media (min-width: 768px) and (max-width: 1024px) {
      .calendar-modal{
        border: 0.15em solid #b9b5b5;
        display: inline-block;     
        position: absolute;
        background: #f3f3f3;        
        border-radius: 0.25em;
        height: auto;
        margin: 25px;        
        top: 0;
        left: 6%;
        width: 80%;
        box-shadow: 2px 2px 2px 2px #5a5858;
      }

      .calendar{
        border: 0.15em solid #b9b5b5;
        display: inline-block;     
        position: absolute;
        background: #f3f3f3;        
        border-radius: 0.25em;
        height: auto;
        margin: -5px -25px 20px 0px;                  
        width: 275px;
      }
      
      .month-title{
        width: 55%;
        display: inline-block;
        text-align:left;
        font-weight: 600;
        font-size: x-large;
        cursor:pointer;
      }

      .t-year-title{
        width: 19.5%;
        display: inline-block;
        text-align:center;
        font-size: large;
        cursor:pointer;
      }


      .week-title{
        width:11.25%; 
        text-align: center;
        display:inline-block;
        padding:1%;
      }
    }
    
    @media (min-width: 1025px) and (max-width: 1920px) {
      .calendar{
        border: 0.15em solid #b9b5b5;
        display: inline-block;     
        position: absolute;
        background: #f3f3f3;        
        border-radius: 0.25em;
        height: auto;
        margin: -5px -25px 20px 0px;                
        width: 280px;
        font-size: smaller;
      }

      .calendar-modal{
        border: 0.15em solid #b9b5b5;
        display: inline-block;     
        position: absolute;
        background: #f3f3f3;        
        border-radius: 0.25em;
        height: auto;
        margin: 25px;        
        top: 10%;
        left: 35%;
        width: 350px;
        box-shadow: 2px 2px 2px 2px #5a5858;
      }

      .month-title{
        width: 47.5%;
        display: inline-block;
        text-align:left;
        font-size: x-large;
        cursor:pointer;
        font-weight: 600;
        padding:2%;
        border-radius: 0.2em;
      }

      .t-year-title{
        width: 19.5%;
        display: inline-block;
        text-align:center;
        font-size: large;
        cursor:pointer;
        padding:2%;
        border-radius: 0.2em;
      }

      .week-title{
        width:11.5%; 
        text-align: center;
        display:inline-block;
        padding:1%;
      }
    }

    .modal-back{      
      position: fixed; 
      z-index: 0; 
      padding-top: 100px;
      left: 0;
      top: 0;
      width: 100%; 
      height: 100%;
      overflow: auto;
      background-color: rgb(0,0,0);
      background-color: rgba(0,0,0,0.4);
    }

    .bottom-action{
      width: 100%;
      padding: 1px;
    }

    .action-wrapper{
      box-sizing: border-box;
      display: inline-block;
      width: 32.5%;
      padding: 4px;
      text-decoration: none;
      color: inherit;
      border: 0;
      background: transparent;
      text-align: center;
      cursor: pointer;
      border-radius: 0.15em;
    }   

    .action-wrapper:hover{
      background: #ddd;
      color: #161125;
    }

    input{
      display: inline;      
      padding: 0.2rem 0.45rem;
      font-size: 1rem;
      line-height: 1.5;
      color: #162115;
      background-color: #fff;
      background-clip: padding-box;
      border: 1px solid #ced4da;
      border-radius: 0.2rem;
      transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
      margin: 5px;
    }
    
    .title-wrapper{
      padding: 1%;
    }

    ::-webkit-scrollbar {
      display: none;
    }
    
    .month-year-selection{          
      overflow:scroll;      
      box-sizing: content-box;
      height:auto; 
      margin:0px 15px; 
      text-align:center; 
      width:100%; 
      padding: 1%
      display: inline-block;
    }

    .month-selection{
      height:20px; 
      padding: 10px 15px;
      display: inline-block;
      border-radius: 0.2em;
      cursor: pointer;
    }

    .year-selection{
      height:20px; 
      padding: 15px 15px;
      display: inline-block;
      border-radius: 0.2em;
      cursor: pointer;
      margin: 5px;
    }

    .t-year-title:hover{
      background-color: #ddd;
    }

    .year-selection:hover{
      background-color: #ddd;
    }

    .month-title:hover{
      background-color: #ddd;
    }

    .month-selection:hover{
      background-color: #ddd;
    }

    .year-title{
      font-size: 15.5pt;
      text-align: center;
      cursor: pointer;
      padding: 2%;
      border-radius: 0.2em;      
    }

    .year-title:hover{
      background: #ddd;
    }
    
    .monthyear-close{
      cursor: pointer  
    }

    .display-wrapper{
      text-align: center;
    }

    .month-wrapper{      
      display:inline-block;
      width: 100%;
    }

    .week-wrapper{
      width: 100%;
      height:auto;
      display:block;
      padding: 1%;
    }

    .month-navigator{
      width:11%;
      border-radius: 0.2em;
      border: 0;
      font-size: 15.5pt;
      padding: 0px;
      cursor: pointer;
      background-color: #f3f3f3;
    }

    .month-navigator:hover{
      background: #ddd;
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

    .cal{
      background: 
      url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/PjwhRE9DVFlQRSBzdmcgIFBVQkxJQyAnLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4nICAnaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkJz48c3ZnIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDgwIDgwIiBoZWlnaHQ9IjgwcHgiIGlkPSJJY29ucyIgdmVyc2lvbj0iMS4xIiB2aWV3Qm94PSIwIDAgODAgODAiIHdpZHRoPSI4MHB4IiB4bWw6c3BhY2U9InByZXNlcnZlIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj48Zz48cGF0aCBkPSJNNjEsMjAuMDQ3aC02VjE1aC01djUuMDQ3SDMwVjE1aC01djUuMDQ3aC01LjkxOWMtMi4yMDksMC00LDEuNzkxLTQsNFY2MWMwLDIuMjA5LDEuNzkxLDQsNCw0SDYxYzIuMjA5LDAsNC0xLjc5MSw0LTQgICBWMjQuMDQ3QzY1LDIxLjgzOCw2My4yMDksMjAuMDQ3LDYxLDIwLjA0N3ogTTYwLDYwSDIwVjM1aDQwVjYweiBNNjAsMzBIMjB2LTVoNDBWMzB6Ii8+PHJlY3QgaGVpZ2h0PSI1IiB3aWR0aD0iNSIgeD0iMzgiIHk9IjQwIi8+PHJlY3QgaGVpZ2h0PSI1IiB3aWR0aD0iNSIgeD0iNDgiIHk9IjQwIi8+PHJlY3QgaGVpZ2h0PSI1IiB3aWR0aD0iNSIgeD0iMzgiIHk9IjUwIi8+PHJlY3QgaGVpZ2h0PSI1IiB3aWR0aD0iNSIgeD0iMjgiIHk9IjUwIi8+PC9nPjwvc3ZnPg==)
      no-repeat scroll 4.5px 4.5px;
      background-position: right;
      background-repeat: no-repeat;
      background-size: 30px;         
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
    this.mRender = false;
    this.yRender = false;
    this.theme = opts.theme !== undefined? opts.theme : "primary";
    this.options = {
      weekStartDay: opts.weekStartDay === undefined? opts.weekStartDay: 'SUN',
      displayType: opts.displayType === undefined? opts.displayType: 'MONTH',
      format: opts.format !== undefined? opts.format : "long"
    };        
    this.numOfYears = opts.numofyears !== undefined? opts.numofyears: 10;
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

    monthYearSelection(renderOption){
      if(renderOption === "month"){
        this.mRender = true;
        this.render = false;
        this.update();
      }else if(renderOption === "year"){
        this.mRender = false;
        this.render = false;
        this.yRender = true;
        this.update();
      }
    }

    monthSelection(m){
      this.minodate.month = m;
      this.mRender = false;
      this.render = true;
      this.update();
    }

    yearSelection(y){
      this.minodate.year = y;
      this.mRender = false;
      this.render = true;
      this.yRender = false;
      this.update();
    }

    monthYearClose(){
      this.mRender = false;
      this.yRender = false;
      this.render = true;
      this.update();
    }

    todaySelection(){
      this.minodate.setSelected(this.minodate.todayDate.getDate(), this.minodate.todayDate.getMonth(), this.minodate.todayDate.getFullYear());
      this.renderCalendar();
    }
    
    clearSelection(){
      this.date = "";
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
      getMonthNames: function(){
        return ["January", "February", "March", "April", "May", "June",
          "July", "August", "September", "October", "November", "December"
        ];
      },
      getYearSelection: function(num = 10){
        var starting = parseInt(this.year) - num;
        var ending = parseInt(this.year) + (num - 1);
        var yearArr = [];
        for(var n = starting; n <= ending; n++){
          yearArr.push(n);
        }
        return yearArr;
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