<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Menu2.aspx.cs" Inherits="Menu2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
    <html>


<body>
<canvas id="myCanvas" width="870" height="700"><p>Your browser does not support HTML5!</p></canvas> 
<script type="text/javascript">
    var canvas = document.getElementById("myCanvas");
    var context = canvas.getContext("2d");

    var width = canvas.getAttribute('width');
    var height = canvas.getAttribute('height');

    var mouseX;
    var mouseY;

    var bgImage = new Image();
    var logoImage = new Image();
    var playImage = new Image();
    var instructImage = new Image();
    var settingsImage = new Image();
    var creditsImage = new Image();
    var shipImage = new Image();

    var backgroundY = 0;
    var speed = 1;

    var buttonX = [387, 310, 345, 353];
    var buttonY = [250, 290, 330, 370];
    var buttonWidth = [96, 260, 182, 160];
    var buttonHeight = [40, 40, 40, 40];

    var shipX = [0, 0];
    var shipY = [0, 0];
    var shipWidth = 35;
    var shipHeight = 40;

    var shipVisible = false;
    var shipSize = shipWidth;
    var shipRotate = 0;

    var frames = 30;
    var timerId = 0;
    var fadeId = 0;
    var time = 0.0;

    shipImage.src = "Images/MenuShip.png";
    bgImage.onload = function () {
        context.drawImage(bgImage, 0, backgroundY);
    };
    bgImage.src = "Images/gameBack3.png";
   
   
    playImage.src = "Images/play.png";
    instructImage.onload = function () {
        context.drawImage(instructImage, buttonX[1], buttonY[1]);
    }
    instructImage.src = "Images/instructions.png";
    settingsImage.onload = function () {
        context.drawImage(settingsImage, buttonX[2], buttonY[2]);
    }
    settingsImage.src = "Images/settings.png";
    creditsImage.onload = function () {
        context.drawImage(creditsImage, buttonX[3], buttonY[3]);
    }
    creditsImage.src = "Images/credits.png";

    timerId = setInterval("update()", 1000 / frames);

    canvas.addEventListener("mousemove", checkPos);
    canvas.addEventListener("mouseup", checkClick);

    function update() {
        clear();
        move();
        draw();
    }
    function clear() {
        context.clearRect(0, 0, width, height);
    }
    function move() {
        backgroundY -= speed;
        if (backgroundY == -1 * height) {
            backgroundY = 0;
        }
        if (shipSize == shipWidth) {
            shipRotate = -1;
        }
        if (shipSize == 0) {
            shipRotate = 1;
        }
        shipSize += shipRotate;
    }
    function draw() {
        context.drawImage(bgImage, 0, backgroundY);
        
        context.drawImage(playImage, buttonX[0], buttonY[0]);
        context.drawImage(instructImage, buttonX[1], buttonY[1]);
        context.drawImage(settingsImage, buttonX[2], buttonY[2]);
        context.drawImage(creditsImage, buttonX[3], buttonY[3]);
        if (shipVisible == true) {
            context.drawImage(shipImage, shipX[0] - (shipSize / 2), shipY[0], shipSize, shipHeight);
            context.drawImage(shipImage, shipX[1] - (shipSize / 2), shipY[1], shipSize, shipHeight);
        }
    }
    function checkPos(mouseEvent) {
        if (mouseEvent.pageX || mouseEvent.pageY == 0) {
            mouseX = mouseEvent.pageX - this.offsetLeft;
            mouseY = mouseEvent.pageY - this.offsetTop;
        } else if (mouseEvent.offsetX || mouseEvent.offsetY == 0) {
            mouseX = mouseEvent.offsetX;
            mouseY = mouseEvent.offsetY;
        }
        for (i = 0; i < buttonX.length; i++) {
            if (mouseX > (1000 - buttonX[i]) && mouseX < (1200 - buttonX[i]) + buttonWidth[i]) {
                if (mouseY > (200 + buttonY[i]) && mouseY < (200 + buttonY[i]) + buttonHeight[i]) {
                    shipVisible = true;
                    shipX[0] = buttonX[i] - (shipWidth / 2) - 2;
                    shipY[0] = buttonY[i] + 2;
                    shipX[1] = buttonX[i] + buttonWidth[i] + (shipWidth / 2);
                    shipY[1] = buttonY[i] + 2;
                }
            } else {
                shipVisible = false;
            }
        }
    }
    function checkClick(mouseEvent) {
        if (mouseX > (1000 - buttonX[0]) && mouseX < (1200 - buttonX[0]) + buttonWidth[0]) {
            if (mouseY > (200 + buttonY[0]) && mouseY < (200 + buttonY[0]) + buttonHeight[0]) {
               
                location.replace("Game.aspx")
               
            }
        }
        if (mouseX > (1000 - buttonX[1]) && mouseX < (1200 - buttonX[1]) + buttonWidth[1]) {
            if (mouseY > (200 + buttonY[1]) && mouseY < (200 + buttonY[1]) + buttonHeight[1]) {

                location.replace("Rules.aspx")

            }
        }
        //for (i = 0; i < buttonX.length; i++) {
        //    if (mouseX > (1000 - buttonX[i]) && mouseX < (1200 - buttonX[i]) + buttonWidth[i]) {
        //        if (mouseY > (200 + buttonY[i]) && mouseY < (200 + buttonY[i]) + buttonHeight[i]) {
        //            fadeId = setInterval("fadeOut()", 1000 / frames);
        //            clearInterval(timerId);
        //            canvas.removeEventListener("mousemove", checkPos);
        //            canvas.removeEventListener("mouseup", checkClick);
        //        }
        //    }
        //}
    }
    function fadeOut() {
        context.fillStyle = "rgba(0,0,0, 0.2)";
        context.fillRect(0, 0, width, height);
        time += 0.1;
        if (time >= 2) {
            clearInterval(fadeId);
            time = 0;
            timerId = setInterval("update()", 1000 / frames);
            canvas.addEventListener("mousemove", checkPos);
            canvas.addEventListener("mouseup", checkClick);
        }
    }
</script> 
</body>

</html> 
</asp:Content>

