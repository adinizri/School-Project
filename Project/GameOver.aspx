<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GameOver.aspx.cs" Inherits="GameOver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

  

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!DOCTYPE html>
    <html>

       
<body>
     <asp:HiddenField ID="hdfTitle" runat="server" />
<canvas id="myCanvas" width="870" height="700"><p>Your browser does not support HTML5!</p></canvas> 
<script type="text/javascript">
    
    var canvas = document.getElementById("myCanvas");
    var context = canvas.getContext("2d");
    var title = Number(document.getElementById('<%= hdfTitle.ClientID %>').value);
    var width = canvas.getAttribute('width');
    var height = canvas.getAttribute('height');

    var mouseX;
    var mouseY;

    var bgImage = new Image();
    var GameOverImage = new Image();
    var restartImage = new Image();
   
    var shipImage = new Image();

    var backgroundY = 0;
    var speed = 1;

    var buttonX = [300];
    var buttonY = [250];
    var buttonWidth = [255];
    var buttonHeight = [100];

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
    GameOverImage.onload = function () {
        context.drawImage(GameOverImage, 40, -10);
    }
    if (title == 0) {
        GameOverImage.src = "Images/Game-Over.png";
    }
    else {
        GameOverImage.src = "Images/Win.png";
    }
    restartImage.src = "Images/Restart.png";
    restartImage.onload = function () {
        context.drawImage(restartImage, buttonX[0], buttonY[0]);
    }
   
   
    
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
        if (title == 0) {
            context.drawImage(GameOverImage, 200, 40);
        }
        else {
            context.drawImage(GameOverImage, 370, 40);
        }
        context.drawImage(restartImage, buttonX[0], buttonY[0]);
       
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
        
        if (mouseX > (width - buttonX[0]) && mouseX < (width - buttonX[0]) + buttonWidth[0] && (mouseY > (180 + buttonY[0]) && mouseY < (200 + buttonY[0]) + buttonHeight[0])) {
               
                    shipVisible = true;
                    shipX[0] = buttonX[0] - (shipWidth / 2) - 2;
                    shipY[0] = buttonY[0] + 2;
                    shipX[1] = buttonX[0] + buttonWidth[0] + (shipWidth / 2);
                    shipY[1] = buttonY[0] + 2;
                
            } else {
                shipVisible = false;
            }
        
    }
    function checkClick(mouseEvent) {
        if (mouseX > (1000 - buttonX[0]) && mouseX < (1000 - buttonX[0]) + buttonWidth[0]) {
            if (mouseY > (200 + buttonY[0]) && mouseY < (200 + buttonY[0]) + buttonHeight[0]) {

                location.replace("Game.aspx")

            }
        }
       
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

