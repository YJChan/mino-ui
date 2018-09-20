<mino-form>
  <mino-alert display="inline-block" type="dismiss">
    Hello Mino
  </mino-alert>
  <form method="post" action="http://localhost/form_submit.php">
    <mino-date ref="datepicker1" day="1" month="2" year="2017" type="modal" theme="dark"></mino-date>
    <mino-btn theme="note" type="button" onclick={() => onSubmit()}>submit</mino-btn>
  </form>
  <script>        
    onSubmit(){
      var dt = this.refs.datepicker1.value;
      alert(dt);
      console.log(dt);
    }
  </script>
</mino-form>