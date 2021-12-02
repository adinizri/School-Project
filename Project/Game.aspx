<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Game.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <head>
        <script src="https://code.createjs.com/1.0.0/soundjs.min.js"></script>
      
         <style>
        .element {
            transform: rotate();
        }
    </style>
    </head>
    <body>
        <asp:HiddenField ID="hdfPoints" runat="server"  Value=0/>
        <asp:HiddenField ID="hdfWin" runat="server"  Value=0/>
        <asp:HiddenField ID="hdfTime" runat="server"  Value=0/>
        <asp:HiddenField ID="hdfHasEnd" runat="server" Value="false" ClientIDMode="Static"/>
          <asp:HiddenField ID="hdfShip" runat="server"  />
         <asp:HiddenField ID="hdfShipH" runat="server" />
         <asp:HiddenField ID="hdfShipW" runat="server" />
        <asp:HiddenField ID="checkEnd" runat="server" Value="false" />
        <asp:HiddenField ID="HiddenField1" runat="server" Value=0/>
         <asp:HiddenField ID="hdfSpeed" runat="server" />
         <asp:HiddenField ID="hdfDamage" runat="server" />
          <asp:HiddenField ID="hdfTotalExp" runat="server" />
          <asp:HiddenField ID="hdfNeedExp" runat="server" />
          <asp:HiddenField ID="hdfLevel" runat="server" />
        <asp:HiddenField ID="hdfUpdateLevel" runat="server" />
        <asp:HiddenField ID="hdfUpdateTotalExp" runat="server" />
        <asp:HiddenField ID="hdfExpPart" runat="server" />
        <asp:Button ID="data" runat="server" Text="" OnClick="data_Click" Height="0.00000001" Width="0.00000001" BackColor="#1E4766" BorderStyle="None" />
        
        
        
       
        <center>
        <canvas id="canvas" style="background-image: url('Images/gameBack.jpg')"000">
        </canvas>
            </center>
        <script type="text/javascript">
            //התקנה ראשונית
            var canvas = document.getElementById('canvas'),
                c = canvas.getContext('2d');
            var innerWidth = 1200,
                innerHeight = 700,
                innerHeightScreenPlay=innerHeight-35;

            canvas.width = innerWidth;
            canvas.height = innerHeight;
            //createjs.Sound.registerSound("Sounds\laserShot.mp3", "Shot");
        
            //משתנים
            var score = 0, level = 0, check = 0, bossT = 25000,
                IsWin = 0, lastTime = 0, exTime = 0, Ex_images = [], Total_time = 0, ShotsCounter = 0, canShot = true,
                downShotNumberTime = 0, bulletsLimArray = [], bulletsLimIndex = 0, bulletLastTimeShot = 0, maxShots = 90;
            var ShipSpeed = parseFloat(document.getElementById('<%= hdfSpeed.ClientID %>').value);
            var damage = parseFloat(document.getElementById('<%= hdfDamage.ClientID %>').value);
            var ShipCode = document.getElementById('<%= hdfShip.ClientID %>').value;
            var ShipW = Number(document.getElementById('<%= hdfShipW.ClientID %>').value);
            var ShipH = Number(document.getElementById('<%= hdfShipH.ClientID %>').value);
            var end = false;
            var pause = false;
            var hasPause = false;
            var shoutDown = false;
            var hasshoutDown = false;
            var earnedExp = 0;//כמות הExp שהשחקן הרוויח
            var levelsUp = 0;//כמות הלבלים שהשחקן עלה
            var totalExp = Number(document.getElementById('<%= hdfTotalExp.ClientID %>').value);
            var playerLevel = Number(document.getElementById('<%= hdfLevel.ClientID %>').value);//רמת השחקן
            var needTotalExp = Number(document.getElementById('<%= hdfNeedExp.ClientID %>').value);
            var needExp = playerLevel * 1000;//כמות האקספי שהשחקן צריך להרוויח כדי לעלות רמה
            var haveExp = Number(document.getElementById('<%= hdfExpPart.ClientID %>').value);//כמות האקספי של השחקן ברמה
            Ex_images[0] = new Image();
            
           

           

            Ex_images[0].src = 'Images/Ex1.png';
            Ex_images[1] = new Image();
            Ex_images[1].src = 'Images/Ex2.png';
            Ex_images[2] = new Image();
            Ex_images[2].src = 'Images/Ex3.png';
            Ex_images[3] = new Image();
            Ex_images[3].src = 'Images/Ex4.png';
            Ex_images[4] = new Image();
            Ex_images[4].src = 'Images/Ex5.png';
            Ex_images[5] = new Image();
            Ex_images[5].src = 'Images/Ex6.png';
            var ExSound = new Audio();
            ExSound.src = "Sounds\ExSound.mp3";
            var ShotSound = new Audio();
            ShotSound.src = "Sounds\laserShot.mp3";

            var AsteroidsImgs = [];
            AsteroidsImgs[0] = new Image();
            AsteroidsImgs[0].src = 'Images\S_Asteroid.png';
            AsteroidsImgs[1] = new Image();
            AsteroidsImgs[1].src = 'Images\M_asteroid.png';
            AsteroidsImgs[2] = new Image();
            AsteroidsImgs[2].src = 'Images\L_Asteroid.png';
           


          
            //מקשים
            var map = {
                37:false,//מקש שמאלי
                39:false, //מקש ימני
                38:false, //מקש עליון
                40:false, //מקש תחתון
                32: false, //מקש רווח
                27: false,
               
            }

            addEventListener('keydown', function (event) {
                console.log(event);
                if (event.keyCode in map) {
                   
                    map[event.keyCode] = true;

                    if (map[27])  
                    {
                        debugger;
                        pause = !pause;
                    }
                    
                   
                    if (map[32])//יריה
                    {
                        //pause = !pause;
                        fire();
                        
                            
                        
                    }
                    if (map[38] && map[37])//אלכסון שמאל למעלה
                    {
                        //Player1.x += -15;
                        debugger;
                        player.x += -15 * ShipSpeed;
                        player.y += -15 * ShipSpeed;

                    }
                    else if (map[38] && map[39])//אלכסון ימין למעלה
                    {
                        
                        player.x += 15 * ShipSpeed;
                        player.y += -15 * ShipSpeed;

                    }
                    else if (map[40] && map[37])//אלכסון שמאל מטה
                    {
                        
                        player.x += -15 * ShipSpeed;
                        player.y += 15 * ShipSpeed;

                    }
                    else if (map[40] && map[39])//אלכסון ימין מטה
                    {
                       
                        player.x += 15 * ShipSpeed;
                        player.y += 15 * ShipSpeed;

                    }
                    else if (map[37])
                    {
                        player.x += -15 * ShipSpeed;

                    }
                    else if (map[39])
                    {
                        
                        player.x += 15 * ShipSpeed;
                    }
                    else if (map[38])
                    {
                        
                        player.y += -15 * ShipSpeed;
                    }
                    else if (map[40])
                    {
                        player.y += 15 * ShipSpeed;
                    }
                   
                 
                    
                }


            });
            
            addEventListener('keyup', function (event) {
                if (event.keyCode in map) {
                    map[event.keyCode] = false;
                }
            });
          

            function Vector(magnitude, angle) {
                var angleRadians = (angle * Math.PI) / 180;

                this.magnitudeX = magnitude * Math.cos(angleRadians);
                this.magnitudeY = magnitude * Math.sin(angleRadians);
            }

            function distanceAndAngleBetweenTwoPoints(x1, y1, x2, y2) {
                var x = x2 - x1,
                  y = y2 - y1;

                return {
                    
                    distance: Math.sqrt(x * x + y * y),

                    // ממיר למעלות מרדיאן
                    angle: Math.atan2(y, x) * 180 / Math.PI
                }
            }

      
            
            /////////////////////////////////////////////////////////////////////////////////////
            //הגדרות שחקן
            var player = {},
                player_width = Number(ShipW),
                player_height = Number(ShipH),
                player_img = new Image();
            player_img.src = ShipCode;
            

            //יצירת שחקן
           
            player = {
                
                    width: player_width,
                    height: player_height,
                    
                    x: (innerWidth / 2) - (player_width / 2),
                    y: innerHeight - (player_height + 10),
                    power: 5,
                    draw: function () {

                        if (this.x <= 0)
                        {
                            this.x = 0;

                        }
                        else if (this.x >= (innerWidth - this.width))
                        {
                            this.x = innerWidth - this.width;
                        }

                        if (this.y <= 0) {
                            this.y = 0;

                        }
                        else if (this.y >= (innerHeight - 35 - this.height)) {
                            this.y = (innerHeight - 35 - this.height);
                        }
                        c.drawImage(player_img, this.x, this.y, this.width, this.height);
                        
                    }
                  

                };
                
               //////////////////////////////////////////////////////////////////////////////////////// 
            //הגדרות אוייבים
            var enemyArray = [],

                enemyIndex = 0,
                enemy_width = 49,
                enemy_height = 49,
                enemy_timer = 1000,
                enemy_imgEx = new Image();
                enemy_imgEx.src = 'Images/Ex2.png';
                enemy_img=new Image();
                enemy_img.src = 'Images/enemy1.png';
             
            
            

            //יצירת האויב
                function enemy(x, y, dx, dy, enemy_img, enemy_width, enemy_height, rotation, imgEx)
                {
                    
                    this.x = x;
                    this.y = y;
                    this.dx = dx;
                    this.dy = dy;
                    this.img = enemy_img;
                    this.width = enemy_width;
                    this.height = enemy_height;
                    this.rotation = rotation;
                    this.imgEx = imgEx;
                    enemyIndex++;
                    enemyArray[enemyIndex] = this;
                    this.id = enemyIndex;

                    if (this.rotation < 0.2)
                    {
                        this.dx=-this.dx
                    }
                    else if (this.rotation > 0.7) {
                        this.dx = -this.dx;

                    }
                    else {
                        this.dx = 0;
                        this.dy = this.dy;
                    }

                    this.update = function () {
                        this.y += this.dy;
                        this.x += this.dx;
                        if (this.x + this.width >= innerWidth) {
                            this.dx = -this.dx;
                        }
                        else if (this.x <= 0) {
                            this.dx = Math.abs(this.dx)
                        }
                        if (this.y >= innerHeightScreenPlay - this.height) {
                            this.delete();
                        }
                        this.draw();
                        
                    }

                    this.delete = function () {
                      
                        delete enemyArray[this.id];
                    }
                    this.explotion = function () {
                        
                        var i;
                        for (i = 0; i < 6; i++)
                        {
                         c.drawImage(this.imgEx[i], this.x, this.y, this.width, this.height);
                        }
                        ExSound.play();
                    }
                    this.draw = function () {
                        c.drawImage(this.img, this.x, this.y, this.width, this.height);
                    }
                   
                }



            //פעולת יצירת האוייב

                function create_enemy() {
                    var speed = Math.random() * (3)+2;
                    var x = Math.random() * (innerWidth - enemy_width);
                    var y = 50-enemy_height;
                    var dx = 1*speed;
                    var dy = 1*speed;
                    var rotation = Math.random();
                    new enemy(x, y, dx, dy, enemy_img, enemy_width, enemy_height, rotation, Ex_images);


                }

            ////////////////////////////////////////////////////////////////////////////////////////
                //הגדרות בוס
               
             
                var boss = {},
                boss_width = 180,
                 boss_height = 162,
                 boss_live = 5000,
                 boss_Maxlive=5000,
                 boss_exist=false,
                 boss_img = new Image();
               boss_img.src = 'Images/boss.png';



               boss ={
              
                   boss_exist: boss_exist,
                   x: (innerWidth/2)-(boss_width/2),
                   y: 200 - (boss_height),
                   boss_live: boss_live,
                   img: boss_img,
                   width: boss_width,
                   height: boss_height,
                 

                   draw: function () {
                       
                       c.drawImage(boss_img, this.x, this.y, this.width, this.height);
                       if (boss_live >= boss_Maxlive * 0.3) {
                           c.fillStyle = 'green';
                       }
                       else {
                           c.fillStyle = 'red';
                       }
                       var hpWidth = 180 * boss_live / boss_Maxlive;
                       if (hpWidth < 0) {
                           width = 0;
                       }
                       c.fillRect((innerWidth / 2) - (boss_width / 2), 165 - (boss_height), hpWidth, 25);
                       c.strokeStyle = 'gray';
                       c.strokeRect((innerWidth / 2) - (boss_width / 2), 165 - (boss_height),180, 25);
                      
                       
                           
                   }
                  
               };





               //הגדרות תחמושת
               var bossRocketsArray = [],

                       bossRocketIndex = 0,
                       bossRocket_width = 60,
                       bossRocket_height = 50,
                       bossRocket_last_time = 0,
                       bossRocket_timer = 200,
                   bossRocket_img = new Image();
               bossRocket_img.src = 'Images/RedLaserBullet.png';




               //יצירת תחמושת
               function bossRocket(x, y, width, height, bossRocket_img, target_x, target_y) {
                   this.x = x;
                   this.y = y;
                   this.width = width;
                   this.height = height;
                   this.speed = speed;
                   this.img = bossRocket_img;
                   
                 
                   var data = distanceAndAngleBetweenTwoPoints(target_x, target_y, this.x, this.y);
                   
                   debugger;
                   var speed = data.distance / 10;
                   
                   bossRocketIndex++;
                   bossRocketsArray[bossRocketIndex] = this;
                   
                   var rocketVector = new Vector(speed, data.angle);
                   
                   ////var vector_x = (target_x - this.x);
                   ////var vector_y = target_y - this.y;
                   //var m = (((target_x - this.x)/target_y - this.y));//to fix
                   //m = Math.abs(m);
                   //var xDirection = (((target_x - this.x)))/this.speed;
                   //var yDirection = (((target_y - this.y) * m) / this.speed);
                   this.id = bossRocketIndex;

                   this.update = function () {
                       
                       

                       this.x +=rocketVector.magnitudeX/-15;
                       
                       this.y += rocketVector.magnitudeY/-15;
                       
                       if (this.y + this.height  >= innerHeightScreenPlay) {
                           delete this.delete();
                          
                       }
                       

                       this.draw();

                   }

                   this.delete = function () {

                       delete bossRocketsArray[this.id];


                   }
                   this.explotion = function () {

                       var i;
                       for (i = 0; i < 6; i++) {
                           c.drawImage(Ex_images[i], this.x, this.y, this.width, this.height);

                       }
                       ExSound.play();
                   }

                   this.draw = function () {
                       
                       c.drawImage(this.img, this.x, this.y, this.width, this.height);
                       
                       

                   }
               }

               //יריה

               function bossRocketFire() {
                   
                   var x = (boss.x + boss.width / 2) - bossRocket_width / 2;
                   var y = boss.y+boss.height-75;
                       new bossRocket(x, y, bossRocket_width, bossRocket_height, bossRocket_img,player.x,player.y);
                       
                   



               }
             
              
            /////////////////////////////////////////////////////////////////////////////////////////
            //הגדרות חייל בונוס
               var bonusArray = [],
              bonusIndex = 0,
               bonus_width = 39,
               bonus_height = 39,
               bonus_timer = 1000,
               bonus_img = new Image();
               bonus_img.src = 'Images/enemyBonus.png';


               //יצירת בונוס
               function bonus(x, y, dx, dy, bonus_img, bonus_width, bonus_height, rotation) {

                   this.x = x;
                   this.y = y;
                   this.dx = dx;
                   this.dy = dy;
                   this.bonus_img = bonus_img;
                   this.width = bonus_width;
                   this.height = bonus_height;
                   this.rotation = rotation;
                   bonusIndex++;
                   bonusArray[bonusIndex] = this;
                   this.id = bonusIndex;

                   if (this.rotation < 0.2) {
                       this.dx = -this.dx
                   }
                   else if (this.rotation > 0.7) {
                       this.dx = -this.dx;

                   }
                   else {
                       this.dx = 0;
                       this.dy = this.dy;
                   }

                   this.update = function () {
                       this.y += this.dy;
                       this.x += this.dx;
                       if (this.x + this.width >= innerWidth) {
                           this.dx = -this.dx;
                       }
                       else if (this.x <= 0) {
                           this.dx = Math.abs(this.dx)
                       }
                       if (this.y >= innerHeightScreenPlay - this.height) {
                           this.delete();
                       }
                       this.draw();

                   }

                   this.delete = function () {
                       delete bonusArray[this.id];
                   }
                   this.explotion = function () {

                       var i;
                       for (i = 0; i < 6; i++) {
                           c.drawImage(Ex_images[i], this.x, this.y, this.width, this.height);
                       }
                       ExSound.play();
                   }
                   this.draw = function () {
                       c.drawImage(this.bonus_img, this.x, this.y, this.width, this.height);
                      
                   }
               }



               //פעולת יצירת הבונוס

               function create_bonus() {
                   var speed = Math.random() * (6) + 4;
                   var x = Math.random() * (innerWidth - bonus_width);
                   var y = 50 - bonus_height;
                   var dx = 1 * speed;
                   var dy = 1 * speed;
                   var rotation = Math.random();
                   new bonus(x, y, dx, dy, bonus_img, bonus_width, bonus_height, rotation);


               }
            /////////////////////////////////////////////////////////////////////////////////////////
            //הגדרות תחמושת
            var bulletsArray = [],
             
                    bulletIndex = 0,
                    bullet_width = 15,
                    bullet_height = 22,
                    speed = 10,
                    bullet_last_time = 0,
                    bullet_timer = 200,
                bullet_img = new Image();
                bullet_img.src = 'Images/bullet.png';
                



            //יצירת תחמושת
                function bullet(x, y, width, height, speed, bullet_img) {
                    this.x = x;
                    this.y = y;
                    this.width = width;
                    this.height = height;
                    this.speed = speed;
                    this.img = bullet_img;
                   
                    bulletIndex++;
                    bulletsArray[bulletIndex] = this;
                    bulletsLimIndex++;
                    
                    this.id = bulletIndex;

                    this.update = function () {

                        this.y += -this.speed;
                        if (this.y < -this.height)
                        {
                          delete this.delete();
                            check++;
                        }
                        
                        this.draw();
                        
                    }

                    this.delete = function () {
                       
                        delete bulletsArray[this.id];
                        

                    }
                    this.explotion = function () {

                        var i;
                        for (i = 0; i < 6; i++) {
                            c.drawImage(Ex_images[i], this.x, this.y, this.width, this.height);
                        }
                        ExSound.play();
                    }
                
                    this.draw = function () {
                        c.drawImage(this.img, this.x, this.y, this.width, this.height);

                    }
                }

            //יריה

                function fire() {
                    if (bulletsLimIndex < maxShots) {
                        var x = (player.x + player.width / 2) - bullet_width / 2;
                        var y = player.y;
                        new bullet(x, y, bullet_width, bullet_height, speed, bullet_img);
                        ShotsCounter++;
                    }
                    
                        
                    
                }

                
            /////////////////////////////////////////////////////////////////////////////////

           
            var AsteroidsArray = [],

                  AsteroidIndex = 0,
                  Asteroid_width = 71,
                  Asteroid_height = 79,
                 Asteroid_timer = 1000,
                  Asteroid_imgEx = new Image();
            Asteroid_imgEx.src = 'Images/Ex2.png';
            Asteroid_img = new Image();
            Asteroid_img.src = 'Images/M_asteroid.png';




                //יצירת אסטרואיד
            function Asteroid(x, y, dx, dy, Asteroid_img, Asteroid_width, Asteroid_height, rotation, imgEx) {

                    this.x = x;
                    this.y = y;
                    this.dx = dx;
                    this.dy = dy;
                    this.img = Asteroid_img;
                    this.width = Asteroid_width;
                    this.height = Asteroid_height;
                    this.rotation = rotation;
                    this.imgEx = imgEx;
                    AsteroidIndex++;
                    AsteroidsArray[AsteroidIndex] = this;
                    this.id = AsteroidIndex;

                
                        this.dx = 0;
                        this.dy = this.dy;
                    

                    this.update = function () {
                        this.y += this.dy;
                        this.x += this.dx;
                        if (this.x + this.width >= innerWidth) {
                            this.dx = -this.dx;
                        }
                        else if (this.x <= 0) {
                            this.dx = Math.abs(this.dx)
                        }
                        if (this.y >= innerHeightScreenPlay - this.height) {
                            this.delete();
                        }
                        this.draw();

                    }

                    this.delete = function () {

                        delete AsteroidsArray[this.id];
                    }
                    this.explotion = function () {

                        var i;
                        for (i = 0; i < 6; i++) {
                            c.drawImage(this.imgEx[i], this.x, this.y, this.width, this.height);
                        }
                        ExSound.play();
                    }
                    this.draw = function () {
                        c.drawImage(this.img, this.x, this.y, this.width, this.height);
                    }

            }
            function create_Asteroid() {
                var speed = Math.random() * (2) + 2;
                var x = Math.random() * (innerWidth - Asteroid_width);
                var y = 50 - Asteroid_height;
                var dx = 1 * speed;
                var dy = 1 * speed;
                var rotation = 1;
                new Asteroid(x, y, dx, dy, Asteroid_img, Asteroid_width, Asteroid_height, rotation, Ex_images);


            }

            /////////////////////////////////////////////////////////////////////////////////
            //בדיקת פגיעה
                function collides(a, b) {
                    return a.x < (b.x + b.width-6) && (a.x + a.width-6) > b.x && a.y < (b.y + b.height-20) && (a.y + a.height-20) > b.y;
                }
            //בדיקת פגיעה בבוס
                function collidesBoss(a, b) {
                    return a.x < b.x + b.width && a.x + a.width > b.x && a.y < (b.y + b.height - 35) && (a.y + a.height - 35) > b.y;
                }

                function collidesWithPlayer(a, b)
                {
                    return a.x+5 < (b.x + b.width - 6) && (a.x + a.width - 6) > b.x && a.y < (b.y + b.height - 25) && (a.y + a.height - 25) > b.y;

                }
            
                function handlecollisions() {
                    bulletsArray.forEach(function (bullet)//בודק פגיעה באויב 
                    {
                        enemyArray.forEach(function (enemy) {
                            if (collides(bullet, enemy))
                            {
                               
                               enemy.explotion();
                                bullet.delete();
                                enemy.delete();
                                score += 10;
                                earnedExp += 50;
                                haveExp += 50;
                                totalExp += 50;
                                
                            }
                        });

                       bonusArray.forEach(function (bonus) {
                           if (collides(bullet, bonus)) {
                               bonus.explotion();
                                bullet.delete();
                                bonus.delete();
                                score += 100;
                                earnedExp += 300;
                                haveExp += 300;
                                totalExp += 300;
                            }
                       });

                       AsteroidsArray.forEach(function (Asteroid) {
                           if (collidesWithPlayer(bullet, Asteroid)) {
                              
                               bullet.delete();
                               

                           }
                       });
                        
                        
                    });

                    enemyArray.forEach(function (enemy)//בודק  פגיעה בשחקן
                    {
                        if (collidesWithPlayer(player, enemy)) {
                            player.power += -1;
                            enemy.delete();
                            
                        }
                    });
                    bonusArray.forEach(function (bonus) {
                        if (collidesWithPlayer(player, bonus)) {
                            player.power += -2;
                            if (player.power < 0)
                                player.power = 0;
                            bonus.delete();
                            

                        }
                    });


                    bossRocketsArray.forEach(function (bossRocket) {
                        if (collidesWithPlayer(player, bossRocket)) {
                            player.power += -1;
                            if (player.power < 0)
                                player.power = 0;
                            bossRocket.delete();


                        }
                    });
                    
                    AsteroidsArray.forEach(function (Asteroid) {
                        if (collidesWithPlayer(player, Asteroid)) {

                            
                            player.power += -2;
                            if (player.power < 0)
                                player.power = 0;
                            Asteroid.delete();

                        }
                    });

                }

                function handelBosscollisions(currentTime)
                {
                    if (currentTime >= bossT) {
                        if (collidesBoss(player,boss)){
                            player.power=0;

                        }
                        bulletsArray.forEach(function (bullet)//בודק פגיעה באויב 
                        {
                            if (collidesBoss(bullet, boss))
                            {
                            
                                bullet.explotion();
                                setTimeout(bullet.delete(),1000)
                                bullet.delete();
                                boss_live += -10 * damage;
                            
                            }
                       
                        });

                    
                    }}

            //////////////////////////////////////////////////////////////////////////////
                function gunPause(currentTime) {
                    if (ShotsCounter == 20||!canShot) {
                        canShot = false()
                        var time = currentTime;//זמן תחילת ההקפאה
                        var realTime = time;
                        if (currentTime < time + 5000) {
                            if (currentTime = realTime + 1000) {
                                realTime = currentTime;
                                ShotsCounter += -4;
                            }
                        }
                        else {
                            canShot = true;
                        }
                    }
                    
                        
                    
                    

                }
               ////////////////////////////////////////////////////////////////////
                function setData(points,time,win) {//מעדכן את הנתונים של המשחק לדטה בייס
                    debugger;
                    document.getElementById('<%= hdfPoints.ClientID %>').value = points;
                    document.getElementById('<%= hdfTime.ClientID %>').value = time;
                    document.getElementById('<%= hdfWin.ClientID %>').value = win;
                    document.getElementById('<%= hdfUpdateTotalExp.ClientID %>').value = totalExp;//כמות האקספי של השחקן
                    document.getElementById('<%= hdfUpdateLevel.ClientID %>').value=playerLevel+levelsUp;//רמת השחקן
                   
                 
                    document.getElementById('<%=data.ClientID %>').click();
           
                }
            function checkExp()
            {
                if (haveExp >= needExp)
                {
                    debugger;
                    haveExp = 0;
                    levelsUp += 1;
                    //playerLevel += 1;
                    needExp = 1000 * (playerLevel+levelsUp);
                    needTotalExp += needExp;
                }
            }
            

            /////////////////////////////////////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////////////////////////////////
            function animate(currentTime)//לולאת אנימציה
            {



                checkExp();
                    var dif = 26;
                    var bonus_rand = Math.random() * 14;
                    var asteroid_rand = Math.random() * 30;
                    var bossAmmo_rand = Math.random() * 1000;
                    var animation = requestAnimationFrame(animate);

                    //if (pause) {
                    //    if (!hasPause)
                    //    {
                    //        currentTime = currentTime;
                    //    }
                    //    c.fon = '22px ariel';
                    //    c.fillStyle = '#ffcc00';
                    //    c.fillText('PAUSE', -30+innerWidth / 2, innerHeight / 3);
                    //    return;
                    //}
                    c.clearRect(0, 0, canvas.width, canvas.height);
                    handlecollisions();
                    handelBosscollisions(currentTime);
                    //ניקוד
                    c.fon = '22px ariel';
                    c.fillStyle = '#fff';
                    c.fillText('SCORE: ' + score, 10, 30);

                    //כח
                    c.font = '22px ariel';
                    c.fillStyle = '#fff';
                    c.fillText('POWER: ' + player.power, innerWidth - 130, 30);

                    //מצייר שחקן
                    player.draw();
                    //Player1.draw();


                    c.font = '22px ariel';
                    c.fillStyle = '#fff';
                   
                    c.fillText('time: ' + parseFloat(currentTime / 1000).toFixed(3), innerWidth - 120, innerHeight - 50);
                    if (bulletsLimIndex <= maxShots / 3) {
                        c.fillStyle = 'green';
                    }
                    else if (bulletsLimIndex <= 2 * (maxShots / 3)) {
                        c.fillStyle = 'Chocolate    ';
                    }
                    else {
                        c.fillStyle = 'red';
                    }

                    c.fillRect(innerWidth * 0.96, innerHeight - 250, 25, (-1) * bulletsLimIndex * 2.2);
                    c.strokeStyle = 'gray';
                    c.strokeRect(innerWidth * 0.96, innerHeight - 250, 25, (-1) * maxShots * 2.2);



                    c.fillStyle = 'black';
                    c.fillRect(150, innerHeight - 30, innerWidth, 25);
                    c.fillStyle = "#66b01c";
                    c.fillRect(150, innerHeight - 30, (haveExp / needExp)*innerWidth, 25);
                    c.strokeStyle = 'gray';
                    c.strokeRect(150, innerHeight - 30, innerWidth, 25);




                    c.font = '22px ariel';
                    c.fillStyle = '#fff';
                    c.fillText(totalExp + '  [' + Math.round((haveExp / needExp)*100) + '%]', innerWidth - 130, innerHeight - 9);


                    c.font = '30px ariel';
                    c.fillStyle = '#fff';
                    c.fillText("Level: "+ (playerLevel+levelsUp), 0, innerHeight - 9);


                    //מגביר יריות
                    if (shoutDown) {


                        if (bulletLastTimeShot + 2400 < currentTime) {

                            shoutDown = false;
                            hasshoutDown = true;
                        }
                    }
                    else {
                        if (bulletLastTimeShot + 250 < currentTime) {

                            if (bulletsLimIndex >= maxShots && hasshoutDown == false) {
                                shoutDown = true;
                            }
                            if (hasshoutDown) {
                                hasshoutDown = false;
                            }

                            if (bulletsLimIndex > 0 && !shoutDown) {
                                bulletsLimIndex = bulletsLimIndex - 1;

                            }

                            if (!shoutDown) {
                                bulletLastTimeShot = currentTime;
                            }
                        }
                    }

                    if (boss_live <= boss_Maxlive * 0.3) {
                        if(boss_live>0)
                        {
                            if(bossAmmo_rand<3*((boss_Maxlive * 0.3)/boss_live))
                            {
                                bossRocketFire();
                            }
                        }
                    }

                    //יוצר אויב כל שניה
                    if ((currentTime) >= (lastTime + enemy_timer) - level) {
                        if (currentTime >= 10000) {

                            level = 300;


                        }

                        lastTime = currentTime;
                        create_enemy();


                        if (currentTime > 9000) {//יצירת בונוסים
                            if (bonus_rand > 11) {
                                create_bonus();

                            }
                        }
                        if (currentTime > 12000) {//יצירת אסטרואידים
                            if (asteroid_rand > dif) {
                                create_Asteroid();

                            }
                        }
                        if (currentTime > 18000) {
                            dif = 24;
                        }
                        if (currentTime > 18000) {
                            dif = 23;
                        } if (currentTime > 23000) {
                            dif = 20;
                        }
                        if (currentTime > lastTime + 600) {

                            lastTime = currentTime;
                            if (ShotsCounter > 0) {
                                ShotsCounter--;
                            }
                        }
                        if (currentTime > 35000 && boss_live < 3000) {
                            dif = 19;
                        }
                        if (currentTime > 35000 && boss_live < 1000) {
                            dif = 17;
                        }

                    }




                    if (currentTime >= bossT && player.power > 0 && boss_live > 0) {

                        boss.draw();

                    }
                    if (player.power > 0 && boss_live > 0) {
                        //מעדכן מיקום האויב
                        enemyArray.forEach(function (enemy) {
                            enemy.update();
                        }
                            );

                        AsteroidsArray.forEach(function (Asteroid) {
                            Asteroid.update();
                        }
                        );


                        bulletsArray.forEach(function (bullet) {
                            bullet.update();

                        });

                        bossRocketsArray.forEach(function (bossRocket) {
                            
                            bossRocket.update();

                        });
                        
                        bonusArray.forEach(function (bonus) {
                            bonus.update();
                        });
                    }
                    //בדיקת פגיעה

                    //בדיקת חיי שחקן
                    if (boss_live <= 0) {
                        IsWin = 1;
                        score += 1000;
                        earnedExp += 1000;
                    }


                    if (end) {

                        sessionStorage.setItem("Time", (parseFloat(Total_time).toFixed(3)));

                        window.alert("yourTime:" + (parseFloat(Total_time).toFixed(3)));

                        cancelAnimationFrame(animation);

                    }
                    if (player.power <= 0 || boss_live <= 0 && !end) {
                        Total_time = parseFloat(currentTime / 1000).toFixed(3);
                        setData(score,Total_time,IsWin);
                        end = true;
                    }

                }
                    
                    animate();
                  
           
        </script>
       
    </body>
    
</asp:Content> 

