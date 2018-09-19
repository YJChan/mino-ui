<mino-btn>
<button class="btn {theme}" ref={rname} type={type} onclick="{() => onclickEvent()}" 
 onmouseover="{() => onhoverEvent()}"
 ondblclick="{() => onDblClickEvent()}">
  <yield></yield> 
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
  background-color: #f4f4f4;
  color: #1D2F3A;
}

.warning {
  background-color: #F32260;
  color: #FCF7FA;
}

.success{
  background-color: #1ECE80;
  color: #FCF7FA;
}

.primary{
  background-color: #456990;
  color: #FCF7FA;
}

.dark{
  background-color: #323C46;
  color: #FCF7FA;
}

.note{
  background-color: #FFD011;
  color: #1D2F3A;
}

.default{
  background-color: #989898;
  color: #FCF7FA;
}             

</style>
<script>
  this.theme = opts.theme;  
  this.type = opts.type;
  this.rname = opts.rname;
  this.onclickEvent = opts.onclick !== undefined? opts.onclick: function(){};
  this.onhoverEvent = opts.onhover !== undefined? opts.onhover: function(){};
  this.onDblClickEvent = opts.ondblclick !== undefined? opts.ondblclick: function(){};
</script>
</mino-btn>