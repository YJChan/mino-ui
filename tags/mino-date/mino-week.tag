<mino-week> 
  <mino-day each={week} day={day} month={month} year={year} 
  show={show} inmonth={inMonth} init={init}></mino-day>
<style>

</style>
<script>  
  this.week = opts.week;

  setMonthDay(dtObj){
    this.parent.setSelectedDate(dtObj);
  }
</script>
</mino-week>