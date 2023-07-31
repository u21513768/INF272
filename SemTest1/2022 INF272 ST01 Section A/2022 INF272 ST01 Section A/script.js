window.addEventListener("load", function () {



    
    

});

var count = 0;

//create the function to play the game with feedback
function play() {

    var num = Math.floor(Math.random() * 3);

    const element = document.getElementById(num);
    switch(num) 
    {
        case 0:
            element.style.backgroundColor = "lightgreen";
            break;

        case 1:
            element.style.backgroundColor = "yellow";
            break;

        case 2:
            count++;
            element.style.backgroundColor = "tomato";
            document.getElementById("message").innerHTML = "Bullseye! " + count;
            break;
    }
    

};

//create the function to reset the colours of the dartboard
function reset() {
    
    document.getElementById(0).style.backgroundColor = "darkgreen";
    document.getElementById(1).style.backgroundColor = "goldenrod";
    document.getElementById(2).style.backgroundColor = "darkred";

    document.getElementById("message").innerHTML = "";

}

