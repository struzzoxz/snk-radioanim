$(function(){
    function display(bool) {
        if (bool){
            $(".container").show()
        } else {
            $(".container").hide()
        } 
        
    }

    display(false)

    window.addEventListener("message", function(event){
        
        let item = event.data
        if (item.type === "ui"){
            if (item.status){
                display(true)
             }
             else {
                display(false)
             }
    }
})

    $(".stile1").click(function ()
    {$.post(`https://${GetParentResourceName()}/stile1`, JSON.stringify({})) })
    $(".stile2").click(function ()
    {$.post(`https://${GetParentResourceName()}/stile2`, JSON.stringify({})) }) 
    $(".stile3").click(function ()
    {$.post(`https://${GetParentResourceName()}/stile3`, JSON.stringify({})) })
    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post(`https://${GetParentResourceName()}/exit`, JSON.stringify({}));
            return
        }
    };
})




