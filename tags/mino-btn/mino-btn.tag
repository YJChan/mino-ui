<mino-btn>
<button class="btn {class}" type={type} onclick={() => onclickEvent} onmouseover={() => this.test() }>
  {text}
</button>
<style>
.btn{
  display: inline-block;  
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  padding: 0.3rem 0.75rem;
  font-size: 0.9rem;
  line-height: 1.5;
  border-radius: 0.2rem;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.grad.light:hover{
  background-image: linear-gradient(to right top, #b5cbd3, #c0d7d9, #cde3df, #ddeee6, #eef9ed);
}

.grad.primary:hover {
  background-image: linear-gradient(to right top, #051937, #152b4c, #253f62, #355379, #456990);
}

.grad.success:hover{
  background-image: linear-gradient(to right top, #083218, #0e4723, #155e2f, #1d763b, #268e47);
}

.grad.warning:hover{
  background-image: linear-gradient(to right top, #37050e, #611825, #902d3b, #c14352, #f45b69);
}

.grad.dark:hover{
  background-image: linear-gradient(to right top, #162115, #23332c, #354643, #4a595b, #626d71);
}

.lg{
  font-size: 1.3rem;
}

.sm{
  font-size: 0.75rem;
}

.btn:hover, .btn:focus {
  text-decoration: none;
}

.btn:focus, .btn.focus {
  outline: 0;
  box-shadow: 0 0 0 0.1rem #bbb;
}

.btn.disabled, .btn:disabled {
  opacity: 0.75;
}

.btn:not(:disabled):not(.disabled) {
  cursor: pointer;
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
  this.class = opts.class;
  this.text = opts.text;
  this.type = opts.type;
  this.onclickEvent = opts.onclick;  
</script>
</mino-btn>