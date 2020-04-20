

$(".sel").click(function(event){
	event.preventDefault();
	
	if($(this).data("selection")!=null){
		
		$("#page-wrapper").load($(this).data("selection")+".jsp");
    
	}
});


  