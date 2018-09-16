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
