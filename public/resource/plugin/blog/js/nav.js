// JavaScript Document

$(document).ready(function(){
 var myNav = $("nav a"),i;            
  for(i=0;i<myNav.length;i++){        
    var links =myNav.eq(i).attr("href"),myURL =document.URL;    
     if(myURL.indexOf(links) != -1) {       
       myNav.eq(i).parent().addClass("current");        
     }
  }
});