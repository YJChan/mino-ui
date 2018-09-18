riot.tag2('mino-alert', '<div class="alert {type === \'dismiss\'? \'alert-close\': \'\'} {type === \'auto-dismiss\'? \'alert-auto\': \'\'} {class}" onclick="{type === \'dismiss\' ? () => dismissAlert(e): \'\'}">{message}</div>', 'mino-alert .alert,[data-is="mino-alert"] .alert{ border: 1px solid #ccc; border-radius: 0.2rem; padding: 0.5em 0.675rem; position: relative; display: inline; margin-bottom: 1rem; } mino-alert .alert-close,[data-is="mino-alert"] .alert-close{ cursor: pointer; } mino-alert .alert-block,[data-is="mino-alert"] .alert-block{ display:block; } mino-alert .light,[data-is="mino-alert"] .light{ background-color: #EEF9ED; color: #162115; } mino-alert .warning,[data-is="mino-alert"] .warning{ background-color: #F45B69; color: #EEF9ED; } mino-alert .success,[data-is="mino-alert"] .success{ background-color: #268E47; color: #EEF9ED; } mino-alert .primary,[data-is="mino-alert"] .primary{ background-color: #456990; color: #EEF9ED; } mino-alert .dark,[data-is="mino-alert"] .dark{ background-color: #162115; color: #EEF9ED; }', '', function(opts) {

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

    this.dismissAlert = function(){
      dismiss();
    }.bind(this)

    this.autoDismiss = function(){
      if(! isNaN(this.stay)){
        var timeout = parseInt(this.stay) * 1000;
        setInterval(dismiss, timeout);
      }
    }.bind(this)

    function dismiss(){
      console.log('dismiss alert');
      self.unmount(true);
    }
});
riot.tag2('mino-btn', '<button class="btn {class}" type="{type}" onclick="{() => onclickEvent}" onmouseover="{() => this.test()}"> <yield></yield> </button>', 'mino-btn .btn,[data-is="mino-btn"] .btn{ display: inline-block; text-align: center; white-space: nowrap; vertical-align: middle; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; border: 1px solid transparent; padding: 0.3rem 0.75rem; font-size: 0.9rem; line-height: 1.5; border-radius: 0.2rem; transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; } mino-btn .grad.light:hover,[data-is="mino-btn"] .grad.light:hover{ background-image: linear-gradient(to right top, #b5cbd3, #c0d7d9, #cde3df, #ddeee6, #eef9ed); } mino-btn .grad.primary:hover,[data-is="mino-btn"] .grad.primary:hover{ background-image: linear-gradient(to right top, #051937, #152b4c, #253f62, #355379, #456990); } mino-btn .grad.success:hover,[data-is="mino-btn"] .grad.success:hover{ background-image: linear-gradient(to right top, #083218, #0e4723, #155e2f, #1d763b, #268e47); } mino-btn .grad.warning:hover,[data-is="mino-btn"] .grad.warning:hover{ background-image: linear-gradient(to right top, #37050e, #611825, #902d3b, #c14352, #f45b69); } mino-btn .grad.dark:hover,[data-is="mino-btn"] .grad.dark:hover{ background-image: linear-gradient(to right top, #162115, #23332c, #354643, #4a595b, #626d71); } mino-btn .lg,[data-is="mino-btn"] .lg{ font-size: 1.3rem; } mino-btn .sm,[data-is="mino-btn"] .sm{ font-size: 0.75rem; } mino-btn .btn:hover,[data-is="mino-btn"] .btn:hover,mino-btn .btn:focus,[data-is="mino-btn"] .btn:focus{ text-decoration: none; } mino-btn .btn:focus,[data-is="mino-btn"] .btn:focus,mino-btn .btn.focus,[data-is="mino-btn"] .btn.focus{ outline: 0; box-shadow: 0 0 0 0.1rem #bbb; } mino-btn .btn.disabled,[data-is="mino-btn"] .btn.disabled,mino-btn .btn:disabled,[data-is="mino-btn"] .btn:disabled{ opacity: 0.75; } mino-btn .btn:not(:disabled):not(.disabled),[data-is="mino-btn"] .btn:not(:disabled):not(.disabled){ cursor: pointer; } mino-btn .light,[data-is="mino-btn"] .light{ background-color: #EEF9ED; color: #162115; } mino-btn .warning,[data-is="mino-btn"] .warning{ background-color: #F45B69; color: #EEF9ED; } mino-btn .success,[data-is="mino-btn"] .success{ background-color: #268E47; color: #EEF9ED; } mino-btn .primary,[data-is="mino-btn"] .primary{ background-color: #456990; color: #EEF9ED; } mino-btn .dark,[data-is="mino-btn"] .dark{ background-color: #162115; color: #EEF9ED; }', '', function(opts) {
  this.class = opts.class;
  this.text = opts.text;
  this.type = opts.type;
  this.onclickEvent = opts.onclick;
});
riot.tag2('mino-date', '<input type="text" ref="{rname}" class="cal" onclick="{() => renderCalendar()}" riot-value="{date}"><br> <div class="{(render || mRender || yRender) && type=== \'modal\' ? \'modal-back\': \'\'}"></div> <div if="{render}" class="{type !== \'modal\'? \'calendar\': \'calendar-modal\'}"> <div class="title-wrapper"> <div class="t-year-title" onclick="{() => monthYearSelection(\'year\')}"> {minodate.year} </div> <div class="month-title" onclick="{() => monthYearSelection(\'month\')}"> {minodate.getMonthName(minodate.month)} </div> <button class="month-navigator" onclick="{() => minodate.prevMonth()}">&#8249;</button> <button class="month-navigator" onclick="{() => minodate.nextMonth()}">&#8250;</button> </div> <div> <div class="week-title">S</div> <div class="week-title">M</div> <div class="week-title">T</div> <div class="week-title">W</div> <div class="week-title">T</div> <div class="week-title">F</div> <div class="week-title">S</div> </div> <div class="month-wrapper"> <div class="week-wrapper" each="{week in weeks}"> <mino-week week="{week}" parentname="{rname}" theme="{theme}"></mino-week> </div> </div> <div class="bottom-action"> <div class="action-wrapper" onclick="{() => clearSelection()}"> clear </div> <div class="action-wrapper" onclick="{() => todaySelection()}"> TODAY </div> <div class="action-wrapper" onclick="{() => renderCalendar()}"> close </div> </div> </div> <div if="{mRender}" class="{type !== \'modal\'? \'calendar\': \'calendar-modal\'}" style="overflow: hidden;"> <div class="year-title" onclick="{() => monthYearSelection(\'year\')}">{minodate.year}</div> <div style="display:flex;"> <div class="month-year-selection"> <div class="month-selection" each="{month, m in minodate.getMonthNames()}" onclick="{() => monthSelection(m)}"> {month} </div> </div> </div> <div style="text-align:center;" class="{theme} monthyear-close" onclick="{() => monthYearClose()}">&times; close</div> </div> <div if="{yRender}" class="{type !== \'modal\'? \'calendar\': \'calendar-modal\'}" style="overflow: hidden;"> <div style="display:flex;"> <div class="month-year-selection"> <div class="year-selection" each="{year, y in minodate.getYearSelection(numOfYears)}" onclick="{() => yearSelection(year)}"> {year} </div> </div> </div> <div style="text-align:center;" class="{theme} monthyear-close" onclick="{() => monthYearClose()}">&times; close</div> </div>', '@media (min-width: 320px) and (max-width: 480px) { mino-date .calendar-modal,[data-is="mino-date"] .calendar-modal{ border: 0.15em solid #b9b5b5; display: inline-block; position: absolute; background: #f3f3f3; border-radius: 0.25em; height: auto; margin: 16px; top: 10%; left: 0; width: 90%; box-shadow: 2px 2px 2px 2px #5a5858; } mino-date .calendar,[data-is="mino-date"] .calendar{ border: 0.15em solid #b9b5b5; display: inline-block; position: absolute; background: #f3f3f3; border-radius: 0.25em; height: auto; margin: -5px -25px 20px 0px; width: 80%; } mino-date .month-title,[data-is="mino-date"] .month-title{ width: 53.5%; display: inline-block; text-align:left; font-weight: 600; font-size: x-large; cursor:pointer; } mino-date .t-year-title,[data-is="mino-date"] .t-year-title{ width: 20%; display: inline-block; text-align:center; font-size: large; cursor:pointer; } mino-date .week-title,[data-is="mino-date"] .week-title{ width:11.25%; text-align: center; display:inline-block; padding:1%; } } @media (min-width: 768px) and (max-width: 1024px) { mino-date .calendar-modal,[data-is="mino-date"] .calendar-modal{ border: 0.15em solid #b9b5b5; display: inline-block; position: absolute; background: #f3f3f3; border-radius: 0.25em; height: auto; margin: 25px; top: 0; left: 6%; width: 80%; box-shadow: 2px 2px 2px 2px #5a5858; } mino-date .calendar,[data-is="mino-date"] .calendar{ border: 0.15em solid #b9b5b5; display: inline-block; position: absolute; background: #f3f3f3; border-radius: 0.25em; height: auto; margin: -5px -25px 20px 0px; width: 275px; } mino-date .month-title,[data-is="mino-date"] .month-title{ width: 55%; display: inline-block; text-align:left; font-weight: 600; font-size: x-large; cursor:pointer; } mino-date .t-year-title,[data-is="mino-date"] .t-year-title{ width: 19.5%; display: inline-block; text-align:center; font-size: large; cursor:pointer; } mino-date .week-title,[data-is="mino-date"] .week-title{ width:11.25%; text-align: center; display:inline-block; padding:1%; } } @media (min-width: 1025px) and (max-width: 1920px) { mino-date .calendar,[data-is="mino-date"] .calendar{ border: 0.15em solid #b9b5b5; display: inline-block; position: absolute; background: #f3f3f3; border-radius: 0.25em; height: auto; margin: -5px -25px 20px 0px; width: 280px; font-size: smaller; } mino-date .calendar-modal,[data-is="mino-date"] .calendar-modal{ border: 0.15em solid #b9b5b5; display: inline-block; position: absolute; background: #f3f3f3; border-radius: 0.25em; height: auto; margin: 25px; top: 10%; left: 35%; width: 350px; box-shadow: 2px 2px 2px 2px #5a5858; } mino-date .month-title,[data-is="mino-date"] .month-title{ width: 47.5%; display: inline-block; text-align:left; font-size: x-large; cursor:pointer; font-weight: 600; padding:2%; border-radius: 0.2em; } mino-date .t-year-title,[data-is="mino-date"] .t-year-title{ width: 19.5%; display: inline-block; text-align:center; font-size: large; cursor:pointer; padding:2%; border-radius: 0.2em; } mino-date .week-title,[data-is="mino-date"] .week-title{ width:11.5%; text-align: center; display:inline-block; padding:1%; } } mino-date .modal-back,[data-is="mino-date"] .modal-back{ position: fixed; z-index: 0; padding-top: 100px; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgb(0,0,0); background-color: rgba(0,0,0,0.4); } mino-date .bottom-action,[data-is="mino-date"] .bottom-action{ width: 100%; padding: 1px; } mino-date .action-wrapper,[data-is="mino-date"] .action-wrapper{ box-sizing: border-box; display: inline-block; width: 32.5%; padding: 4px; text-decoration: none; color: inherit; border: 0; background: transparent; text-align: center; cursor: pointer; border-radius: 0.15em; } mino-date .action-wrapper:hover,[data-is="mino-date"] .action-wrapper:hover{ background: #ddd; color: #161125; } mino-date input,[data-is="mino-date"] input{ display: inline; padding: 0.2rem 0.45rem; font-size: 1rem; line-height: 1.5; color: #162115; background-color: #fff; background-clip: padding-box; border: 1px solid #ced4da; border-radius: 0.2rem; transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; margin: 5px; } mino-date .title-wrapper,[data-is="mino-date"] .title-wrapper{ padding: 1%; } mino-date ::-webkit-scrollbar,[data-is="mino-date"] ::-webkit-scrollbar{ display: none; } mino-date .month-year-selection,[data-is="mino-date"] .month-year-selection{ overflow:scroll; box-sizing: content-box; height:auto; margin:0px 15px; text-align:center; width:100%; padding: 1% display: inline-block; } mino-date .month-selection,[data-is="mino-date"] .month-selection{ height:20px; padding: 10px 15px; display: inline-block; border-radius: 0.2em; cursor: pointer; } mino-date .year-selection,[data-is="mino-date"] .year-selection{ height:20px; padding: 15px 15px; display: inline-block; border-radius: 0.2em; cursor: pointer; margin: 5px; } mino-date .t-year-title:hover,[data-is="mino-date"] .t-year-title:hover{ background-color: #ddd; } mino-date .year-selection:hover,[data-is="mino-date"] .year-selection:hover{ background-color: #ddd; } mino-date .month-title:hover,[data-is="mino-date"] .month-title:hover{ background-color: #ddd; } mino-date .month-selection:hover,[data-is="mino-date"] .month-selection:hover{ background-color: #ddd; } mino-date .year-title,[data-is="mino-date"] .year-title{ font-size: 15.5pt; text-align: center; cursor: pointer; padding: 2%; border-radius: 0.2em; } mino-date .year-title:hover,[data-is="mino-date"] .year-title:hover{ background: #ddd; } mino-date .monthyear-close,[data-is="mino-date"] .monthyear-close{ cursor: pointer } mino-date .display-wrapper,[data-is="mino-date"] .display-wrapper{ text-align: center; } mino-date .month-wrapper,[data-is="mino-date"] .month-wrapper{ display:inline-block; width: 100%; } mino-date .week-wrapper,[data-is="mino-date"] .week-wrapper{ width: 100%; height:auto; display:block; padding: 1%; } mino-date .month-navigator,[data-is="mino-date"] .month-navigator{ width:11%; border-radius: 0.2em; border: 0; font-size: 15.5pt; padding: 0px; cursor: pointer; background-color: #f3f3f3; } mino-date .month-navigator:hover,[data-is="mino-date"] .month-navigator:hover{ background: #ddd; } mino-date .light,[data-is="mino-date"] .light{ background-color: #EEF9ED; color: #162115; } mino-date .warning,[data-is="mino-date"] .warning{ background-color: #F45B69; color: #EEF9ED; } mino-date .success,[data-is="mino-date"] .success{ background-color: #268E47; color: #EEF9ED; } mino-date .primary,[data-is="mino-date"] .primary{ background-color: #456990; color: #EEF9ED; } mino-date .dark,[data-is="mino-date"] .dark{ background-color: #162115; color: #EEF9ED; } mino-date .cal,[data-is="mino-date"] .cal{ background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/PjwhRE9DVFlQRSBzdmcgIFBVQkxJQyAnLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4nICAnaHR0cDovL3d3dy53My5vcmcvR3JhcGhpY3MvU1ZHLzEuMS9EVEQvc3ZnMTEuZHRkJz48c3ZnIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDgwIDgwIiBoZWlnaHQ9IjgwcHgiIGlkPSJJY29ucyIgdmVyc2lvbj0iMS4xIiB2aWV3Qm94PSIwIDAgODAgODAiIHdpZHRoPSI4MHB4IiB4bWw6c3BhY2U9InByZXNlcnZlIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj48Zz48cGF0aCBkPSJNNjEsMjAuMDQ3aC02VjE1aC01djUuMDQ3SDMwVjE1aC01djUuMDQ3aC01LjkxOWMtMi4yMDksMC00LDEuNzkxLTQsNFY2MWMwLDIuMjA5LDEuNzkxLDQsNCw0SDYxYzIuMjA5LDAsNC0xLjc5MSw0LTQgICBWMjQuMDQ3QzY1LDIxLjgzOCw2My4yMDksMjAuMDQ3LDYxLDIwLjA0N3ogTTYwLDYwSDIwVjM1aDQwVjYweiBNNjAsMzBIMjB2LTVoNDBWMzB6Ii8+PHJlY3QgaGVpZ2h0PSI1IiB3aWR0aD0iNSIgeD0iMzgiIHk9IjQwIi8+PHJlY3QgaGVpZ2h0PSI1IiB3aWR0aD0iNSIgeD0iNDgiIHk9IjQwIi8+PHJlY3QgaGVpZ2h0PSI1IiB3aWR0aD0iNSIgeD0iMzgiIHk9IjUwIi8+PHJlY3QgaGVpZ2h0PSI1IiB3aWR0aD0iNSIgeD0iMjgiIHk9IjUwIi8+PC9nPjwvc3ZnPg==) no-repeat scroll 4.5px 4.5px; background-position: right; background-repeat: no-repeat; background-size: 30px; }', '', function(opts) {
var minoDateObserver = function () {
  riot.observable(this);

  this.date = {
    day: new Date().getDate(),
    month: new Date().getMonth(),
    year: new Date().getFullYear(),
    fullDate: new Date(),
    getFullDate(format){
      if(format === "short"){
        return this.fullDate.getMonth() + "/" + this.fullDate.getDate() + "/" + this.fullDate.getFullYear();
      } else if (format === "short") {
        return this.fullDate.getDate() + "-" + this.fullDate.getMonth() + "-" + this.fullDate.getFullYear();
      }else{
        return this.getMonthName(this.fullDate.getMonth()) + " " + this.fullDate.getDate() + " " + this.fullDate.getFullYear();
      }
    },
    getMonthName: function (month) {
      const monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
      ];
      return monthNames[month];
    }
  }
}

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

    this.on('before-mount', function(){
      this.initMinoDate();
      this.computeCalendar();
    });

    this.on('mount', function(){

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

    this.initMinoDate = function(){
      var initDateType = 0;
      if(this.date !== ""){
        initDateType = 1;
      }
      this.minodate.init(this.day, this.month, this.year, this.options, initDateType, this.date);
    }.bind(this)

    this.renderCalendar = function(){
      if(this.render){
        this.render = false;
      }else{
        this.render = true;
      }
      this.update();
    }.bind(this)

    this.computeCalendar = function(){
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

    }.bind(this)

    this.setSelectedDate = function(dtObj){
      this.minodate.setSelected(dtObj.day, dtObj.month, dtObj.year);
      this.renderCalendar();
    }.bind(this)

    this.monthYearSelection = function(renderOption){
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
    }.bind(this)

    this.monthSelection = function(m){
      this.minodate.month = m;
      this.mRender = false;
      this.render = true;
      this.update();
    }.bind(this)

    this.yearSelection = function(y){
      this.minodate.year = y;
      this.mRender = false;
      this.render = true;
      this.yRender = false;
      this.update();
    }.bind(this)

    this.monthYearClose = function(){
      this.mRender = false;
      this.yRender = false;
      this.render = true;
      this.update();
    }.bind(this)

    this.todaySelection = function(){
      this.minodate.setSelected(this.minodate.todayDate.getDate(), this.minodate.todayDate.getMonth(), this.minodate.todayDate.getFullYear());
      this.renderCalendar();
    }.bind(this)

    this.clearSelection = function(){
      this.date = "";
      this.renderCalendar();
    }.bind(this)

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
        day = day === 0 ? 1 : day;
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
});
riot.tag2('mino-day', '<div class="day-wrapper {! inMonth? \'not-in-month\': \'\'} {selected? theme: \'\'}" onclick="{() => setCalendarDate(day, month, year)}"> {show === true? day: \'N/A\'} </div>', '@media (min-width: 1025px) and (max-width: 1920px) { mino-day .day-wrapper,[data-is="mino-day"] .day-wrapper{ cursor:pointer; width:14%; height:32px; display: inline-block; text-align:center; vertical-align:middle; line-height:2; } mino-day .not-in-month,[data-is="mino-day"] .not-in-month{ color: #bbb; } mino-day .active,[data-is="mino-day"] .active{ background-color: #456990; border-radius: 0.25em; } } @media (min-width: 768px) and (max-width: 1024px) { mino-day .day-wrapper,[data-is="mino-day"] .day-wrapper{ cursor:pointer; width:14%; height:32px; display: inline-block; text-align:center; vertical-align:middle; line-height:2; } mino-day .not-in-month,[data-is="mino-day"] .not-in-month{ color: #bbb; } mino-day .active,[data-is="mino-day"] .active{ background-color: #456990; border-radius: 0.25em; } } @media (min-width: 320px) and (max-width: 480px) { mino-day .day-wrapper,[data-is="mino-day"] .day-wrapper{ cursor:pointer; width:14%; height:32px; display: inline-block; text-align:center; vertical-align:middle; line-height:2.1; } mino-day .not-in-month,[data-is="mino-day"] .not-in-month{ color: #bbb; } mino-day .active,[data-is="mino-day"] .active{ background-color: #456990; border-radius: 0.25em; } } mino-day .day-wrapper:hover,[data-is="mino-day"] .day-wrapper:hover{ background-color:#ccc; border-radius: 0.25em; } mino-day .light,[data-is="mino-day"] .light{ background-color: #EEF9ED; color: #162115; border-radius: 0.25em; } mino-day .warning,[data-is="mino-day"] .warning{ background-color: #F45B69; color: #EEF9ED; border-radius: 0.25em; } mino-day .success,[data-is="mino-day"] .success{ background-color: #268E47; color: #EEF9ED; border-radius: 0.25em; } mino-day .primary,[data-is="mino-day"] .primary{ background-color: #456990; color: #EEF9ED; border-radius: 0.25em; } mino-day .dark,[data-is="mino-day"] .dark{ background-color: #162115; color: #EEF9ED; border-radius: 0.25em; }', '', function(opts) {

    this.week = opts.week;
    this.day = opts.day;
    this.month = opts.month;
    this.year = opts.year;
    this.inMonth = opts.inmonth;
    this.selected = opts.init? opts.init: false;
    this.fullDate = new Date(this.year, this.month, this.year);
    this.theme = opts.theme;

    var self = this;

    this.setCalendarDate = function(){
      this.selected = true;
      this.update();
      this.parent.setMonthDay({
        year: this.year,
        month: this.month,
        day: this.day
      });
    }.bind(this)

    riot.minoDateObserver.on('selectedActive', function(day){
      if(self.day !== day.day){
        self.selected = false;
        self.update();
      }
    });

});
riot.tag2('mino-week', '<mino-day each="{week}" day="{day}" month="{month}" year="{year}" show="{show}" inmonth="{inMonth}" init="{init}" theme="{theme}"></mino-day>', '', '', function(opts) {

  this.week = opts.week;
  this.theme = opts.theme;

  this.setMonthDay = function(dtObj){
    this.parent.setSelectedDate(dtObj);
  }.bind(this)
});
riot.tag2('mino-input', '<input ref="{name}" type="text" onclick="{()=> renderCalendar()}" riot-value="{date}"> <mino-date type="{type}" name="{name}"></mino-date>', '', '', function(opts) {
    this.date = '';
    this.type = opts.type !== undefined? opts.type: '';
    this.name = opts.name !== undefined? opts.name: '';
    this.render = false;

    this.renderCalendar = function(){
      if(this.render){
        this.render = false;
        this.tags['mino-date'].render = false;
      }else{
        this.render = true;
        this.tags['mino-date'].render = true;
      }
      this.update();
    }.bind(this)

    this.setDate = function(date){
      this.date = date;
      this.update();
    }.bind(this)
});