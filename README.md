# mino-ui
A minimalist ui components built using riot.js

I like the ease and simple of riot.js, so I decided to create something using it. 

Mino-ui provides a list of components that web developer normally use in building web application. It embrace the simplicity of riot.js. Every tag has its own folder, you can grab it and compile yourself if you do not wish to use the whole components. It is an on-going personal project, therefore, it will continue to update with different ui components. 

If you find that Mino-ui will be helpful for your project, you are welcome to use it or even modify it as per your needs.

## As of now
1. mino-alert (Alert Message)
  ![Alert Message Sample](https://raw.githubusercontent.com/YJChan/mino-ui/master/images/mino-alert.png "sample images")
  ```javascript
    riot.mount('mino-alert', {
      type: "auto-dismiss", 
      stay: 3,  
      theme: 'note',
      message: 'Your message', //your message
      class: 'class-you-defined', //css class
      display: 'inline' //display style
    });

    /*******************************************/
      accepted opts
    /*******************************************/
    type : string
    -  'auto-dismiss', 'dismiss', 'display'
    stay: numeric
    theme: string 
    -  'light', 'dark', 'primary', 'success', 'warning', 'note', 'default'
    message: string
    class: string
    -  'css-class'
    display: html style
    -  'inline', 'inline-block'

  ```
  ```html
    <mino-alert theme="primary">
        <font style="color:white">Thanks for doing this great UI!</font>
    </mino-alert>
  ```
2. mino-btn (Button)

![Button Sample](https://github.com/YJChan/mino-ui/blob/master/images/mino-button.png?raw=true "sample images")
  ```javascript
    riot.mount('mino-btn', {
      theme: 'css-class',
      onclick:  function(){
        console.log('Hello Mino!')
      }
    });  

    /*******************************************/
    accepted opts
    /*******************************************/
    theme: string
    -  'light', 'dark', 'primary', 'success', 'warning', 'note', 'default'
    type: string
    -  'submit', 'button'    
  ```
  ```html
    <mino-btn theme="primary"></mino-btn>
  ```
3. mino-date (Datepicker)

![Datepicker Sample](https://github.com/YJChan/mino-ui/blob/master/images/mino-datepicker.png?raw=true "sample images")
![Datepicker Sample](https://github.com/YJChan/mino-ui/blob/master/images/mino-month.png?raw=true "sample images")
![Datepicker Sample](https://github.com/YJChan/mino-ui/blob/master/images/mino-years.png?raw=true "sample images")

``` javascript
    riot.mount('mino-date', {
      theme: 'dark',
      class: 'input-box',
      type: 'modal',
      day: 1,
      month: 1,
      year: 2018,
      rname: 'datepicker1',
      date: 'Jul 13 2018',
      format: 'short',
      numofyears: 10
    });
    
    /*******************************************/
    accepted opts
    /*******************************************/
    theme: string,
    -  'light', 'dark', 'primary', 'success', 'warning', 'note', 'default'
    type: string
    -  'modal'
    class: string
    -  'input-box', 'input-line'
    day,month,year: numeric (set individual day, month, year)
    date: string (will overwrite day,month,year input)
    - 'September 19 2018', '9-19-2018', '19/9/2018'
    rname: string
    - 'datepicker', 'picker, ...
    format: string
    -  'iso', 'short', 'long'
    numofyears: numeric
    -   1,2,3,4,...
```

```html
  <mino-date rname="datepicket1" day="1" month="2" year="2017" format="iso" type="modal" theme="dark"></mino-date>    
  <mino-date rname="datepicket2" date="September 19 2018" numofyears="20"  class="input-box" theme="success"></mino-date>
```

Proper document page will be created once this project has enough ui-components created.

Thanks for visiting!



